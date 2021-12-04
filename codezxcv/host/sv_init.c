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

#include "host.h"


/*
===============
SV_SendConfigstring

Creates and sends the host command necessary to update the CS index for the
given user
===============
*/
static void SV_SendConfigstring(user_t *user, int index)
{
	int maxChunkSize = MAX_STRING_CHARS - 24;
	int len;

	len = strlen(sv.configstrings[index]);

	if( len >= maxChunkSize ) {
		int		sent = 0;
		int		remaining = len;
		char	*cmd;
		char	buf[MAX_STRING_CHARS];

		while(remaining > 0 ) {
			if( sent == 0 ) {
				cmd = "bcs0";
			}
			else if( remaining < maxChunkSize ) {
				cmd = "bcs2";
			}
			else {
				cmd = "bcs1";
			}
			Q_strncpyz( buf, &sv.configstrings[index][sent],
				maxChunkSize );

			SV_SendHostCommand( user, "%s %i \"%s\"", cmd,
				index, buf );

			sent +=(maxChunkSize - 1);
			remaining -=(maxChunkSize - 1);
		}
	} else {
		// standard cs, just send it
		SV_SendHostCommand( user, "cs %i \"%s\"", index,
			sv.configstrings[index] );
	}
}

/*
===============
SV_UpdateConfigstrings

Called when a user goes from CS_PRIMED to CS_ACTIVE.  Updates all
Configstring indexes that have changed while the user was in CS_PRIMED
===============
*/
void SV_UpdateConfigstrings(user_t *user)
{
	int index;

	for( index = 0; index < MAX_CONFIGSTRINGS; index++ ) {
		// if the CS hasn't changed since we went to CS_PRIMED, ignore
		if(!user->csUpdated[index])
			continue;

		// do not always send host info to all users
		if( index == CS_HOSTINFO &&( SV_GentityNum( user - svs.users )->r.svFlags & SVF_NOHOSTINFO ) ) {
			continue;
		}

		SV_SendConfigstring(user, index);
		user->csUpdated[index] = qfalse;
	}
}

/*
===============
SV_SetConfigstring

===============
*/
void SV_SetConfigstring(int index, const char *val) {
	int		i;
	user_t	*user;

	if( index < 0 || index >= MAX_CONFIGSTRINGS ) {
		Com_Error(ERR_DROP, "SV_SetConfigstring: bad index %i", index);
	}

	if( !val ) {
		val = "";
	}

	// don't bother broadcasting an update if no change
	if( !strcmp( val, sv.configstrings[ index ] ) ) {
		return;
	}

	// change the string in sv
	Z_Free( sv.configstrings[index] );
	sv.configstrings[index] = CopyString( val );

	// send it to all the users if we aren't
	// spawning a new host
	if( sv.state == SS_GAME || sv.restarting ) {

		// send the data to all relevant users
		for(i = 0, user = svs.users; i < sv_maxusers->integer ; i++, user++) {
			if( user->state < CS_ACTIVE ) {
				if( user->state == CS_PRIMED )
					user->csUpdated[ index ] = qtrue;
				continue;
			}
			// do not always send host info to all users
			if( index == CS_HOSTINFO &&( SV_GentityNum( i )->r.svFlags & SVF_NOHOSTINFO ) ) {
				continue;
			}

			SV_SendConfigstring(user, index);
		}
	}
}


/*
===============
SV_GetConfigstring
===============
*/
void SV_GetConfigstring( int index, char *buffer, int bufferSize ) {
	if( bufferSize < 1 ) {
		Com_Error( ERR_DROP, "SV_GetConfigstring: bufferSize == %i", bufferSize );
	}
	if( index < 0 || index >= MAX_CONFIGSTRINGS ) {
		Com_Error(ERR_DROP, "SV_GetConfigstring: bad index %i", index);
	}
	if( !sv.configstrings[index] ) {
		buffer[0] = '\0';
		return;
	}

	Q_strncpyz( buffer, sv.configstrings[index], bufferSize );
}


/*
===============
SV_SetUserinfo

===============
*/
void SV_SetUserinfo( int index, const char *val ) {
	if( index < 0 || index >= sv_maxusers->integer ) {
		Com_Error(ERR_DROP, "SV_SetUserinfo: bad index %i", index);
	}

	if( !val ) {
		val = "";
	}

	Q_strncpyz( svs.users[index].userinfo, val, sizeof( svs.users[ index ].userinfo ) );
	Q_strncpyz( svs.users[index].name, Info_ValueForKey( val, "name" ), sizeof(svs.users[index].name) );
}



