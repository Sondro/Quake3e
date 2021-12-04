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

#include "../co/q_shared.h"
#include "../co/co.h"
#include "host.h"

/*
==============
SV_Netchan_Encode

	// first four bytes of the data are always:
	long reliableAcknowledge;

==============
*/
static void SV_Netchan_Encode(user_t *user, msg_t *msg, const char *userCommandString)
{
	long i, index;
	byte key, *string;
	int	srdc, sbit;
	qboolean soob;

	if( msg->cursize < SV_ENCODE_START ) {
		return;
	}

	srdc = msg->readcount;
	sbit = msg->bit;
	soob = msg->oob;

	msg->bit = 0;
	msg->readcount = 0;
	msg->oob = qfalse;

	/* reliableAcknowledge = */ MSG_ReadLong(msg);

	msg->oob = soob;
	msg->bit = sbit;
	msg->readcount = srdc;

	string =(byte *) userCommandString;
	index = 0;
	// xor the user challenge with the netchan sequence number
	key = user->challenge ^ user->netchan.outgoingSequence;
	for(i = SV_ENCODE_START; i < msg->cursize; i++) {
		// modify the key with the last received and with this message acknowledged user command
		if(!string[index])
			index = 0;
		if(string[index] > 127 || string[index] == '%') {
			key ^= '.' <<(i & 1);
		}
		else {
			key ^= string[index] <<(i & 1);
		}
		index++;
		// encode the data with this key
		*(msg->data + i) = *(msg->data + i) ^ key;
	}
}

/*
==============
SV_Netchan_Decode

	// first 12 bytes of the data are always:
	long hostId;
	long messageAcknowledge;
	long reliableAcknowledge;

==============
*/
static void SV_Netchan_Decode( user_t *user, msg_t *msg ) {
	int hostId, messageAcknowledge, reliableAcknowledge;
	int i, index, srdc, sbit;
	qboolean soob;
	byte key, *string;

	srdc = msg->readcount;
	sbit = msg->bit;
	soob = msg->oob;

	msg->oob = qfalse;

	hostId = MSG_ReadLong(msg);
	messageAcknowledge = MSG_ReadLong(msg);
	reliableAcknowledge = MSG_ReadLong(msg);

	msg->oob = soob;
	msg->bit = sbit;
	msg->readcount = srdc;

	string =(byte *)user->reliableCommands[ reliableAcknowledge &(MAX_RELIABLE_COMMANDS-1) ];
	index = 0;
	//
	key = user->challenge ^ hostId ^ messageAcknowledge;
	for(i = msg->readcount + SV_DECODE_START; i < msg->cursize; i++) {
		// modify the key with the last sent and acknowledged host command
		if(!string[index])
			index = 0;
		if(string[index] > 127 || string[index] == '%') {
			key ^= '.' <<(i & 1);
		}
		else {
			key ^= string[index] <<(i & 1);
		}
		index++;
		// decode the data with this key
		*(msg->data + i) = *(msg->data + i) ^ key;
	}
}


/*
=================
SV_Netchan_FreeQueue
=================
*/
void SV_Netchan_FreeQueue(user_t *user)
{
	netchan_buffer_t *netbuf, *next;
	
	for(netbuf = user->netchan_start_queue; netbuf; netbuf = next)
	{
		next = netbuf->next;
		Z_Free(netbuf);
	}
	
	user->netchan_start_queue = NULL;
	user->netchan_end_queue = &user->netchan_start_queue;
}

/*
=================
SV_Netchan_TransmitNextInQueue
=================
*/
void SV_Netchan_TransmitNextInQueue(user_t *user)
{
	netchan_buffer_t *netbuf;
		
	Com_DPrintf("#462 Netchan_TransmitNextFragment: popping a queued message for transmit\n");
	netbuf = user->netchan_start_queue;

	if( user->compat )
		SV_Netchan_Encode(user, &netbuf->msg, netbuf->userCommandString);

	Netchan_Transmit(&user->netchan, netbuf->msg.cursize, netbuf->msg.data);

	// pop from queue
	user->netchan_start_queue = netbuf->next;
	if(!user->netchan_start_queue)
	{
		Com_DPrintf("#462 Netchan_TransmitNextFragment: emptied queue\n");
		user->netchan_end_queue = &user->netchan_start_queue;
	}
	else
		Com_DPrintf("#462 Netchan_TransmitNextFragment: remaining queued message\n");

	Z_Free(netbuf);
}

/*
=================
SV_Netchan_TransmitNextFragment
Transmit the next fragment and the next queued packet
Return number of ms until next message can be sent based on throughput given by user rate,
-1 if no packet was sent.
=================
*/

int SV_Netchan_TransmitNextFragment(user_t *user)
{
	if(user->netchan.unsentFragments)
	{
		Netchan_TransmitNextFragment(&user->netchan);
		return SV_RateMsec(user);
	}
	else if(user->netchan_start_queue)
	{
		SV_Netchan_TransmitNextInQueue(user);
		return SV_RateMsec(user);
	}
	
	return -1;
}


/*
===============
SV_Netchan_Transmit
TTimo
https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=462
if there are some unsent fragments(which may happen if the snapshots
and the gamestate are fragmenting, and collide on send for instance)
then buffer them and make sure they get sent in correct order
================
*/

void SV_Netchan_Transmit( user_t *user, msg_t *msg)
{
	MSG_WriteByte( msg, svc_EOF );

	if(user->netchan.unsentFragments || user->netchan_start_queue)
	{
		netchan_buffer_t *netbuf;
		Com_DPrintf("#462 SV_Netchan_Transmit: unsent fragments, stacked\n");
		netbuf =(netchan_buffer_t *) Z_Malloc(sizeof(netchan_buffer_t));
		// store the msg, we can't store it encoded, as the encoding depends on stuff we still have to finish sending
		MSG_Copy(&netbuf->msg, netbuf->msgBuffer, sizeof( netbuf->msgBuffer ), msg);
		if( user->compat ) 
		{
			Q_strncpyz(netbuf->userCommandString, user->lastUserCommandString,
				sizeof(netbuf->userCommandString));
		}
		netbuf->next = NULL;
		// insert it in the queue, the message will be encoded and sent later
		*user->netchan_end_queue = netbuf;
		user->netchan_end_queue = &(*user->netchan_end_queue)->next;
	}
	else
	{
		if( user->compat )
			SV_Netchan_Encode(user, msg, user->lastUserCommandString);
		Netchan_Transmit( &user->netchan, msg->cursize, msg->data );
	}
}

/*
=================
Netchan_SV_Process
=================
*/
qboolean SV_Netchan_Process( user_t *user, msg_t *msg ) {
	qboolean ret;
	
	ret = Netchan_Process( &user->netchan, msg );
	if( !ret )
		return qfalse;

	if( user->compat )
		SV_Netchan_Decode( user, msg );

	return qtrue;
}

