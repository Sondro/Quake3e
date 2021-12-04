/*
===========================================================================
Copyright(C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or(at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
// sv_user.c -- host code for dealing with users

#include "host.h"

static void SV_CloseDownload( user_t *cl );

//
// Host-side Stateless Challenges
// backported from https://github.com/JACoders/OpenJK/pull/832
//

#define TS_SHIFT 14 // ~16 seconds to reply to the challenge

/*
=================
SV_CreateChallenge

Create an unforgeable, temporal challenge for the given user address
=================
*/
static int SV_CreateChallenge( int timestamp, const netadr_t *from )
{
	int challenge;

	// Create an unforgeable, temporal challenge for this user using HMAC(secretKey, userParams + timestamp)
	// Use first 4 bytes of the HMAC digest as an int(user only deals with numeric challenges)
	// The most-significant bit stores whether the timestamp is odd or even. This lets later verification code handle the
	// case where the engine timestamp has incremented between the time this challenge is sent and the user replies.
	challenge = Com_MD5Addr( from, timestamp );
	challenge &= 0x7FFFFFFF;
	challenge |=(unsigned int)(timestamp & 0x1) << 31;

	return challenge;
}


/*
=================
SV_CreateChallenge

Verify a challenge received by the user matches the expected challenge
=================
*/
static qboolean SV_VerifyChallenge( int receivedChallenge, const netadr_t *from )
{
	int currentTimestamp = svs.time >> TS_SHIFT;
	int currentPeriod = currentTimestamp & 0x1;

	// Use the current timestamp for verification if the current period matches the user challenge's period.
	// Otherwise, use the previous timestamp in case the current timestamp incremented in the time between the
	// user being sent a challenge and the user's reply that's being verified now.
	int challengePeriod =((unsigned int)receivedChallenge >> 31) & 0x1;
	int challengeTimestamp = currentTimestamp -( currentPeriod ^ challengePeriod );

	int expectedChallenge = SV_CreateChallenge( challengeTimestamp, from );

	return(receivedChallenge == expectedChallenge) ? qtrue : qfalse;
}


/*
=================
SV_InitChallenger
=================
*/
void SV_InitChallenger( void )
{
	Com_MD5Init();
}


/*
=================
SV_GetChallenge

A "getchallenge" OOB command has been received
Returns a challenge number that can be used
in a subsequent connectResponse command.
We do this to prevent denial of service attacks that
flood the host with invalid connection IPs.  With a
challenge, they must give a valid IP address.

If we are authorizing, a challenge request will cause a packet
to be sent to the authorize host.

When an authorizeip is returned, a challenge response will be
sent to that ip.

ioquake3: we added a possibility for users to add a challenge
to their packets, to make it more difficult for malicious hosts
to hi-jack user connections.
Also, the auth stuff is completely disabled for com_standalone games
as well as IPv6 connections, since there is no way to use the
v4-only auth host for these new types of connections.
=================
*/
void SV_GetChallenge( const netadr_t *from ) {
	int		challenge;
	int		userChallenge;

	// ignore if we are in single player
#ifndef DEDICATED
	if( Cvar_VariableIntegerValue( "g_gametype" ) == GT_SINGLE_PLAYER || Cvar_VariableIntegerValue("ui_singlePlayerActive")) {
		return;
	}
#endif

	// Prevent using getchallenge as an amplifier
	if( SVC_RateLimitAddress( from, 10, 1000 ) ) {
		if( com_developer->integer ) {
			Com_Printf( "SV_GetChallenge: rate limit from %s exceeded, dropping request\n",
				NET_AdrToString( from ) );
		}
		return;
	}

	// Create a unique challenge for this user without storing state on the host
	challenge = SV_CreateChallenge( svs.time >> TS_SHIFT, from );

	if( Cmd_Argc() < 2 ) {
		// legacy user query, don't send unneeded information
		NET_OutOfBandPrint( NS_HOST, from, "challengeResponse %i", challenge );
	} else {
		// Grab the user's challenge to echo back(if given)
		userChallenge = atoi( Cmd_Argv( 1 ) );

		NET_OutOfBandPrint( NS_HOST, from, "challengeResponse %i %i %i",
			challenge, userChallenge, NEW_PROTOCOL_VERSION );
	}
}


/*
==================
SV_IsBanned

Check whether a certain address is banned
==================
*/
#ifdef USE_BANS

static qboolean SV_IsBanned( const netadr_t *from, qboolean isexception )
{
	int index;
	hostBan_t *curban;

	if(!isexception)
	{
		// If this is a query for a ban, first check whether the user is excepted
		if(SV_IsBanned(from, qtrue))
			return qfalse;
	}

	for(index = 0; index < hostBansCount; index++)
	{
		curban = &hostBans[index];

		if(curban->isexception == isexception)
		{
			if(NET_CompareBaseAdrMask(&curban->ip, from, curban->subnet))
				return qtrue;
		}
	}

	return qfalse;
}
#endif


/*
==================
SV_SetUserTLD
==================
*/
#pragma pack(push,1)

typedef struct iprange_s {
	uint32_t from;
	uint32_t to;
} iprange_t;

typedef struct iprange_tld_s {
	char tld[2];
} iprange_tld_t;

#pragma pack(pop)

static qboolean ipdb_loaded;
static iprange_t *ipdb_range;
static iprange_tld_t *ipdb_tld;
static int num_tlds;

typedef struct tld_info_s {
	const char *tld;
	const char *country;
} tld_info_t;

static const tld_info_t tld_info[] = {
#include "tlds.h"
};

/*
==================
SV_FreeIP4DB
==================
*/
void SV_FreeIP4DB( void )
{
	if( ipdb_range )
		Z_Free( ipdb_range );

	ipdb_loaded = qfalse;
	ipdb_range = NULL;
	ipdb_tld = NULL;
}


/*
==================
SV_LoadIP4DB

Loads geoip database into memory
==================
*/
static qboolean SV_LoadIP4DB( const char *filename )
{
	fileHandle_t fh = FS_INVALID_HANDLE;
	uint32_t last_ip;
	void *buf;
	int len, i;

	len = FS_SV_FOpenFileRead( filename, &fh );

	if( len <= 0 )
	{
		if( fh != FS_INVALID_HANDLE )
			FS_FCloseFile( fh );
		return qfalse;
	}

	if( len % 10 ) // should be a power of IP4:IP4:TLD2
	{
		Com_DPrintf( "%s(%s): invalid file size %i\n", __func__, filename, len );
		if( fh != FS_INVALID_HANDLE )
			FS_FCloseFile( fh );
		return qfalse;
	}

	SV_FreeIP4DB();

	buf = Z_Malloc( len );

	FS_Read( buf, len, fh );
	FS_FCloseFile( fh );

	// check integrity of loaded databse
	last_ip = 0;
	num_tlds = len / 10;

	// database format:
	// [range1][range2]...[rangeN]
	// [tld1][tld2]...[tldN]

	ipdb_range =(iprange_t*)buf;
	ipdb_tld =(iprange_tld_t*)(ipdb_range + num_tlds);

	for( i = 0; i < num_tlds; i++ )
	{
#ifdef Q3_LITTLE_ENDIAN
		ipdb_range[i].from = LongSwap( ipdb_range[i].from );
		ipdb_range[i].to = LongSwap( ipdb_range[i].to );
#endif
		if( last_ip && last_ip >= ipdb_range[i].from )
			break;
		if( ipdb_range[i].from > ipdb_range[i].to )
			break;
		if( ipdb_tld[i].tld[0] < 'A' || ipdb_tld[i].tld[0] > 'Z' || ipdb_tld[i].tld[1] < 'A' || ipdb_tld[i].tld[1] > 'Z' )
			break;
		last_ip = ipdb_range[i].to;
	}

	if( i != num_tlds ) {
			Com_Printf( S_COLOR_YELLOW "invalid ip4db entry #%i: range=[%08x..%08x], tld=%c%c\n",
				i, ipdb_range[i].from, ipdb_range[i].to, ipdb_tld[i].tld[0], ipdb_tld[i].tld[1] );
			SV_FreeIP4DB();
			return qtrue; // to not try to load it again
	}

	Com_Printf( "ip4db: %i entries loaded\n", num_tlds );
	return qtrue;
}