/*
===============
SV_GetUserinfo

===============
*/
void SV_GetUserinfo( int index, char *buffer, int bufferSize ) {
	if( bufferSize < 1 ) {
		Com_Error( ERR_DROP, "SV_GetUserinfo: bufferSize == %i", bufferSize );
	}
	if( index < 0 || index >= sv_maxusers->integer ) {
		Com_Error(ERR_DROP, "SV_GetUserinfo: bad index %i", index);
	}
	Q_strncpyz( buffer, svs.users[ index ].userinfo, bufferSize );
}


/*
================
SV_CreateBaseline

Entity baselines are used to compress non-delta messages
to the users -- only the fields that differ from the
baseline will be transmitted
================
*/
static void SV_CreateBaseline( void ) {
	sharedEntity_t *ent;
	int				entnum;

	for( entnum = 0; entnum < sv.num_entities ; entnum++ ) {
		ent = SV_GentityNum( entnum );
		if( !ent->r.linked ) {
			continue;
		}
		ent->s.number = entnum;

		//
		// take current state as baseline
		//
		sv.svEntities[ entnum ].baseline = ent->s;
		sv.baselineUsed[ entnum ] = 1;
	}
}


/*
===============
SV_BoundMaxUsers
===============
*/
static void SV_BoundMaxUsers( int minimum ) {
	// get the current maxusers value
	Cvar_Get( "sv_maxusers", "8", 0 );

	sv_maxusers->modified = qfalse;

	if( sv_maxusers->integer < minimum ) {
		Cvar_Set( "sv_maxusers", va("%i", minimum) );
	}
}


/*
===============
SV_SetSnapshotParams
===============
*/
static void SV_SetSnapshotParams( void )
{
	// PACKET_BACKUP frames is just about 6.67MB so use that even on listen hosts
	svs.numSnapshotEntities = PACKET_BACKUP * MAX_GENTITIES;
}


/*
===============
SV_Startup

Called when a host starts a map when it wasn't running
one before.  Successive map or map_restart commands will
NOT cause this to be called, unless the game is exited to
the menu system first.
===============
*/
static void SV_Startup( void ) {
	if( svs.initialized ) {
		Com_Error( ERR_FATAL, "SV_Startup: svs.initialized" );
	}
	SV_BoundMaxUsers( 1 );

	svs.users = Z_TagMalloc( sv_maxusers->integer * sizeof( user_t ), TAG_USERS );
	Com_Memset( svs.users, 0, sv_maxusers->integer * sizeof( user_t ) );
	SV_SetSnapshotParams();
	svs.initialized = qtrue;

	// Don't respect sv_killhost unless a host is actually running
	if( sv_killhost->integer ) {
		Cvar_Set( "sv_killhost", "0" );
	}

	Cvar_Set( "sv_running", "1" );

	// Join the ipv6 multicast group now that a map is running so users can scan for us on the local network.
#ifdef USE_IPV6
	NET_JoinMulticast6();
#endif
}


/*
==================
SV_ChangeMaxUsers
==================
*/
void SV_ChangeMaxUsers( void ) {
	int		oldMaxUsers;
	int		i;
	user_t	*oldUsers;
	int		count;

	// get the highest user number in use
	count = 0;
	for( i = 0 ; i < sv_maxusers->integer ; i++ ) {
		if( svs.users[i].state >= CS_CONNECTED ) {
			if(i > count)
				count = i;
		}
	}
	count++;

	oldMaxUsers = sv_maxusers->integer;
	// never go below the highest user number in use
	SV_BoundMaxUsers( count );
	// if still the same
	if( sv_maxusers->integer == oldMaxUsers ) {
		return;
	}

	oldUsers = Hunk_AllocateTempMemory( count * sizeof(user_t) );
	// copy the users to hunk memory
	for( i = 0 ; i < count ; i++ ) {
		if( svs.users[i].state >= CS_CONNECTED ) {
			oldUsers[i] = svs.users[i];
		}
		else {
			Com_Memset(&oldUsers[i], 0, sizeof(user_t));
		}
	}

	// free old users arrays
	Z_Free( svs.users );

	// allocate new users
	svs.users = Z_TagMalloc( sv_maxusers->integer * sizeof(user_t), TAG_USERS );
	Com_Memset( svs.users, 0, sv_maxusers->integer * sizeof(user_t) );

	// copy the users over
	for( i = 0 ; i < count ; i++ ) {
		if( oldUsers[i].state >= CS_CONNECTED ) {
			svs.users[i] = oldUsers[i];
		}
	}

	// free the old users on the hunk
	Hunk_FreeTempMemory( oldUsers );

	SV_SetSnapshotParams();
}