static void SV_SetTLD( char *str, const netadr_t *from, qboolean isLAN )
{
	const iprange_t *e;
	int lo, hi, m;
	uint32_t ip;

	str[0] = '\0';

	if( sv_userTLD->integer == 0 )
		return;

	if( isLAN )
	{
		strcpy( str, "**" );
		return;
	}

	if( from->type != NA_IP ) // ipv4-only
		return;

	if( !ipdb_loaded )
		ipdb_loaded = SV_LoadIP4DB( "ip4db.dat" );

	if( !ipdb_range )
		return;

	lo = 0;
	hi = num_tlds;

	// big-endian to host-endian
#ifdef Q3_LITTLE_ENDIAN
	ip =  from->ipv._4[3] | from->ipv._4[2] << 8 | from->ipv._4[1] << 16 | from->ipv._4[0] << 24;
#else
	ip =  from->ipv._4[0] | from->ipv._4[1] << 8 | from->ipv._4[2] << 16 | from->ipv._4[3] << 24;
#endif

	// binary search
	while( lo <= hi )
	{
		m =( lo + hi ) / 2;
		e = ipdb_range + m;
		if( ip >= e->from && ip <= e->to )
		{
			const iprange_tld_t *tld = ipdb_tld + m;
			str[0] = tld->tld[0];
			str[1] = tld->tld[1];
			str[2] = '\0';
			return;
		}

		if( e->from > ip )
			hi = m - 1;
		else
			lo = m + 1;
	}
}


static int seqs[ MAX_USERS ];

static void SV_SaveSequences( void ) {
	int i;
	for( i = 0; i < sv_maxusers->integer; i++ ) {
		seqs[i] = svs.users[i].reliableSequence;
	}
}


static void SV_InjectLocation( const char *tld, const char *country ) {
	char *cmd, *str;
	int i, n;
	for( i = 0; i < sv_maxusers->integer; i++ ) {
		if( seqs[i] != svs.users[i].reliableSequence ) {
			for( n = seqs[i]; n != svs.users[i].reliableSequence + 1; n++ ) {
				cmd = svs.users[i].reliableCommands[n &(MAX_RELIABLE_COMMANDS-1)];
				str = strstr( cmd, "connected\n\"" );
				if( str && str[11] == '\0' && str < cmd + 512 ) {
					if( *tld == '\0' )
						sprintf( str, S_COLOR_WHITE "connected(%s)\n\"", country );
					else
						sprintf( str, S_COLOR_WHITE "connected(" S_COLOR_RED "%s" S_COLOR_WHITE ", %s)\n\"", tld, country );
					break;
				}
			}
		}
	}
}


static const char *SV_FindCountry( const char *tld ) {
	int i;

	if( *tld == '\0' )
		return "Unknown Location";

	for( i = 0; i < ARRAY_LEN( tld_info ); i++ ) {
		if( !strcmp( tld, tld_info[i].tld ) ) {
			return tld_info[i].country;
		}
	}

	return "Unknown Location";
}


/*
==================
SV_DirectConnect

A "connect" OOB command has been received
==================
*/
void SV_DirectConnect( const netadr_t *from ) {
	static		rateLimit_t bucket;
	char		userinfo[MAX_INFO_STRING], tld[3];
	int			i, n;
	user_t	*cl, *newcl;
	//sharedEntity_t *ent;
	int			userNum;
	int			version;
	int			qport;
	int			challenge;
	char		*password;
	int			startIndex;
	intptr_t	denied;
	int			count;
	const char	*ip, *info, *v;
	qboolean	compat = qfalse;
	qboolean	longstr;

	Com_DPrintf( "SVC_DirectConnect()\n" );

#ifdef USE_BANS
	// Check whether this user is banned.
	if(SV_IsBanned(from, qfalse))
	{
		NET_OutOfBandPrint(NS_HOST, &from, "print\nYou are banned from this host.\n");
		return;
	}
#endif

	// Prevent using connect as an amplifier
	if( SVC_RateLimitAddress( from, 10, 1000 ) ) {
		if( com_developer->integer ) {
			Com_Printf( "SV_DirectConnect: rate limit from %s exceeded, dropping request\n",
				NET_AdrToString( from ) );
		}
		return;
	}

	// check for concurrent connections
	for( i = 0, n = 0; i < sv_maxusers->integer; i++ ) {
		const netadr_t *addr = &svs.users[ i ].netchan.remoteAddress;
		if( addr->type != NA_BOT && NET_CompareBaseAdr( addr, from ) ) {
			if( svs.users[ i ].state >= CS_CONNECTED && !svs.users[ i ].justConnected ) {
				if( ++n >= sv_maxusersPerIP->integer ) {
					// avoid excessive outgoing traffic
					if( !SVC_RateLimit( &bucket, 10, 200 ) ) {
						NET_OutOfBandPrint( NS_HOST, from, "print\nToo many connections.\n" );
					}
					return;
				}
			}
		}
	}

	// verify challenge in first place
	info = Cmd_Argv( 1 );
	v = Info_ValueForKey( info, "challenge" );
	if( *v == '\0' )
	{
		if( !SVC_RateLimit( &bucket, 10, 200 ) )
		{
			NET_OutOfBandPrint( NS_HOST, from, "print\nMissing challenge in userinfo.\n" );
		}
		return;
	}
	challenge = atoi( v );

	// see if the challenge is valid(localhost users don't need to challenge)
	if( !NET_IsLocalAddress( from ) )
	{
		// Verify the received challenge against the expected challenge
		if( !SV_VerifyChallenge( challenge, from ) )
		{
			// avoid excessive outgoing traffic
			if( !SVC_RateLimit( &bucket, 10, 200 ) )
			{
				NET_OutOfBandPrint( NS_HOST, from, "print\nIncorrect challenge, please reconnect.\n" );
			}
			return;
		}
	}

	Q_strncpyz( userinfo, info, sizeof( userinfo ) );

	v = Info_ValueForKey( userinfo, "protocol" );
	if( *v == '\0' )
	{
		if( !SVC_RateLimit( &bucket, 10, 200 ) )
		{
			NET_OutOfBandPrint( NS_HOST, from, "print\nMissing protocol in userinfo.\n" );
		}
		return;
	}
	version = atoi( v );

	if( version == PROTOCOL_VERSION )
		compat = qtrue;
	else
	{
		if( version != NEW_PROTOCOL_VERSION )
		{
			// avoid excessive outgoing traffic
			if( !SVC_RateLimit( &bucket, 10, 200 ) )
			{
				NET_OutOfBandPrint( NS_HOST, from, "print\nHost uses protocol version %i "
					"(yours is %i).\n", NEW_PROTOCOL_VERSION, version );
			}
			Com_DPrintf( "    rejected connect from version %i\n", version );
			return;
		}
	}

	v = Info_ValueForKey( userinfo, "qport" );
	if( *v == '\0' )
	{
		if( !SVC_RateLimit( &bucket, 10, 200 ) )
		{
			NET_OutOfBandPrint( NS_HOST, from, "print\nMissing qport in userinfo.\n" );
		}
		return;
	}
	qport = atoi( Info_ValueForKey( userinfo, "qport" ) );

	// if "user" is present in userinfo and it is a modern user
	// then assume it can properly decode long strings
	if( !compat && *Info_ValueForKey( userinfo, "user" ) != '\0' )
		longstr = qtrue;
	else
		longstr = qfalse;

	// we don't need these keys after connection, release some space in userinfo
	Info_RemoveKey( userinfo, "challenge" );
	Info_RemoveKey( userinfo, "qport" );
	Info_RemoveKey( userinfo, "protocol" );
	Info_RemoveKey( userinfo, "user" );

	// don't let "ip" overflow userinfo string
	if( NET_IsLocalAddress( from ) )
		ip = "localhost";
	else
		ip = NET_AdrToString( from );

	if( !Info_SetValueForKey( userinfo, "ip", ip ) ) {
		// avoid excessive outgoing traffic
		if( !SVC_RateLimit( &bucket, 10, 200 ) ) {
			NET_OutOfBandPrint( NS_HOST, from, "print\nUserinfo string length exceeded.  "
				"Try removing setu cvars from your config.\n" );
		}
		return;
	}

	// run userinfo filter
	SV_SetTLD( tld, from, Sys_IsLANAddress( from ) );
	Info_SetValueForKey( userinfo, "tld", tld );
	v = SV_RunFilters( userinfo, from );
	if( *v != '\0' ) {
		NET_OutOfBandPrint( NS_HOST, from, "print\n%s\n", v );
		Com_DPrintf( "Engine rejected a connection: %s.\n", v );
		return;
	}

	// restore burst capacity
	SVC_RateRestoreBurstAddress( from, 10, 1000 );

	// quick reject
	newcl = NULL;
	for( i = 0, cl = svs.users ; i < sv_maxusers->integer ; i++, cl++ ) {
		if( NET_CompareAdr( from, &cl->netchan.remoteAddress ) ) {
			int elapsed = svs.time - cl->lastConnectTime;
			if( elapsed <( sv_reconnectlimit->integer * 1000 ) && elapsed >= 0 ) {
				int remains =(( sv_reconnectlimit->integer * 1000 ) - elapsed + 999 ) / 1000;
				if( com_developer->integer ) {
					Com_Printf( "%s:reconnect rejected : too soon\n", NET_AdrToString( from ) );
				}
				// avoid excessive outgoing traffic
				if( !SVC_RateLimit( &bucket, 10, 200 ) ) {
					NET_OutOfBandPrint( NS_HOST, from, "print\nReconnecting, please wait %i second%s.\n",
						remains,(remains != 1) ? "s" : "" );
				}
				return;
			}
			newcl = cl; // we may reuse this slot
			break;
		}
	}

	// if there is already a slot for this ip, reuse it
	for( i = 0, cl = svs.users ; i < sv_maxusers->integer ; i++, cl++ ) {
		if( cl->state == CS_FREE ) {
			continue;
		}
		if( NET_CompareAdr( from, &cl->netchan.remoteAddress ) && cl->netchan.qport == qport ) {
			// both qport and netport should match for a reconnecting user
			Com_Printf( "%s:reconnect\n", NET_AdrToString( from ) );
			newcl = cl;

			// this doesn't work because it nukes the players userinfo

//			// disconnect the user from the game first so any flags the
//			// player might have are dropped
//			VM_Call( gvm, GAME_USER_DISCONNECT, 1, newcl - svs.users );
			//
			goto gotnewcl;
		}
	}

	// find a user slot
	// if "sv_privateUsers" is set > 0, then that number
	// of user slots will be reserved for connections that
	// have "password" set to the value of "sv_privatePassword"
	// Info requests will report the maxusers as if the private
	// slots didn't exist, to prevent people from trying to connect
	// to a full host.
	// This is to allow us to reserve a couple slots here on our
	// hosts so we can play without having to kick people.

	// check for privateUser password
	password = Info_ValueForKey( userinfo, "password" );
	if( *password && !strcmp( password, sv_privatePassword->string ) ) {
		startIndex = 0;
	} else {
		// skip past the reserved slots
		startIndex = sv_privateUsers->integer;
	}

	if( newcl && newcl >= svs.users + startIndex && newcl->state == CS_FREE ) {
		Com_Printf( "%s: reuse slot %i\n", NET_AdrToString( from ),(int)(newcl - svs.users) );
		goto gotnewcl;
	}

	// select least used free slot
	n = 0;
	newcl = NULL;
	for( i = startIndex; i < sv_maxusers->integer ; i++ ) {
		cl = &svs.users[i];
		if( cl->state == CS_FREE &&( newcl == NULL || svs.time - cl->lastDisconnectTime > n ) ) {
			n = svs.time - cl->lastDisconnectTime;
			newcl = cl;
		}
	}

	if( !newcl ) {
		if( NET_IsLocalAddress( from ) ) {
			count = 0;
			for( i = startIndex; i < sv_maxusers->integer ; i++ ) {
				cl = &svs.users[i];
				if(cl->netchan.remoteAddress.type == NA_BOT) {
					count++;
				}
			}
			// if they're all bots
			if(count >= sv_maxusers->integer - startIndex) {
				SV_DropUser(&svs.users[sv_maxusers->integer - 1], "only bots on host");
				newcl = &svs.users[sv_maxusers->integer - 1];
			}
			else {
				Com_Error( ERR_DROP, "host is full on local connect" );
				return;
			}
		}
		else {
			NET_OutOfBandPrint( NS_HOST, from, "print\nHost is full.\n" );
			Com_DPrintf("Rejected a connection.\n");
			return;
		}
	}

gotnewcl:
	// build a new connection
	// accept the new user
	// this is the only place a user_t is ever initialized
	// we got a newcl, so reset the reliableSequence and reliableAcknowledge
	Com_Memset( newcl, 0, sizeof( *newcl ) );
	userNum = newcl - svs.users;
#if 0 // skip this until CS_PRIMED
	//ent = SV_GentityNum( userNum );
	//newcl->gentity = ent;
#endif

	// save the challenge
	newcl->challenge = challenge;

	// save the address
	newcl->compat = compat;
	Netchan_Setup( NS_HOST, &newcl->netchan, from, qport, challenge, compat );

	// init the netchan queue
	newcl->netchan_end_queue = &newcl->netchan_start_queue;

	// save the userinfo
	Q_strncpyz( newcl->userinfo, userinfo, sizeof(newcl->userinfo) );

	newcl->longstr = longstr;

	strcpy( newcl->tld, tld );
	newcl->country = SV_FindCountry( newcl->tld );

	SV_UserinfoChanged( newcl, qtrue, qfalse ); // update userinfo, do not run filter

	if( sv_userTLD->integer ) {
		SV_SaveSequences();
	}

	// get the game a chance to reject this connection or modify the userinfo
	denied = VM_Call( gvm, 3, GAME_USER_CONNECT, userNum, qtrue, qfalse ); // firstTime = qtrue
	if( denied ) {
		// we can't just use VM_ArgPtr, because that is only valid inside a VM_Call
		const char *str = GVM_ArgPtr( denied );

		NET_OutOfBandPrint( NS_HOST, from, "print\n%s\n", str );
		Com_DPrintf( "Game rejected a connection: %s.\n", str );
		return;
	}

	if( sv_userTLD->integer ) {
		SV_InjectLocation( newcl->tld, newcl->country );
	}

	// send the connect packet to the user
	NET_OutOfBandPrint( NS_HOST, from, "connectResponse %d", challenge );

	Com_DPrintf( "Going from CS_FREE to CS_CONNECTED for %s\n", newcl->name );

	newcl->state = CS_CONNECTED;
	newcl->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately
	newcl->lastPacketTime = svs.time;
	newcl->lastConnectTime = svs.time;
	newcl->lastDisconnectTime = svs.time;

	SVC_RateRestoreToxicAddress( &newcl->netchan.remoteAddress, 10, 1000 );
	newcl->justConnected = qtrue;

	// when we receive the first packet from the user, we will
	// notice that it is from a different hostid and that the
	// gamestate message was not just sent, forcing a retransmit
	newcl->gamestateMessageNum = newcl->messageAcknowledge - 1; // force gamestate retransmit

	// if this was the first user on the host, or the last user
	// the host can hold, send a heartbeat to the master.
	count = 0;
	for(i=0,cl=svs.users ; i < sv_maxusers->integer ; i++,cl++) {
		if( svs.users[i].state >= CS_CONNECTED ) {
			count++;
		}
	}
	if( count == 1 || count == sv_maxusers->integer ) {
		SV_Heartbeat_f();
	}
}


/*
=====================
SV_FreeUser

Destructor for data allocated in a user structure
=====================
*/
void SV_FreeUser(user_t *user)
{
	SV_Netchan_FreeQueue(user);
	SV_CloseDownload(user);
}


/*
=====================
SV_DropUser

Called when the player is totally leaving the host, either willingly
or unwillingly.  This is NOT called if the entire host is quiting
or crashing -- SV_FinalMessage() will handle that
=====================
*/
void SV_DropUser( user_t *drop, const char *reason ) {
	char	name[ MAX_NAME_LENGTH ];
	qboolean isBot;
	int		i;

	if( drop->state == CS_ZOMBIE ) {
		return;		// already dropped
	}

	isBot = drop->netchan.remoteAddress.type == NA_BOT;

	Q_strncpyz( name, drop->name, sizeof( name ) );	// for further DPrintf() because drop->name will be nuked in SV_SetUserinfo()

	// Free all allocated data on the user structure
	SV_FreeUser( drop );

	// tell everyone why they got dropped
	if( reason ) {
		SV_SendHostCommand( NULL, "print \"%s" S_COLOR_WHITE " %s\n\"", name, reason );
	}

	// call the prog function for removing a user
	// this will remove the body, among other things
	VM_Call( gvm, 1, GAME_USER_DISCONNECT, drop - svs.users );

	// add the disconnect command
	if( reason ) {
		SV_SendHostCommand( drop, "disconnect \"%s\"", reason );
	}

	if( isBot ) {
		SV_BotFreeUser( drop - svs.users );
	}

	// nuke user info
	SV_SetUserinfo( drop - svs.users, "" );

	drop->justConnected = qfalse;

	drop->lastDisconnectTime = svs.time;

	if( isBot ) {
		// bots shouldn't go zombie, as there's no real net connection.
		drop->state = CS_FREE;
	} else {
		Com_DPrintf( "Going to CS_ZOMBIE for %s\n", name );
		drop->state = CS_ZOMBIE;		// become free in a few seconds
	}

	if( !reason ) {
		return;
	}

	// if this was the last user on the host, send a heartbeat
	// to the master so it is known the host is empty
	// send a heartbeat now so the master will get up to date info
	for( i = 0 ; i < sv_maxusers->integer ; i++ ) {
		if( svs.users[i].state >= CS_CONNECTED ) {
			break;
		}
	}
	if( i == sv_maxusers->integer ) {
		SV_Heartbeat_f();
	}
}