/*
================
SV_ClearHost
================
*/
static void SV_ClearHost( void ) {
	int i;

	for( i = 0 ; i < MAX_CONFIGSTRINGS ; i++ ) {
		if( sv.configstrings[i] ) {
			Z_Free( sv.configstrings[i] );
		}
	}

	if( !sv_levelTimeReset->integer ) {
		i = sv.time;
		Com_Memset( &sv, 0, sizeof( sv ) );
		sv.time = i;
	} else {
		Com_Memset( &sv, 0, sizeof( sv ) );
	}
}


/*
================
SV_SpawnHost

Change the host to a new map, taking all connected
users along with it.
This is NOT called for map_restart
================
*/
void SV_SpawnHost( const char *mapname, qboolean killBots ) {
	int			i;
	int			checksum;
	qboolean	isBot;
	const char	*p;

	// shut down the existing game if it is running
	SV_ShutdownGameProgs();

	Com_Printf( "------ Host Initialization ------\n" );
	Com_Printf( "Host: %s\n", mapname );

	Sys_SetStatus( "Initializing host..." );

#ifndef DEDICATED
	// if not running a dedicated host CL_MapLoading will connect the user to the host
	// also print some status stuff
	CL_MapLoading();

	// make sure all the user stuff is unloaded
	CL_ShutdownAll();
#endif

	// clear the whole hunk because we're(re)loading the host
	Hunk_Clear();

	// clear collision map data
	CM_ClearMap();

	// timescale can be updated before SV_Frame() and cause division-by-zero in SV_RateMsec()
	Cvar_CheckRange( com_timescale, "0.001", NULL, CV_FLOAT );

	// Restart gfxer?
	// CL_StartHunkUsers( );

	// init user structures and svs.numSnapshotEntities
	if( !Cvar_VariableIntegerValue( "sv_running" ) ) {
		SV_Startup();
	} else {
		// check for maxusers change
		if( sv_maxusers->modified ) {
			SV_ChangeMaxUsers();
		}
	}

#ifndef DEDICATED
	// remove pure paks that may left from user-side
	FS_PureHostSetLoadedPaks( "", "" );
	FS_PureHostSetReferencedPaks( "", "" );
#endif

	// clear pak references
	FS_ClearPakReferences( 0 );

	// allocate the snapshot entities on the hunk
	svs.snapshotEntities = Hunk_Alloc( sizeof(entityState_t)*svs.numSnapshotEntities, h_high );

	// initialize snapshot storage
	SV_InitSnapshotStorage();

	// toggle the host bit so users can detect that a
	// host has changed
	svs.snapFlagHostBit ^= SNAPFLAG_HOSTCOUNT;

	// set nextmap to the same map, but it may be overridden
	// by the game startup or another console command
	Cvar_Set( "nextmap", "map_restart 0" );
//	Cvar_Set( "nextmap", va("map %s", host) );

	// try to reset level time if host is empty
	if( !sv_levelTimeReset->integer && !sv.restartTime ) {
		for( i = 0; i < sv_maxusers->integer; i++ ) {
			if( svs.users[i].state >= CS_CONNECTED ) {
				break;
			}
		}
		if( i == sv_maxusers->integer ) {
			sv.time = 0;
		}
	}

	for( i = 0; i < sv_maxusers->integer; i++ ) {
		// save when the host started for each user already connected
		if( svs.users[i].state >= CS_CONNECTED && sv_levelTimeReset->integer ) {
			svs.users[i].oldHostTime = sv.time;
		} else {
			svs.users[i].oldHostTime = 0;
		}
	}

	// wipe the entire per-level structure
	SV_ClearHost();
	for( i = 0 ; i < MAX_CONFIGSTRINGS ; i++ ) {
		sv.configstrings[i] = CopyString("");
	}

	// make sure we are not paused
#ifndef DEDICATED
	Cvar_Set( "cl_paused", "0" );
#endif

	// get latched value
	Cvar_Get( "sv_pure", "1", CVAR_SYSTEMINFO | CVAR_LATCH );

	// get a new checksum feed and restart the file system
	srand( Com_Milliseconds() );
	Com_RandomBytes((byte*)&sv.checksumFeed, sizeof( sv.checksumFeed ) );
	FS_Restart( sv.checksumFeed );

	Sys_SetStatus( "Loading map %s", mapname );
	CM_LoadMap( va( "maps/%s.bsp", mapname ), qfalse, &checksum );

	// set hostinfo visible name
	Cvar_Set( "mapname", mapname );

	Cvar_Set( "sv_mapChecksum", va( "%i",checksum ) );

	// hostid should be different each time
	sv.hostId = com_frameTime;
	sv.restartedHostId = sv.hostId; // I suppose the init here is just to be safe
	sv.checksumFeedHostId = sv.hostId;
	Cvar_Set( "sv_hostid", va( "%i", sv.hostId ) );

	// clear physics interaction links
	SV_ClearWorld();

	// media configstring setting should be done during
	// the loading stage, so connected users don't have
	// to load during actual gameplay
	sv.state = SS_LOADING;

	// make sure that level time is not zero
	sv.time = sv.time ? sv.time : 8;

	// load and spawn all other entities
	SV_InitGameProgs();

	// don't allow a map_restart if game is modified
	sv_gametype->modified = qfalse;

	sv_pure->modified = qfalse;

	// run a few frames to allow everything to settle
	for( i = 0; i < 3; i++ )
	{
		sv.time += 100;
		VM_Call( gvm, 1, GAME_RUN_FRAME, sv.time );
		SV_BotFrame( sv.time );
	}

	// create a baseline for more efficient communications
	SV_CreateBaseline();

	for( i = 0; i < sv_maxusers->integer; i++ ) {
		// send the new gamestate to all connected users
		if( svs.users[i].state >= CS_CONNECTED ) {
			const char *denied;

			if( svs.users[i].netchan.remoteAddress.type == NA_BOT ) {
				if( killBots ) {
					SV_DropUser( &svs.users[i], "was kicked" );
					continue;
				}
				isBot = qtrue;
			}
			else {
				isBot = qfalse;
			}

			// connect the user again
			denied = GVM_ArgPtr( VM_Call( gvm, 3, GAME_USER_CONNECT, i, qfalse, isBot ) );	// firstTime = qfalse
			if( denied ) {
				// this generally shouldn't happen, because the user
				// was connected before the level change
				SV_DropUser( &svs.users[i], denied );
			} else {
				if( !isBot ) {
					// when we get the next packet from a connected user,
					// the new gamestate will be sent
					svs.users[i].state = CS_CONNECTED;
				}
				else {
					user_t		*user;
					sharedEntity_t	*ent;

					user = &svs.users[i];
					user->state = CS_ACTIVE;
					ent = SV_GentityNum( i );
					ent->s.number = i;
					user->gentity = ent;

					user->deltaMessage = user->netchan.outgoingSequence -( PACKET_BACKUP + 1 ); // force delta reset
					user->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately

					VM_Call( gvm, 1, GAME_USER_BEGIN, i );
				}
			}
		}
	}

	// run another frame to allow things to look at all the players
	sv.time += 100;
	VM_Call( gvm, 1, GAME_RUN_FRAME, sv.time );
	SV_BotFrame( sv.time );
	svs.time += 100;

	// we need to touch the app and ui qvm because they could be in
	// separate pk3 files and the user will need to download the pk3
	// files with the latest app and ui qvm to pass the pure check
	FS_TouchFileInPak( "vm/app.qvm" );
	FS_TouchFileInPak( "vm/ui.qvm" );

	// the host sends these to the users so they can figure
	// out which pk3s should be auto-downloaded
	p = FS_ReferencedPakNames();
	if( FS_ExcludeReference() ) {
		// \fs_excludeReference may mask our current ui/app qvms
		FS_TouchFileInPak( "vm/app.qvm" );
		FS_TouchFileInPak( "vm/ui.qvm" );
		// rebuild referenced paks list
		p = FS_ReferencedPakNames();
	}
	Cvar_Set( "sv_referencedPakNames", p );

	p = FS_ReferencedPakChecksums();
	Cvar_Set( "sv_referencedPaks", p );

	Cvar_Set( "sv_paks", "" );
	Cvar_Set( "sv_pakNames", "" ); // not used on user-side

	if( sv_pure->integer ) {
		int freespace, pakslen, infolen;
		qboolean overflowed = qfalse;
		qboolean infoTruncated = qfalse;

		p = FS_LoadedPakChecksums( &overflowed );

		pakslen = strlen( p ) + 9; // + strlen( "\\sv_paks\\" )
		freespace = SV_RemainingGameState();
		infolen = strlen( Cvar_InfoString_Big( CVAR_SYSTEMINFO, &infoTruncated ) );

		if( infoTruncated ) {
			Com_Printf( S_COLOR_YELLOW "WARNING: truncated systeminfo!\n" );
		}

		if( pakslen > freespace || infolen + pakslen >= BIG_INFO_STRING || overflowed ) {
			// switch to degraded pure mode
			// this could *potentially* lead to a false "unpure user" detection
			// which is better than guaranteed drop
			Com_DPrintf( S_COLOR_YELLOW "WARNING: skipping sv_paks setup to avoid gamestate overflow\n" );
		} else {
			// the host sends these to the users so they will only
			// load pk3s also loaded at the host
			Cvar_Set( "sv_paks", p );
			if( *p == '\0' ) {
				Com_Printf( S_COLOR_YELLOW "WARNING: sv_pure set but no PK3 files loaded\n" );
			}
		}
	}

	// save systeminfo and hostinfo strings
	SV_SetConfigstring( CS_SYSTEMINFO, Cvar_InfoString_Big( CVAR_SYSTEMINFO, NULL ) );
	cvar_modifiedFlags &= ~CVAR_SYSTEMINFO;

	SV_SetConfigstring( CS_HOSTINFO, Cvar_InfoString( CVAR_HOSTINFO, NULL ) );
	cvar_modifiedFlags &= ~CVAR_HOSTINFO;

	// any media configstring setting now should issue a warning
	// and any configstring changes should be reliably transmitted
	// to all users
	sv.state = SS_GAME;

	// send a heartbeat now so the master will get up to date info
	SV_Heartbeat_f();

	Hunk_SetMark();

	Com_Printf("-----------------------------------\n");

	Sys_SetStatus( "Running map %s", mapname );
}