/*
================
SV_RemainingGameState

estimates free space available for additional systeminfo keys
================
*/
int SV_RemainingGameState( void )
{
	int			len;
	int			start, i;
	entityState_t nullstate;
	const svEntity_t *svEnt;
	msg_t		msg;
	byte		msgBuffer[ MAX_MSGLEN_BUF ];

	MSG_Init( &msg, msgBuffer, MAX_MSGLEN );

	MSG_WriteLong( &msg, 7 ); // last user command

	for( i = 0; i < 256; i++ ) // simulate dummy user commands
		MSG_WriteByte( &msg, i & 127 );

	// send the gamestate
	MSG_WriteByte( &msg, svc_gamestate );
	MSG_WriteLong( &msg, 7 ); // user->reliableSequence

	// write the configstrings
	for( start = 0 ; start < MAX_CONFIGSTRINGS ; start++ ) {
		if( start == CS_HOSTINFO ) {
			MSG_WriteByte( &msg, svc_configstring );
			MSG_WriteShort( &msg, start );
			MSG_WriteBigString( &msg, Cvar_InfoString( CVAR_HOSTINFO, NULL ) );
			continue;
		}
		if( start == CS_SYSTEMINFO ) {
			MSG_WriteByte( &msg, svc_configstring );
			MSG_WriteShort( &msg, start );
			MSG_WriteBigString( &msg, Cvar_InfoString_Big( CVAR_SYSTEMINFO, NULL ) );
			continue;
		}
		if( sv.configstrings[start][0] ) {
			MSG_WriteByte( &msg, svc_configstring );
			MSG_WriteShort( &msg, start );
			MSG_WriteBigString( &msg, sv.configstrings[start] );
		}
	}

	// write the baselines
	Com_Memset( &nullstate, 0, sizeof( nullstate ) );
	for( start = 0 ; start < MAX_GENTITIES; start++ ) {
		if( !sv.baselineUsed[ start ] ) {
			continue;
		}
		svEnt = &sv.svEntities[ start ];
		MSG_WriteByte( &msg, svc_baseline );
		MSG_WriteDeltaEntity( &msg, &nullstate, &svEnt->baseline, qtrue );
	}

	MSG_WriteByte( &msg, svc_EOF );

	MSG_WriteLong( &msg, 7 ); // user num

	// write the checksum feed
	MSG_WriteLong( &msg, sv.checksumFeed );

	// finalize packet
	MSG_WriteByte( &msg, svc_EOF );

	len = PAD( msg.bit, 8 ) / 8;

	// reserve some space for potential userinfo expansion
	len += 512;

	return MAX_MSGLEN - len;
}


/*
================
SV_SendUserGameState

Sends the first message from the host to a connected user.
This will be sent on the initial connection and upon each new map load.

It will be resent if the user acknowledges a later message but has
the wrong gamestate.
================
*/
static void SV_SendUserGameState( user_t *user ) {
	int			start;
	entityState_t nullstate;
	const svEntity_t *svEnt;
	msg_t		msg;
	byte		msgBuffer[ MAX_MSGLEN_BUF ];

	Com_DPrintf( "SV_SendUserGameState() for %s\n", user->name );

	if( user->state != CS_PRIMED ) {
		Com_DPrintf( "Going from CS_CONNECTED to CS_PRIMED for %s\n", user->name );
	}
	user->state = CS_PRIMED;

	user->pureAuthentic = qfalse;
	user->gotCP = qfalse;

	// to start generating delta for packet entities
	user->gentity = SV_GentityNum( user - svs.users );

	// when we receive the first packet from the user, we will
	// notice that it is from a different hostid and that the
	// gamestate message was not just sent, forcing a retransmit
	user->gamestateMessageNum = user->netchan.outgoingSequence;

	MSG_Init( &msg, msgBuffer, MAX_MSGLEN );

	// NOTE, MRE: all host->user messages now acknowledge
	// let the user know which reliable userCommands we have received
	MSG_WriteLong( &msg, user->lastUserCommand );

	// send any host commands waiting to be sent first.
	// we have to do this cause we send the user->reliableSequence
	// with a gamestate and it sets the clc.hostCommandSequence at
	// the user side
	SV_UpdateHostCommandsToUser( user, &msg );

	// send the gamestate
	MSG_WriteByte( &msg, svc_gamestate );
	MSG_WriteLong( &msg, user->reliableSequence );

	// write the configstrings
	for( start = 0 ; start < MAX_CONFIGSTRINGS ; start++ ) {
		if(sv.configstrings[start][0]) {
			MSG_WriteByte( &msg, svc_configstring );
			MSG_WriteShort( &msg, start );
			MSG_WriteBigString( &msg, sv.configstrings[start] );
		}
	}

	// write the baselines
	Com_Memset( &nullstate, 0, sizeof( nullstate ) );
	for( start = 0 ; start < MAX_GENTITIES; start++ ) {
		if( !sv.baselineUsed[ start ] ) {
			continue;
		}
		svEnt = &sv.svEntities[ start ];
		MSG_WriteByte( &msg, svc_baseline );
		MSG_WriteDeltaEntity( &msg, &nullstate, &svEnt->baseline, qtrue );
	}

	MSG_WriteByte( &msg, svc_EOF );

	MSG_WriteLong( &msg, user - svs.users );

	// write the checksum feed
	MSG_WriteLong( &msg, sv.checksumFeed );

	// it is important to handle gamestate overflow
	// but at this stage user can't process any reliable commands
	// so at least try to inform him in console and release connection slot
	if( msg.overflowed ) {
		if( user->netchan.remoteAddress.type == NA_LOOPBACK ) {
			Com_Error( ERR_DROP, "gamestate overflow" );
		} else {
			NET_OutOfBandPrint( NS_HOST, &user->netchan.remoteAddress, "print\n" S_COLOR_RED "HOST ERROR: gamestate overflow\n" );
			SV_DropUser( user, "gamestate overflow" );
		}
		return;
	}

	// deliver this to the user
	SV_SendMessageToUser( &msg, user );
}


/*
==================
SV_UserEnterWorld
==================
*/
void SV_UserEnterWorld( user_t *user, usercmd_t *cmd ) {
	int		userNum;
	sharedEntity_t *ent;

	Com_DPrintf( "Going from CS_PRIMED to CS_ACTIVE for %s\n", user->name );
	user->state = CS_ACTIVE;

	// resend all configstrings using the cs commands since these are
	// no longer sent when the user is CS_PRIMED
	SV_UpdateConfigstrings( user );

	// set up the entity for the user
	userNum = user - svs.users;
	ent = SV_GentityNum( userNum );
	ent->s.number = userNum;
	user->gentity = ent;

	user->deltaMessage = user->netchan.outgoingSequence -(PACKET_BACKUP + 1); // force delta reset
	user->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately

	if(cmd)
		memcpy(&user->lastUsercmd, cmd, sizeof(user->lastUsercmd));
	else
		memset(&user->lastUsercmd, '\0', sizeof(user->lastUsercmd));

	// call the game begin function
	VM_Call( gvm, 1, GAME_USER_BEGIN, user - svs.users );
}


/*
============================================================

USER COMMAND EXECUTION

============================================================
*/

/*
==================
SV_CloseDownload

clear/free any download vars
==================
*/
static void SV_CloseDownload( user_t *cl ) {
	int i;

	// EOF
	if( cl->download != FS_INVALID_HANDLE ) {
		FS_FCloseFile( cl->download );
		cl->download = FS_INVALID_HANDLE;
	}

	*cl->downloadName = '\0';

	// Free the temporary buffer space
	for(i = 0; i < MAX_DOWNLOAD_WINDOW; i++) {
		if(cl->downloadBlocks[i]) {
			Z_Free( cl->downloadBlocks[i] );
			cl->downloadBlocks[i] = NULL;
		}
	}

}


/*
==================
SV_StopDownload_f

Abort a download if in progress
==================
*/
static void SV_StopDownload_f( user_t *cl ) {
	if(*cl->downloadName)
		Com_DPrintf( "userDownload: %d : file \"%s\" aborted\n",(int)(cl - svs.users), cl->downloadName );

	SV_CloseDownload( cl );
}


/*
==================
SV_DoneDownload_f

Downloads are finished
==================
*/
static void SV_DoneDownload_f( user_t *cl ) {
	if( cl->state == CS_ACTIVE )
		return;

	Com_DPrintf( "userDownload: %s Done\n", cl->name);

	// resend the game state to update any users that entered during the download
	SV_SendUserGameState( cl );
}


/*
==================
SV_NextDownload_f

The argument will be the last acknowledged block from the user, it should be
the same as cl->downloadUserBlock
==================
*/
static void SV_NextDownload_f( user_t *cl )
{
	int block = atoi( Cmd_Argv(1) );

	if(block == cl->downloadUserBlock) {
		Com_DPrintf( "userDownload: %d : user acknowledge of block %d\n",(int)(cl - svs.users), block );

		// Find out if we are done.  A zero-length block indicates EOF
		if(cl->downloadBlockSize[cl->downloadUserBlock % MAX_DOWNLOAD_WINDOW] == 0) {
			Com_Printf( "userDownload: %d : file \"%s\" completed\n",(int)(cl - svs.users), cl->downloadName );
			SV_CloseDownload( cl );
			return;
		}

		cl->downloadSendTime = svs.time;
		cl->downloadUserBlock++;
		return;
	}
	// We aren't getting an acknowledge for the correct block, drop the user
	// FIXME: this is bad... the user will never parse the disconnect message
	//			because the app isn't loaded yet
	SV_DropUser( cl, "broken download" );
}


/*
==================
SV_BeginDownload_f
==================
*/
static void SV_BeginDownload_f( user_t *cl ) {

	// Kill any existing download
	SV_CloseDownload( cl );

	// cl->downloadName is non-zero now, SV_WriteDownloadToUser will see this and open
	// the file itself
	Q_strncpyz( cl->downloadName, Cmd_Argv(1), sizeof(cl->downloadName) );
}


/*
==================
SV_WriteDownloadToUser

Check to see if the user wants a file, open it if needed and start pumping the user
Fill up msg with data, return number of download blocks added
==================
*/
static int SV_WriteDownloadToUser( user_t *cl )
{
	int curindex;
	int unreferenced = 1;
	char errorMessage[1024];
	char pakbuf[MAX_QPATH], *pakptr;
	int numRefPaks;
	msg_t msg;
	byte msgBuffer[MAX_DOWNLOAD_BLKSIZE*2+8];

	if( cl->download == FS_INVALID_HANDLE ) {
		qboolean idPack = qfalse;
		qboolean missionPack = qfalse;
 		// Chop off filename extension.
		Q_strncpyz( pakbuf, cl->downloadName, sizeof( pakbuf ) );
		pakptr = strrchr( pakbuf, '.' );

		if(pakptr)
		{
			*pakptr = '\0';

			// Check for pk3 filename extension
			if( !Q_stricmp( pakptr + 1, "pk3" ) )
			{
				// Check whether the file appears in the list of referenced
				// paks to prevent downloading of arbitrary files.
				Cmd_TokenizeStringIgnoreQuotes( sv_referencedPakNames->string );
				numRefPaks = Cmd_Argc();

				for(curindex = 0; curindex < numRefPaks; curindex++)
				{
					if(!FS_FilenameCompare(Cmd_Argv(curindex), pakbuf))
					{
						unreferenced = 0;

						// now that we know the file is referenced,
						// check whether it's legal to download it.
						missionPack = FS_idPak(pakbuf, BASETA, NUM_TA_PAKS);
						idPack = missionPack || FS_idPak(pakbuf, BASEGAME, NUM_ID_PAKS);

						break;
					}
				}
			}
		}

		cl->download = FS_INVALID_HANDLE;

		// We open the file here
		if( !(sv_allowDownload->integer & DLF_ENABLE) ||
			(sv_allowDownload->integer & DLF_NO_UDP) ||
			idPack || unreferenced ||
			( cl->downloadSize = FS_SV_FOpenFileRead( cl->downloadName, &cl->download ) ) < 0 ) {

			// cannot auto-download file
			if(unreferenced)
			{
				Com_Printf("userDownload: %d : \"%s\" is not referenced and cannot be downloaded.\n",(int)(cl - svs.users), cl->downloadName);
				Com_sprintf(errorMessage, sizeof(errorMessage), "File \"%s\" is not referenced and cannot be downloaded.", cl->downloadName);
			}
			else if(idPack) {
				Com_Printf("userDownload: %d : \"%s\" cannot download id pk3 files\n",(int)(cl - svs.users), cl->downloadName);
				if(missionPack) {
					Com_sprintf(errorMessage, sizeof(errorMessage), "Cannot autodownload Team Arena file \"%s\"\n"
									"The Team Arena mission pack can be found in your local game store.", cl->downloadName);
				}
				else {
					Com_sprintf(errorMessage, sizeof(errorMessage), "Cannot autodownload id pk3 file \"%s\"", cl->downloadName);
				}
			}
			else if( !(sv_allowDownload->integer & DLF_ENABLE) ||
				(sv_allowDownload->integer & DLF_NO_UDP) ) {

				Com_Printf("userDownload: %d : \"%s\" download disabled\n",(int)(cl - svs.users), cl->downloadName);
				if(sv_pure->integer) {
					Com_sprintf(errorMessage, sizeof(errorMessage), "Could not download \"%s\" because autodownloading is disabled on the host.\n\n"
										"You will need to get this file elsewhere before you "
										"can connect to this pure host.\n", cl->downloadName);
				} else {
					Com_sprintf(errorMessage, sizeof(errorMessage), "Could not download \"%s\" because autodownloading is disabled on the host.\n\n"
                    "The host you are connecting to is not a pure host, "
                    "set autodownload to No in your settings and you might be "
                    "able to join the game anyway.\n", cl->downloadName);
				}
			} else {
        // NOTE TTimo this is NOT supposed to happen unless bug in our filesystem scheme?
        //   if the pk3 is referenced, it must have been found somewhere in the filesystem
				Com_Printf("userDownload: %d : \"%s\" file not found on host\n",(int)(cl - svs.users), cl->downloadName);
				Com_sprintf(errorMessage, sizeof(errorMessage), "File \"%s\" not found on host for autodownloading.\n", cl->downloadName);
			}

			MSG_Init( &msg, msgBuffer, sizeof( msgBuffer ) - 8 );
			MSG_WriteLong( &msg, cl->lastUserCommand );

			MSG_WriteByte( &msg, svc_download );
			MSG_WriteShort( &msg, 0 ); // user is expecting block zero
			MSG_WriteLong( &msg, -1 ); // illegal file size
			MSG_WriteString( &msg, errorMessage );

			MSG_WriteByte( &msg, svc_EOF );
			SV_Netchan_Transmit( cl, &msg );

			*cl->downloadName = '\0';

			if( cl->download != FS_INVALID_HANDLE ) {
				FS_FCloseFile( cl->download );
				cl->download = FS_INVALID_HANDLE;
			}

			return 1;
		}

		Com_Printf( "userDownload: %d : beginning \"%s\"\n",(int)(cl - svs.users), cl->downloadName );

		// Init
		cl->downloadCurrentBlock = cl->downloadUserBlock = cl->downloadXmitBlock = 0;
		cl->downloadCount = 0;
		cl->downloadEOF = qfalse;
	}

	// Perform any reads that we need to
	while(cl->downloadCurrentBlock - cl->downloadUserBlock < MAX_DOWNLOAD_WINDOW &&
		cl->downloadSize != cl->downloadCount) {

		curindex =(cl->downloadCurrentBlock % MAX_DOWNLOAD_WINDOW);

		if(!cl->downloadBlocks[curindex])
			cl->downloadBlocks[curindex] = Z_Malloc( MAX_DOWNLOAD_BLKSIZE );

		cl->downloadBlockSize[curindex] = FS_Read( cl->downloadBlocks[curindex], MAX_DOWNLOAD_BLKSIZE, cl->download );

		if(cl->downloadBlockSize[curindex] < 0) {
			// EOF right now
			cl->downloadCount = cl->downloadSize;
			break;
		}

		cl->downloadCount += cl->downloadBlockSize[curindex];

		// Load in next block
		cl->downloadCurrentBlock++;
	}

	// Check to see if we have eof condition and add the EOF block
	if(cl->downloadCount == cl->downloadSize &&
		!cl->downloadEOF &&
		cl->downloadCurrentBlock - cl->downloadUserBlock < MAX_DOWNLOAD_WINDOW) {

		cl->downloadBlockSize[cl->downloadCurrentBlock % MAX_DOWNLOAD_WINDOW] = 0;
		cl->downloadCurrentBlock++;

		cl->downloadEOF = qtrue;  // We have added the EOF block
	}

	if(cl->downloadUserBlock == cl->downloadCurrentBlock)
		return 0; // Nothing to transmit

	// Write out the next section of the file, if we have already reached our window,
	// automatically start retransmitting
	if(cl->downloadXmitBlock == cl->downloadCurrentBlock)
	{
		// We have transmitted the complete window, should we start resending?
		if(svs.time - cl->downloadSendTime > 1000)
			cl->downloadXmitBlock = cl->downloadUserBlock;
		else
			return 0;
	}

	// Send current block
	curindex =(cl->downloadXmitBlock % MAX_DOWNLOAD_WINDOW);

	MSG_Init( &msg, msgBuffer, sizeof( msgBuffer ) - 8 );
	MSG_WriteLong( &msg, cl->lastUserCommand );

	MSG_WriteByte( &msg, svc_download );
	MSG_WriteShort( &msg, cl->downloadXmitBlock );

	// block zero is special, contains file size
	if( cl->downloadXmitBlock == 0 )
		MSG_WriteLong( &msg, cl->downloadSize );

	MSG_WriteShort( &msg, cl->downloadBlockSize[curindex] );

	// Write the block
	if( cl->downloadBlockSize[curindex] > 0 )
		MSG_WriteData( &msg, cl->downloadBlocks[curindex], cl->downloadBlockSize[curindex] );

	MSG_WriteByte( &msg, svc_EOF );
	SV_Netchan_Transmit( cl, &msg );

	Com_DPrintf( "userDownload: %d : writing block %d\n",(int)(cl - svs.users), cl->downloadXmitBlock );

	// Move on to the next block
	// It will get sent with next snap shot.  The rate will keep us in line.
	cl->downloadXmitBlock++;
	cl->downloadSendTime = svs.time;

	return 1;
}