/*
===============
SV_Init

Only called at main exe startup, not for each game
===============
*/
void SV_Init( void )
{
	int index;

	SV_AddOperatorCommands();

	if( com_dedicated->integer )
		SV_AddDedicatedCommands();

	// hostinfo vars
	Cvar_Get("dmflags", "0", CVAR_HOSTINFO);
	Cvar_Get("fraglimit", "20", CVAR_HOSTINFO);
	Cvar_Get("timelimit", "0", CVAR_HOSTINFO);
	sv_gametype = Cvar_Get("g_gametype", "0", CVAR_HOSTINFO | CVAR_LATCH );
	Cvar_Get("sv_keywords", "", CVAR_HOSTINFO);
	//Cvar_Get("protocol", va("%i", PROTOCOL_VERSION), CVAR_HOSTINFO | CVAR_ROM);
	sv_mapname = Cvar_Get("mapname", "nomap", CVAR_HOSTINFO | CVAR_ROM);
	sv_privateUsers = Cvar_Get( "sv_privateUsers", "0", CVAR_HOSTINFO );
	Cvar_CheckRange( sv_privateUsers, "0", va( "%i", MAX_USERS-1 ), CV_INTEGER );
	sv_hostname = Cvar_Get("sv_hostname", "noname", CVAR_HOSTINFO | CVAR_ARCHIVE );
	sv_maxusers = Cvar_Get("sv_maxusers", "8", CVAR_HOSTINFO | CVAR_LATCH);
	Cvar_CheckRange( sv_maxusers, "1", XSTRING(MAX_USERS), CV_INTEGER );

	sv_maxusersPerIP = Cvar_Get( "sv_maxusersPerIP", "3", CVAR_ARCHIVE );
	Cvar_CheckRange( sv_maxusersPerIP, "1", NULL, CV_INTEGER );
	Cvar_SetDescription( sv_maxusersPerIP, "Limits number of simultaneous connections from the same IP address." );

	sv_userTLD = Cvar_Get( "sv_userTLD", "0", CVAR_ARCHIVE_ND );
	Cvar_CheckRange( sv_userTLD, NULL, NULL, CV_INTEGER );

	sv_minRate = Cvar_Get( "sv_minRate", "0", CVAR_ARCHIVE_ND | CVAR_HOSTINFO );
	sv_maxRate = Cvar_Get( "sv_maxRate", "0", CVAR_ARCHIVE_ND | CVAR_HOSTINFO );
	sv_dlRate = Cvar_Get( "sv_dlRate", "100", CVAR_ARCHIVE | CVAR_HOSTINFO );
	Cvar_CheckRange( sv_dlRate, "0", "500", CV_INTEGER );
	sv_floodProtect = Cvar_Get( "sv_floodProtect", "1", CVAR_ARCHIVE | CVAR_HOSTINFO );

	// systeminfo
	Cvar_Get( "sv_cheats", "1", CVAR_SYSTEMINFO | CVAR_ROM );
	sv_hostid = Cvar_Get( "sv_hostid", "0", CVAR_SYSTEMINFO | CVAR_ROM );
	sv_pure = Cvar_Get( "sv_pure", "1", CVAR_SYSTEMINFO | CVAR_LATCH );
	Cvar_Get( "sv_paks", "", CVAR_SYSTEMINFO | CVAR_ROM );
	Cvar_Get( "sv_pakNames", "", CVAR_SYSTEMINFO | CVAR_ROM );
	Cvar_Get( "sv_referencedPaks", "", CVAR_SYSTEMINFO | CVAR_ROM );
	sv_referencedPakNames = Cvar_Get( "sv_referencedPakNames", "", CVAR_SYSTEMINFO | CVAR_ROM );

	// host vars
	sv_rconPassword = Cvar_Get("rconPassword", "", CVAR_TEMP );
	sv_privatePassword = Cvar_Get("sv_privatePassword", "", CVAR_TEMP );
	sv_fps = Cvar_Get("sv_fps", "20", CVAR_TEMP );
	Cvar_CheckRange( sv_fps, "10", "125", CV_INTEGER );
	sv_timeout = Cvar_Get( "sv_timeout", "200", CVAR_TEMP );
	Cvar_CheckRange( sv_timeout, "4", NULL, CV_INTEGER );
	Cvar_SetDescription( sv_timeout, "Seconds without any message before automatic user disconnect" );
	sv_zombietime = Cvar_Get( "sv_zombietime", "2", CVAR_TEMP );
	Cvar_CheckRange( sv_zombietime, "1", NULL, CV_INTEGER );
	Cvar_SetDescription( sv_zombietime, "Seconds to sink messages after disconnect" );
	Cvar_Get("nextmap", "", CVAR_TEMP );

	sv_allowDownload = Cvar_Get("sv_allowDownload", "1", CVAR_HOSTINFO);
	Cvar_Get("sv_dlURL", "", CVAR_HOSTINFO | CVAR_ARCHIVE);

	// moved to Com_Init()
	//sv_master[0] = Cvar_Get( "sv_master1", MASTER_HOST_NAME, CVAR_INIT | CVAR_ARCHIVE_ND );
	//sv_master[1] = Cvar_Get( "sv_master2", "master.ioquake3.org", CVAR_INIT | CVAR_ARCHIVE_ND );
	//sv_master[2] = Cvar_Get( "sv_master3", "master.maverickhosts.com", CVAR_INIT | CVAR_ARCHIVE_ND );

	for( index = 0; index < MAX_MASTER_HOSTS; index++ )
		sv_master[ index ] = Cvar_Get( va( "sv_master%d", index + 1 ), "", CVAR_ARCHIVE_ND );

	sv_reconnectlimit = Cvar_Get( "sv_reconnectlimit", "3", 0 );
	Cvar_CheckRange( sv_reconnectlimit, "0", "12", CV_INTEGER );

	sv_padPackets = Cvar_Get( "sv_padPackets", "0", CVAR_DEVELOPER );
	sv_killhost = Cvar_Get( "sv_killhost", "0", 0 );
	sv_mapChecksum = Cvar_Get( "sv_mapChecksum", "", CVAR_ROM );
	sv_lanForceRate = Cvar_Get( "sv_lanForceRate", "1", CVAR_ARCHIVE_ND );

#ifdef USE_BANS
	sv_banFile = Cvar_Get("sv_banFile", "hostbans.dat", CVAR_ARCHIVE);
#endif

	sv_levelTimeReset = Cvar_Get( "sv_levelTimeReset", "0", CVAR_ARCHIVE_ND );

	sv_filter = Cvar_Get( "sv_filter", "filter.txt", CVAR_ARCHIVE );

	// initialize bot cvars so they are listed and can be set before loading the botlib
	SV_BotInitCvars();

	// init the botlib here because we need the pre-compiler in the UI
	SV_BotInitBotLib();

#ifdef USE_BANS
	// Load saved bans
	Cbuf_AddText("rehashbans\n");
#endif

	// track group cvar changes
	Cvar_SetGroup( sv_lanForceRate, CVG_HOST );
	Cvar_SetGroup( sv_minRate, CVG_HOST );
	Cvar_SetGroup( sv_maxRate, CVG_HOST );
	Cvar_SetGroup( sv_fps, CVG_HOST );

	// force initial check
	SV_TrackCvarChanges();

	SV_InitChallenger();
}