/*
==================
SV_SendQueuedMessages

Send one round of fragments, or queued messages to all users that have data pending.
Return the shortest time interval for sending next packet to user
==================
*/
int SV_SendQueuedMessages( void )
{
	int i, retval = -1, nextFragT;
	user_t *cl;

	for( i = 0; i < sv_maxusers->integer; i++ )
	{
		cl = &svs.users[i];

		if( cl->state )
		{
			nextFragT = SV_RateMsec(cl);

			if(!nextFragT)
				nextFragT = SV_Netchan_TransmitNextFragment(cl);

			if(nextFragT >= 0 &&(retval == -1 || retval > nextFragT))
				retval = nextFragT;
		}
	}

	return retval;
}


/*
==================
SV_SendDownloadMessages

Send one round of download messages to all users
==================
*/
int SV_SendDownloadMessages( void )
{
	int i, numDLs = 0;
	user_t *cl;

	for( i = 0; i < sv_maxusers->integer; i++ )
	{
		cl = &svs.users[ i ];
		if( cl->state >= CS_CONNECTED && *cl->downloadName )
		{
			numDLs += SV_WriteDownloadToUser( cl );
		}
	}

	return numDLs;
}


/*
=================
SV_Disconnect_f

The user is going to disconnect, so remove the connection immediately  FIXME: move to game?
=================
*/
static void SV_Disconnect_f( user_t *cl ) {
	SV_DropUser( cl, "disconnected" );
}


/*
=================
SV_VerifyPaks_f

If we are pure, disconnect the user if they do no meet the following conditions:

1. the first two checksums match our view of app and ui
2. there are no any additional checksums that we do not have

This routine would be a bit simpler with a goto but i abstained

=================
*/
static void SV_VerifyPaks_f( user_t *cl ) {
	int nChkSum1, nChkSum2, nUserPaks, i, j, nCurArg;
	int nUserChkSum[512];
	const char *pArg;
	qboolean bGood = qtrue;

	// if we are pure, we "expect" the user to load certain things from
	// certain pk3 files, namely we want the user to have loaded the
	// ui and app that we think should be loaded based on the pure setting
	//
	if( sv_pure->integer != 0 ) {

		nChkSum1 = nChkSum2 = 0;

		// we run the game, so determine which app and ui the user "should" be running
		bGood = FS_FileIsInPAK( "vm/app.qvm", &nChkSum1, NULL );
		bGood &= FS_FileIsInPAK( "vm/ui.qvm", &nChkSum2, NULL );

		nUserPaks = Cmd_Argc();

		if( nUserPaks > ARRAY_LEN( nUserChkSum ) )
			nUserPaks = ARRAY_LEN( nUserChkSum );

		// start at arg 2( skip hostId cl_paks )
		nCurArg = 1;

		pArg = Cmd_Argv(nCurArg++);
		if( !*pArg ) {
			bGood = qfalse;
		}
		else
		{
			// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=475
			// we may get incoming cp sequences from a previous checksumFeed, which we need to ignore
			// since hostId is a frame count, it always goes up
			if( atoi( pArg ) - sv.checksumFeedHostId < 0 )
			{
				Com_DPrintf( "ignoring outdated cp command from user %s\n", cl->name );
				return;
			}
		}

		// we basically use this while loop to avoid using 'goto' :)
		while(bGood) {

			// must be at least 6: "cl_paks app ui @ firstref ... numChecksums"
			// numChecksums is encoded
			if(nUserPaks < 6) {
				bGood = qfalse;
				break;
			}
			// verify first to be the app checksum
			pArg = Cmd_Argv(nCurArg++);
			if( !*pArg || *pArg == '@' || atoi(pArg) != nChkSum1 ) {
				bGood = qfalse;
				break;
			}
			// verify the second to be the ui checksum
			pArg = Cmd_Argv(nCurArg++);
			if( !*pArg || *pArg == '@' || atoi(pArg) != nChkSum2 ) {
				bGood = qfalse;
				break;
			}
			// should be sitting at the delimeter now
			pArg = Cmd_Argv(nCurArg++);
			if(*pArg != '@') {
				bGood = qfalse;
				break;
			}
			// store checksums since tokenization is not re-entrant
			for(i = 0; nCurArg < nUserPaks; i++) {
				nUserChkSum[i] = atoi(Cmd_Argv(nCurArg++));
			}

			// store number to compare against(minus one cause the last is the number of checksums)
			nUserPaks = i - 1;

			// make sure none of the user check sums are the same
			// so the user can't send 5 the same checksums
			for(i = 0; i < nUserPaks; i++) {
				for(j = 0; j < nUserPaks; j++) {
					if(i == j)
						continue;
					if(nUserChkSum[i] == nUserChkSum[j]) {
						bGood = qfalse;
						break;
					}
				}
				if(bGood == qfalse)
					break;
			}
			if(bGood == qfalse)
				break;

			// check if the user has provided any pure checksums of pk3 files not loaded by the host
			for( i = 0; i < nUserPaks; i++ ) {
				if( !FS_IsPureChecksum( nUserChkSum[i] ) ) {
					bGood = qfalse;
					break;
				}
			}
			if( bGood == qfalse ) {
				break;
			}

			// check if the number of checksums was correct
			nChkSum1 = sv.checksumFeed;
			for(i = 0; i < nUserPaks; i++) {
				nChkSum1 ^= nUserChkSum[i];
			}
			nChkSum1 ^= nUserPaks;
			if(nChkSum1 != nUserChkSum[nUserPaks]) {
				bGood = qfalse;
				break;
			}

			// break out
			break;
		}

		cl->gotCP = qtrue;

		if( bGood ) {
			cl->pureAuthentic = qtrue;
		} else {
			cl->pureAuthentic = qfalse;
			cl->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately
			cl->state = CS_ZOMBIE; // skip delta generation
			SV_SendUserSnapshot( cl );
			cl->state = CS_ACTIVE;
			SV_DropUser( cl, "Unpure user detected. Invalid .PK3 files referenced!" );
		}
	}
}


/*
=================
SV_ResetPureUser_f
=================
*/
static void SV_ResetPureUser_f( user_t *cl ) {
	cl->pureAuthentic = qfalse;
	cl->gotCP = qfalse;
}


/*
=================
SV_UserinfoChanged

Pull specific info from a newly changed userinfo string
into a more C friendly form.
=================
*/
void SV_UserinfoChanged( user_t *cl, qboolean updateUserinfo, qboolean runFilter ) {
	char buf[ MAX_NAME_LENGTH ];
	const char *val;
	const char *ip;
	int	i;

	if( cl->netchan.remoteAddress.type == NA_BOT ) {
		cl->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately
		cl->snapshotMsec = 1000 / sv_fps->integer;
		cl->rate = 0;
		return;
	}

	// rate command

	// if the user is on the same subnet as the host and we aren't running an
	// internet public host, assume they don't need a rate choke
	if( cl->netchan.remoteAddress.type == NA_LOOPBACK ||( cl->netchan.isLANAddress && com_dedicated->integer != 2 && sv_lanForceRate->integer ) ) {
		cl->rate = 0; // lans should not rate limit
	} else {
		val = Info_ValueForKey( cl->userinfo, "rate" );
		if( val[0] )
			cl->rate = atoi( val );
		else
			cl->rate = 10000; // was 3000

		if( sv_maxRate->integer ) {
			if( cl->rate > sv_maxRate->integer )
				cl->rate = sv_maxRate->integer;
		}

		if( sv_minRate->integer ) {
			if( cl->rate < sv_minRate->integer )
				cl->rate = sv_minRate->integer;
		}
	}

	// snaps command
	val = Info_ValueForKey( cl->userinfo, "snaps" );
	if( val[0] && !NET_IsLocalAddress( &cl->netchan.remoteAddress ) )
		i = atoi( val );
	else
		i = sv_fps->integer; // sync with host

	// range check
	if( i < 1 )
		i = 1;
	else if( i > sv_fps->integer )
		i = sv_fps->integer;

	i = 1000 / i; // from FPS to milliseconds

	if( i != cl->snapshotMsec )
	{
		// Reset last sent snapshot so we avoid desync between host frame time and snapshot send time
		cl->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately
		cl->snapshotMsec = i;
	}

	if( !updateUserinfo )
		return;

	// name for C code
	val = Info_ValueForKey( cl->userinfo, "name" );
	// truncate if it is too long as it may cause memory corruption in OSP mod
	if( gvm->forceDataMask && strlen( val ) >= sizeof( buf ) ) {
		Q_strncpyz( buf, val, sizeof( buf ) );
		Info_SetValueForKey( cl->userinfo, "name", buf );
		val = buf;
	}
	Q_strncpyz( cl->name, val, sizeof( cl->name ) );

	val = Info_ValueForKey( cl->userinfo, "handicap" );
	if( val[0] ) {
		i = atoi( val );
		if( i <= 0 || i > 100 || strlen( val ) > 4 ) {
			Info_SetValueForKey( cl->userinfo, "handicap", "100" );
		}
	}

	// TTimo
	// maintain the IP information
	// the banning code relies on this being consistently present
	if( NET_IsLocalAddress( &cl->netchan.remoteAddress ) )
		ip = "localhost";
	else
		ip = NET_AdrToString( &cl->netchan.remoteAddress );

	if( !Info_SetValueForKey( cl->userinfo, "ip", ip ) )
		SV_DropUser( cl, "userinfo string length exceeded" );

	Info_SetValueForKey( cl->userinfo, "tld", cl->tld );

	if( runFilter )
	{
		val = SV_RunFilters( cl->userinfo, &cl->netchan.remoteAddress );
		if( *val != '\0' )
		{
			SV_DropUser( cl, val );
		}
	}
}


/*
==================
SV_UpdateUserinfo_f
==================
*/
static void SV_UpdateUserinfo_f( user_t *cl ) {
	const char *info;

	info = Cmd_Argv( 1 );

	if( Cmd_Argc() != 2 || *info == '\0' ) {
		// this is something erroneous, user should never send that
		return;
	}

	Q_strncpyz( cl->userinfo, info, sizeof( cl->userinfo ) );

	SV_UserinfoChanged( cl, qtrue, qtrue ); // update userinfo, run filter
	// call prog code to allow overrides
	VM_Call( gvm, 1, GAME_USER_USERINFO_CHANGED, cl - svs.users );
}

extern int SV_Strlen( const char *str );

/*
==================
SV_PrintLocations_f
==================
*/
void SV_PrintLocations_f( user_t *user ) {
	int i, len;
	user_t *cl;
	int max_namelength;
	int max_ctrylength;
	char line[128];
	char buf[1400-4-8], *s;
	char filln[MAX_NAME_LENGTH];
	char fillc[64];

	if( !svs.users )
		return;

	max_namelength = 4; // strlen( "name" )
	max_ctrylength = 7; // strlen( "country" )

	// first pass: save and determine max.legths of name/address fields
	for( i = 0, cl = svs.users ; i < sv_maxusers->integer ; i++, cl++ )
	{
		if( cl->state == CS_FREE )
			continue;

		len = SV_Strlen( cl->name );// name length without color sequences
		if( len > max_namelength )
			max_namelength = len;

		len = strlen( cl->country );
		if( len > max_ctrylength )
			max_ctrylength = len;
	}

	s = buf; *s = '\0';
	memset( filln, '-',  max_namelength ); filln[max_namelength] = '\0';
	memset( fillc, '-',  max_ctrylength ); fillc[max_ctrylength] = '\0';
	// Start this on a new line to be viewed properly in console
	s = Q_stradd( s, "\n" );
	Com_sprintf( line, sizeof( line ), "ID %-*s CC Country\n", max_namelength, "Name" );
	s = Q_stradd( s, line );
	Com_sprintf( line, sizeof( line ), "-- %s -- %s\n", filln, fillc );
	s = Q_stradd( s, line );

	for( i = 0, cl = svs.users ; i < sv_maxusers->integer ; i++, cl++ )
	{
		if( cl->state == CS_FREE )
			continue;

		len = Com_sprintf( line, sizeof( line ), "%2i %s%-*s" S_COLOR_WHITE " %2s %s\n",
			i, cl->name, max_namelength-SV_Strlen(cl->name), "", cl->tld, cl->country );

		if( s - buf + len >= sizeof( buf )-1 ) // flush accumulated buffer
		{
			if( user )
				NET_OutOfBandPrint( NS_HOST, &user->netchan.remoteAddress, "print\n%s", buf );
			else
				Com_Printf( "%s", buf );

			s = buf; *s = '\0';
		}

		s = Q_stradd( s, line );
	}

	if( buf[0] )
	{
		if( user )
			NET_OutOfBandPrint( NS_HOST, &user->netchan.remoteAddress, "print\n%s", buf );
		else
			Com_Printf( "%s", buf );
	}
}


typedef struct {
	const char *name;
	void(*func)( user_t *cl );
} ucmd_t;

static const ucmd_t ucmds[] = {
	{"userinfo", SV_UpdateUserinfo_f},
	{"disconnect", SV_Disconnect_f},
	{"cp", SV_VerifyPaks_f},
	{"vdr", SV_ResetPureUser_f},
	{"download", SV_BeginDownload_f},
	{"nextdl", SV_NextDownload_f},
	{"stopdl", SV_StopDownload_f},
	{"donedl", SV_DoneDownload_f},
	{"locations", SV_PrintLocations_f},

	{NULL, NULL}
};


/*
================
SV_FloodProtect
================
*/
static qboolean SV_FloodProtect( user_t *cl ) {
	if( sv_floodProtect->integer ) {
		return SVC_RateLimit( &cl->cmd_rate, 8, 500 );
	} else {
		return qfalse;
	}
}