/*
==================
SV_FinalMessage

Used by SV_Shutdown to send a final message to all
connected users before the host goes down.  The messages are sent immediately,
not just stuck on the outgoing message list, because the host is going
to totally exit after returning from this function.
==================
*/
void SV_FinalMessage( const char *message ) {
	int			i, j;
	user_t	*cl;

	// send it twice, ignoring rate
	for( j = 0 ; j < 2 ; j++ ) {
		for(i=0, cl = svs.users ; i < sv_maxusers->integer ; i++, cl++) {
			if(cl->state >= CS_CONNECTED ) {
				// don't send a disconnect to a local user
				if( cl->netchan.remoteAddress.type != NA_LOOPBACK ) {
					SV_SendHostCommand( cl, "print \"%s\n\"\n", message );
					SV_SendHostCommand( cl, "disconnect \"%s\"", message );
				}
				// force a snapshot to be sent
				cl->lastSnapshotTime = svs.time - 9999; // generate a snapshot immediately
				cl->state = CS_ZOMBIE; // skip delta generation
				SV_SendUserSnapshot( cl );
			}
		}
	}
}


/*
================
SV_Shutdown

Called when each game quits,
before Sys_Quit or Sys_Error
================
*/
void SV_Shutdown( const char *finalmsg ) {
	if( !com_sv_running || !com_sv_running->integer ) {
		return;
	}

	Com_Printf( "----- Host Shutdown(%s) -----\n", finalmsg );

#ifdef USE_IPV6
	NET_LeaveMulticast6();
#endif

	if( svs.users && !com_errorEntered ) {
		SV_FinalMessage( finalmsg );
	}

	SV_RemoveOperatorCommands();
	SV_MasterShutdown();
	SV_ShutdownGameProgs();
	SV_InitChallenger();

	// free current level
	SV_ClearHost();

	SV_FreeIP4DB();

	// free host static data
	if( svs.users ) {
		int index;

		for( index = 0; index < sv_maxusers->integer; index++ )
			SV_FreeUser( &svs.users[ index ] );

		Z_Free( svs.users );
	}
	Com_Memset( &svs, 0, sizeof( svs ) );
	sv.time = 0;

	Cvar_Set( "sv_running", "0" );

	// allow setting timescale 0 for demo playback
	Cvar_CheckRange( com_timescale, "0", NULL, CV_FLOAT );

#ifndef DEDICATED
	Cvar_Set( "ui_singlePlayerActive", "0" );
#endif

	Com_Printf( "---------------------------\n" );

#ifndef DEDICATED
	// disconnect any local users
	if( sv_killhost->integer != 2 )
		CL_Disconnect( qfalse );
#endif

	// clean some host cvars
	Cvar_Set( "sv_referencedPaks", "" );
	Cvar_Set( "sv_referencedPakNames", "" );
	Cvar_Set( "sv_mapChecksum", "" );
	Cvar_Set( "sv_hostid", "0" );

	Sys_SetStatus( "Host is not running" );
}