/*
==================
SV_ExecuteUserCommand

Also called by bot code
==================
*/
qboolean SV_ExecuteUserCommand( user_t *cl, const char *s ) {
	const ucmd_t *ucmd;
	qboolean bFloodProtect;

	Cmd_TokenizeString( s );

	// malicious users may try using too many string commands
	// to lag other players.  If we decide that we want to stall
	// the command, we will stop processing the rest of the packet,
	// including the usercmd.  This causes flooders to lag themselves
	// but not other people

	// We don't do this when the user hasn't been active yet since it's
	// normal to spam a lot of commands when downloading
	bFloodProtect = cl->netchan.remoteAddress.type != NA_BOT && cl->state >= CS_ACTIVE;

	// see if it is a host level command
	for( ucmd = ucmds; ucmd->name; ucmd++ ) {
		if( !strcmp( Cmd_Argv(0), ucmd->name ) ) {
			if( ucmd->func == SV_UpdateUserinfo_f ) {
				if( bFloodProtect ) {
					if( SVC_RateLimit( &cl->info_rate, 5, 1000 ) ) {
						return qfalse; // lag flooder
					}
				}
			} else if( ucmd->func == SV_PrintLocations_f && !sv_userTLD->integer ) {
				continue; // bypass this command to the gamecode
			}
			ucmd->func( cl );
			bFloodProtect = qfalse;
			break;
		}
	}

#ifndef DEDICATED
	if( !com_cl_running->integer && bFloodProtect && SV_FloodProtect( cl ) ) {
#else
	if( bFloodProtect && SV_FloodProtect( cl ) ) {
#endif
		// ignore any other text messages from this user but let them keep playing
		Com_DPrintf( "user text ignored for %s: %s\n", cl->name, Cmd_Argv(0) );
	} else {
		// pass unknown strings to the game
		if( !ucmd->name && sv.state == SS_GAME && cl->state >= CS_PRIMED ) {
			if( gvm->forceDataMask )
				Cmd_Args_Sanitize( "\n\r;" ); // handle ';' for OSP
			else
				Cmd_Args_Sanitize( "\n\r" );
			VM_Call( gvm, 1, GAME_USER_COMMAND, cl - svs.users );
		}
	}

	return qtrue;
}


/*
===============
SV_UserCommand
===============
*/
static qboolean SV_UserCommand( user_t *cl, msg_t *msg ) {
	int		seq;
	const char	*s;

	seq = MSG_ReadLong( msg );
	s = MSG_ReadString( msg );

	// see if we have already executed it
	if( seq - cl->lastUserCommand <= 0 ) {
		return qtrue;
	}

	Com_DPrintf( "userCommand: %s : %i : %s\n", cl->name, seq, s );

	// drop the connection if we have somehow lost commands
	if( seq - cl->lastUserCommand > 1 ) {
		Com_Printf( "User %s lost %i userCommands\n", cl->name, seq - cl->lastUserCommand - 1 );
		SV_DropUser( cl, "Lost reliable commands" );
		return qfalse;
	}

	if( !SV_ExecuteUserCommand( cl, s ) ) {
		return qfalse;
	}

	cl->lastUserCommand = seq;
	Q_strncpyz( cl->lastUserCommandString, s, sizeof( cl->lastUserCommandString ) );

	return qtrue; // continue procesing
}


//==================================================================================


/*
==================
SV_UserThink

Also called by bot code
==================
*/
void SV_UserThink(user_t *cl, usercmd_t *cmd) {
	cl->lastUsercmd = *cmd;

	if( cl->state != CS_ACTIVE ) {
		return;		// may have been kicked during the last usercmd
	}

	VM_Call( gvm, 1, GAME_USER_THINK, cl - svs.users );
}


/*
==================
SV_UserMove

The message usually contains all the movement commands
that were in the last three packets, so that the information
in dropped packets can be recovered.

On very fast users, there may be multiple usercmd packed into
each of the backup packets.
==================
*/
static void SV_UserMove( user_t *cl, msg_t *msg, qboolean delta ) {
	int			i, key;
	int			cmdCount;
	static const usercmd_t nullcmd = { 0 };
	usercmd_t	cmds[MAX_PACKET_USERCMDS], *cmd;
	const usercmd_t *oldcmd;

	if( delta ) {
		cl->deltaMessage = cl->messageAcknowledge;
	} else {
		cl->deltaMessage = cl->netchan.outgoingSequence -( PACKET_BACKUP + 1 ); // force delta reset
	}

	cmdCount = MSG_ReadByte( msg );

	if( cmdCount < 1 ) {
		Com_Printf( "cmdCount < 1\n" );
		return;
	}

	if( cmdCount > MAX_PACKET_USERCMDS ) {
		Com_Printf( "cmdCount > MAX_PACKET_USERCMDS\n" );
		return;
	}

	// use the checksum feed in the key
	key = sv.checksumFeed;
	// also use the message acknowledge
	key ^= cl->messageAcknowledge;
	// also use the last acknowledged host command in the key
	key ^= MSG_HashKey(cl->reliableCommands[ cl->reliableAcknowledge &(MAX_RELIABLE_COMMANDS-1) ], 32);

	oldcmd = &nullcmd;
	for( i = 0 ; i < cmdCount ; i++ ) {
		cmd = &cmds[i];
		MSG_ReadDeltaUsercmdKey( msg, key, oldcmd, cmd );
		oldcmd = cmd;
	}

	// save time for ping calculation
	if( cl->frames[ cl->messageAcknowledge & PACKET_MASK ].messageAcked == 0 ) {
		cl->frames[ cl->messageAcknowledge & PACKET_MASK ].messageAcked = Sys_Milliseconds();
	}

	// if this is the first usercmd we have received
	// this gamestate, put the user into the world
	if( cl->state == CS_PRIMED ) {
		if( sv_pure->integer != 0 && !cl->gotCP ) {
			// we didn't get a cp yet, don't assume anything and just send the gamestate all over again
			if( !SVC_RateLimit( &cl->gamestate_rate, 4, 1000 ) ) {
				Com_DPrintf( "%s: didn't get cp command, resending gamestate\n", cl->name );
				SV_SendUserGameState( cl );
			}
			return;
		}
		SV_UserEnterWorld( cl, &cmds[0] );
		// the moves can be processed normally
	}

	// a bad cp command was sent, drop the user
	if( sv_pure->integer != 0 && !cl->pureAuthentic ) {
		SV_DropUser( cl, "Cannot validate pure user!" );
		return;
	}

	if( cl->state != CS_ACTIVE ) {
		cl->deltaMessage = cl->netchan.outgoingSequence -( PACKET_BACKUP + 1 ); // force delta reset
		return;
	}

	// usually, the first couple commands will be duplicates
	// of ones we have previously received, but the hosttimes
	// in the commands will cause them to be immediately discarded
	for( i = 0; i < cmdCount; i++ ) {
		// if this is a cmd from before a map_restart ignore it
		if( cmds[i].hostTime - cmds[cmdCount-1].hostTime > 0 ) {
			continue;
		}
		// extremely lagged or cmd from before a map_restart
		//if( cmds[i].hostTime > svs.time + 3000 ) {
		//	continue;
		//}
		// don't execute if this is an old cmd which is already executed
		// these old cmds are included when cl_packetdup > 0
		//if( cmds[i].hostTime <= cl->lastUsercmd.hostTime ) {
		if( cmds[i].hostTime - cl->lastUsercmd.hostTime <= 0 ) {
			continue;
		}
		SV_UserThink( cl, &cmds[ i ] );
	}
}


/*
===========================================================================

USER CMD EXECUTION

===========================================================================
*/

/*
===================
SV_ExecuteUserMessage

Parse a user packet
===================
*/
void SV_ExecuteUserMessage( user_t *cl, msg_t *msg ) {
	int	c;
	int	hostId;
	int reliableAcknowledge;

	MSG_Bitstream( msg );

	hostId = MSG_ReadLong( msg );

	cl->messageAcknowledge = MSG_ReadLong( msg );

	//if( cl->messageAcknowledge < 0 ) {
	if( cl->netchan.outgoingSequence - cl->messageAcknowledge <= 0 ) {
		// usually only hackers create messages like this
		// it is more annoying for them to let them hanging
#ifdef _DEBUG
		SV_DropUser( cl, "DEBUG: illegible user message" );
#endif
		return;
	}

	reliableAcknowledge = MSG_ReadLong( msg );

	if( cl->reliableSequence - reliableAcknowledge < 0 ) {
#ifdef _DEBUG
		SV_DropUser( cl, "DEBUG: illegible user message" );
#endif
		return;
	}

	// NOTE: when the user message is fux0red the acknowledgement numbers
	// can be out of range, this could cause the host to send thousands of host
	// commands which the host thinks are not yet acknowledged in SV_UpdateHostCommandsToUser
	if( cl->reliableSequence - reliableAcknowledge > MAX_RELIABLE_COMMANDS ) {
		// usually only hackers create messages like this
		// it is more annoying for them to let them hanging
#ifdef _DEBUG
		SV_DropUser( cl, "DEBUG: illegible user message" );
#else
		Com_Printf( S_COLOR_YELLOW "WARNING: dropping %i commands from %s\n", cl->reliableSequence - cl->reliableAcknowledge, cl->name );
#endif
		cl->reliableAcknowledge = cl->reliableSequence;
		return;
	}

	cl->reliableAcknowledge = reliableAcknowledge;

	cl->justConnected = qfalse;

	// if this is a usercmd from a previous gamestate,
	// ignore it or retransmit the current gamestate
	//
	// if the user was downloading, let it stay at whatever hostId and
	// gamestate it was at.  This allows it to keep downloading even when
	// the gamestate changes.  After the download is finished, we'll
	// notice and send it a new game state
	//
	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=536
	// don't drop as long as previous command was a nextdl, after a dl is done, downloadName is set back to ""
	// but we still need to read the next message to move to next download or send gamestate
	// I don't like this hack though, it must have been working fine at some point, suspecting the fix is somewhere else
	if( hostId != sv.hostId && !*cl->downloadName && !strstr(cl->lastUserCommandString, "nextdl") ) {
		// TTimo - use a comparison here to catch multiple map_restart
		if( hostId - sv.restartedHostId >= 0 && hostId - sv.hostId < 0 ) {
			// they just haven't caught the \map_restart yet
			Com_DPrintf( "%s: ignoring pre map_restart / outdated user message\n", cl->name );
			return;
		}
		// if we can tell that the user has dropped the last gamestate we sent them, resend it
		if( cl->state != CS_ACTIVE && cl->messageAcknowledge - cl->gamestateMessageNum > 0 ) {
			if( !SVC_RateLimit( &cl->gamestate_rate, 4, 1000 ) ) {
				if( cl->gentity )
					Com_DPrintf( "%s: dropped gamestate, resending\n", cl->name );
				SV_SendUserGameState( cl );
			}
		}
		return;
	}

	// this user has acknowledged the new gamestate so it's
	// safe to start sending it the real time again
	if( cl->oldHostTime && hostId == sv.hostId ){
		Com_DPrintf( "%s acknowledged gamestate\n", cl->name );
		cl->oldHostTime = 0;
	}

	// read optional userCommand strings
	do {
		c = MSG_ReadByte( msg );
		if( c != clc_userCommand ) {
			break;
		}
		if( !SV_UserCommand( cl, msg ) ) {
			return;	// we couldn't execute it because of the flood protection
		}
		if( cl->state == CS_ZOMBIE ) {
			return;	// disconnect command
		}
	} while( 1 );

	// read the usercmd_t
	if( c == clc_move ) {
		SV_UserMove( cl, msg, qtrue );
	} else if( c == clc_moveNoDelta ) {
		SV_UserMove( cl, msg, qfalse );
	} else if( c != clc_EOF ) {
		Com_Printf( "WARNING: bad command byte %i for user %i\n", c,(int)(cl - svs.users) );
	}
//	if( msg->readcount != msg->cursize ) {
//		Com_Printf( "WARNING: Junk at end of packet for user %i\n", cl - svs.users );
//	}
}
