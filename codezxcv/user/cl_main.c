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
// cl_main.c  -- user main loop

#include "user.h"
#include <limits.h>

cvar_t	*cl_noprint;
cvar_t	*cl_debugMove;
cvar_t	*cl_motd;

#ifdef GFXER_DLLS_ON_Make
cvar_t	*cl_gfxer;
#endif

cvar_t	*rcon_user_password;
cvar_t	*rconAddress;

cvar_t	*cl_timeout;
cvar_t	*cl_autoNudge;
cvar_t	*cl_timeNudge;
cvar_t	*cl_showTimeDelta;

cvar_t	*cl_shownet;
cvar_t	*cl_autoRecordDemo;

cvar_t	*cl_aviFrameRate;
cvar_t	*cl_aviMotionJpeg;
cvar_t	*cl_forceavidemo;
cvar_t	*cl_aviPipeFormat;

cvar_t	*cl_activeAction;

cvar_t	*cl_motdString;

cvar_t	*cl_allowDownload;
#ifdef CURL_ON_Make
cvar_t	*cl_mapAutoDownload;
#endif
cvar_t	*cl_conXOffset;
cvar_t	*cl_conColor;
cvar_t	*cl_inGameVideo;

cvar_t	*cl_hostStatusResendTime;

cvar_t	*cl_lanForcePackets;

cvar_t	*cl_guidHostUniq;

cvar_t	*cl_dlURL;
cvar_t	*cl_dlDirectory;

cvar_t	*cl_reconnectArgs;

// common cvars for GLimp modules
cvar_t	*vid_xpos;			// X coordinate of window position
cvar_t	*vid_ypos;			// Y coordinate of window position
cvar_t	*r_noborder;

cvar_t *r_allowSoftwareGL;	// don't abort out if the pixelformat claims software
cvar_t *r_swapInterval;
cvar_t *r_glDriver;
cvar_t *r_displayRefresh;
cvar_t *r_fullscreen;
cvar_t *r_mode;
cvar_t *r_modeFullscreen;
cvar_t *r_customwidth;
cvar_t *r_customheight;
cvar_t *r_customPixelAspect;

cvar_t *r_colorbits;
// these also shared with gfxers:
cvar_t *cl_stencilbits;
cvar_t *cl_depthbits;
cvar_t *cl_drawBuffer;

userActive_t		cl;
userConnection_t	clc;
userStatic_t		cls;
vm_t				*cgvm = NULL;

netadr_t			rcon_address;

char				cl_oldGame[ MAX_QPATH ];
qboolean			cl_oldGameSet;
static	qboolean	noGameRestart = qfalse;

#ifdef CURL_ON_Make
download_t			download;
#endif

// Structure containing functions exported from refresh DLL
refexport_t	re;
#ifdef GFXER_DLLS_ON_Make
static void	*gfxerLib;
#endif

ping_t	cl_pinglist[MAX_PINGREQUESTS];

typedef struct hostStatus_s
{
	char string[BIG_INFO_STRING];
	netadr_t address;
	int time, startTime;
	qboolean pending;
	qboolean print;
	qboolean retrieved;
} hostStatus_t;

hostStatus_t cl_hostStatusList[MAX_HOSTSTATUSREQUESTS];

static void CL_CheckForResend(void);
static void CL_ShowIP_f(void);
static void CL_HostStatus_f(void);
static void CL_HostStatusResponse(const netadr_t *from, msg_t *msg);
static void CL_HostInfoPacket(const netadr_t *from, msg_t *msg);

static void CL_Download_f(void);
static void CL_LocalHosts_f(void);
static void CL_GlobalHosts_f(void);
static void CL_Ping_f(void);

static void CL_InitRef(void);
static void CL_ShutdownRef(refShutdownCode_t code);
static void CL_InitGLimp_Cvars(void);

static void CL_NextDemo(void);

/*
===============
CL_CDDialog

Called by Com_Error when a cd is needed
===============
*/
void CL_CDDialog(void) {
	cls.cddialog = qtrue;	// start it next frame
}


/*
=======================================================================

USER RELIABLE COMMAND COMMUNICATION

=======================================================================
*/

/*
======================
CL_AddReliableCommand

The given command will be transmitted to the host, and is guaranteed to
not have future usercmd_t executed before it is executed
======================
*/
void CL_AddReliableCommand(const char *cmd, qboolean isDisconnectCmd) {
	int		index;
	int		unacknowledged = clc.reliableSequence - clc.reliableAcknowledge;

	if(clc.hostAddress.type == NA_BAD)
		return;

	// if we would be losing an old command that hasn't been acknowledged,
	// we must drop the connection
	// also leave one slot open for the disconnect command in this case.

	if((isDisconnectCmd && unacknowledged > MAX_RELIABLE_COMMANDS) ||
		(!isDisconnectCmd && unacknowledged >= MAX_RELIABLE_COMMANDS))
	{
		if(com_errorEntered)
			return;
		else
			Com_Error(ERR_DROP, "User command overflow");
	}

	clc.reliableSequence++;
	index = clc.reliableSequence &(MAX_RELIABLE_COMMANDS - 1);
	Q_strncpyz(clc.reliableCommands[ index ], cmd, sizeof(clc.reliableCommands[ index ]));
}


/*
=======================================================================

USER SIDE DEMO RECORDING

=======================================================================
*/

/*
====================
CL_WriteDemoMessage

Dumps the current net message, prefixed by the length
====================
*/
static void CL_WriteDemoMessage(msg_t *msg, int headerBytes) {
	int		len, swlen;

	// write the packet sequence
	len = clc.hostMessageSequence;
	swlen = LittleLong(len);
	FS_Write(&swlen, 4, clc.recordfile);

	// skip the packet sequencing information
	len = msg->cursize - headerBytes;
	swlen = LittleLong(len);
	FS_Write(&swlen, 4, clc.recordfile);
	FS_Write(msg->data + headerBytes, len, clc.recordfile);
}


/*
====================
CL_StopRecording_f

stop recording a demo
====================
*/
void CL_StopRecord_f(void) {

	if(clc.recordfile != FS_INVALID_HANDLE) {
		char tempName[MAX_OSPATH];
		char finalName[MAX_OSPATH];
		int protocol;
		int	len, sequence;

		// finish up
		len = -1;
		FS_Write(&len, 4, clc.recordfile);
		FS_Write(&len, 4, clc.recordfile);
		FS_FCloseFile(clc.recordfile);
		clc.recordfile = FS_INVALID_HANDLE;

		// select proper extension
		if(clc.dm68compat || clc.demoplaying)
			protocol = PROTOCOL_VERSION;
		else
			protocol = NEW_PROTOCOL_VERSION;

		Com_sprintf(tempName, sizeof(tempName), "%s.tmp", clc.recordName);

		Com_sprintf(finalName, sizeof(finalName), "%s.%s%d", clc.recordName, DEMOEXT, protocol);

		if(clc.explicitRecordName) {
			FS_Remove(finalName);
		} else {
			// add sequence suffix to avoid overwrite
			sequence = 0;
			while(FS_FileExists(finalName) && ++sequence < 1000) {
				Com_sprintf(finalName, sizeof(finalName), "%s-%02d.%s%d",
					clc.recordName, sequence, DEMOEXT, protocol);
			}
		}

		FS_Rename(tempName, finalName);
	}

	if(!clc.demorecording) {
		Com_Printf("Not recording a demo.\n");
	} else {
		Com_Printf("Stopped demo recording.\n");
	}

	clc.demorecording = qfalse;
	clc.spDemoRecording = qfalse;
}


/*
====================
CL_WriteHostCommands
====================
*/
static void CL_WriteHostCommands(msg_t *msg) {
	int i;

	if(clc.demoCommandSequence < clc.hostCommandSequence) {

		// do not write more than MAX_RELIABLE_COMMANDS
		if(clc.hostCommandSequence - clc.demoCommandSequence > MAX_RELIABLE_COMMANDS)
			clc.demoCommandSequence = clc.hostCommandSequence - MAX_RELIABLE_COMMANDS;

		for(i = clc.demoCommandSequence + 1 ; i <= clc.hostCommandSequence; i++) {
			MSG_WriteByte(msg, svc_hostCommand);
			MSG_WriteLong(msg, i);
			MSG_WriteString(msg, clc.hostCommands[ i &(MAX_RELIABLE_COMMANDS-1) ]);
		}
	}

	clc.demoCommandSequence = clc.hostCommandSequence;
}


/*
====================
CL_WriteGamestate
====================
*/
static void CL_WriteGamestate(qboolean initial)
{
	byte		bufData[ MAX_MSGLEN_BUF ];
	char		*s;
	msg_t		msg;
	int			i;
	int			len;
	entityState_t	*ent;
	entityState_t	nullstate;

	// write out the gamestate message
	MSG_Init(&msg, bufData, MAX_MSGLEN);
	MSG_Bitstream(&msg);

	// NOTE, MRE: all host->user messages now acknowledge
	MSG_WriteLong(&msg, clc.reliableSequence);

	if(initial) {
		clc.demoMessageSequence = 1;
		clc.demoCommandSequence = clc.hostCommandSequence;
	} else {
		CL_WriteHostCommands(&msg);
	}

	clc.demoDeltaNum = 0; // reset delta for next snapshot

	MSG_WriteByte(&msg, svc_gamestate);
	MSG_WriteLong(&msg, clc.hostCommandSequence);

	// configstrings
	for(i = 0 ; i < MAX_CONFIGSTRINGS ; i++) {
		if(!cl.gameState.stringOffsets[i]) {
			continue;
		}
		s = cl.gameState.stringData + cl.gameState.stringOffsets[i];
		MSG_WriteByte(&msg, svc_configstring);
		MSG_WriteShort(&msg, i);
		MSG_WriteBigString(&msg, s);
	}

	// baselines
	Com_Memset(&nullstate, 0, sizeof(nullstate));
	for(i = 0; i < MAX_GENTITIES ; i++) {
		if(!cl.baselineUsed[ i ])
			continue;
		ent = &cl.entityBaselines[ i ];
		MSG_WriteByte(&msg, svc_baseline);
		MSG_WriteDeltaEntity(&msg, &nullstate, ent, qtrue);
	}

	// finalize message
	MSG_WriteByte(&msg, svc_EOF);

	// finished writing the gamestate stuff

	// write the user num
	MSG_WriteLong(&msg, clc.userNum);

	// write the checksum feed
	MSG_WriteLong(&msg, clc.checksumFeed);

	// finished writing the user packet
	MSG_WriteByte(&msg, svc_EOF);

	// write it to the demo file
	if(clc.demoplaying)
		len = LittleLong(clc.demoMessageSequence - 1);
	else
		len = LittleLong(clc.hostMessageSequence - 1);

	FS_Write(&len, 4, clc.recordfile);

	len = LittleLong(msg.cursize);
	FS_Write(&len, 4, clc.recordfile);
	FS_Write(msg.data, msg.cursize, clc.recordfile);
}


/*
=============
CL_EmitPacketEntities
=============
*/
static void CL_EmitPacketEntities(clSnapshot_t *from, clSnapshot_t *to, msg_t *msg, entityState_t *oldents) {
	entityState_t	*oldent, *newent;
	int		oldindex, newindex;
	int		oldnum, newnum;
	int		from_num_entities;

	// generate the delta update
	if(!from) {
		from_num_entities = 0;
	} else {
		from_num_entities = from->numEntities;
	}

	newent = NULL;
	oldent = NULL;
	newindex = 0;
	oldindex = 0;
	while(newindex < to->numEntities || oldindex < from_num_entities) {
		if(newindex >= to->numEntities) {
			newnum = MAX_GENTITIES+1;
		} else {
			newent = &cl.parseEntities[(to->parseEntitiesNum + newindex) % MAX_PARSE_ENTITIES];
			newnum = newent->number;
		}

		if(oldindex >= from_num_entities) {
			oldnum = MAX_GENTITIES+1;
		} else {
			//oldent = &cl.parseEntities[(from->parseEntitiesNum + oldindex) % MAX_PARSE_ENTITIES];
			oldent = &oldents[ oldindex ];
			oldnum = oldent->number;
		}

		if(newnum == oldnum) {
			// delta update from old position
			// because the force parm is qfalse, this will not result
			// in any bytes being emitted if the entity has not changed at all
			MSG_WriteDeltaEntity(msg, oldent, newent, qfalse);
			oldindex++;
			newindex++;
			continue;
		}

		if(newnum < oldnum) {
			// this is a new entity, send it from the baseline
			MSG_WriteDeltaEntity(msg, &cl.entityBaselines[newnum], newent, qtrue);
			newindex++;
			continue;
		}

		if(newnum > oldnum) {
			// the old entity isn't present in the new message
			MSG_WriteDeltaEntity(msg, oldent, NULL, qtrue);
			oldindex++;
			continue;
		}
	}

	MSG_WriteBits(msg,(MAX_GENTITIES-1), GENTITYNUM_BITS);	// end of packetentities
}


/*
====================
CL_WriteSnapshot
====================
*/
static void CL_WriteSnapshot(void) {

	static	clSnapshot_t saved_snap;
	static entityState_t saved_ents[ MAX_SNAPSHOT_ENTITIES ];

	clSnapshot_t *snap, *oldSnap;
	byte	bufData[ MAX_MSGLEN_BUF ];
	msg_t	msg;
	int		i, len;

	snap = &cl.snapshots[ cl.snap.messageNum & PACKET_MASK ]; // current snapshot
	//if(!snap->valid) // should never happen?
	//	return;

	if(clc.demoDeltaNum == 0) {
		oldSnap = NULL;
	} else {
		oldSnap = &saved_snap;
	}

	MSG_Init(&msg, bufData, MAX_MSGLEN);
	MSG_Bitstream(&msg);

	// NOTE, MRE: all host->user messages now acknowledge
	MSG_WriteLong(&msg, clc.reliableSequence);

	// Write all pending host commands
	CL_WriteHostCommands(&msg);

	MSG_WriteByte(&msg, svc_snapshot);
	MSG_WriteLong(&msg, snap->hostTime); // sv.time
	MSG_WriteByte(&msg, clc.demoDeltaNum); // 0 or 1
	MSG_WriteByte(&msg, snap->snapFlags);  // snapFlags
	MSG_WriteByte(&msg, snap->areabytes);  // areabytes
	MSG_WriteData(&msg, snap->areamask, snap->areabytes);
	if(oldSnap)
		MSG_WriteDeltaPlayerstate(&msg, &oldSnap->ps, &snap->ps);
	else
		MSG_WriteDeltaPlayerstate(&msg, NULL, &snap->ps);

	CL_EmitPacketEntities(oldSnap, snap, &msg, saved_ents);

	// finished writing the user packet
	MSG_WriteByte(&msg, svc_EOF);

	// write it to the demo file
	if(clc.demoplaying)
		len = LittleLong(clc.demoMessageSequence);
	else
		len = LittleLong(clc.hostMessageSequence);
	FS_Write(&len, 4, clc.recordfile);

	len = LittleLong(msg.cursize);
	FS_Write(&len, 4, clc.recordfile);
	FS_Write(msg.data, msg.cursize, clc.recordfile);

	// save last sent state so if there any need - we can skip any further incoming messages
	for(i = 0; i < snap->numEntities; i++)
		saved_ents[ i ] = cl.parseEntities[(snap->parseEntitiesNum + i) % MAX_PARSE_ENTITIES ];

	saved_snap = *snap;
	saved_snap.parseEntitiesNum = 0;

	clc.demoMessageSequence++;
	clc.demoDeltaNum = 1;
}


/*
====================
CL_Record_f

record <demoname>

Begins recording a demo from the current position
====================
*/
static void CL_Record_f(void) {
	char		demoName[MAX_OSPATH];
	char		name[MAX_OSPATH];
	char		demoExt[16];
	const char	*ext;
	qtime_t		t;

	if(Cmd_Argc() > 2) {
		Com_Printf("record <demoname>\n");
		return;
	}

	if(clc.demorecording) {
		if(!clc.spDemoRecording) {
			Com_Printf("Already recording.\n");
		}
		return;
	}

	if(cls.state != CA_ACTIVE) {
		Com_Printf("You must be in a level to record.\n");
		return;
	}

	// sync 0 doesn't prevent recording, so not forcing it off .. everyone does g_sync 1 ; record ; g_sync 0 ..
	if(NET_IsLocalAddress(&clc.hostAddress) && !Cvar_VariableIntegerValue("g_synchronousUsers")) {
		Com_Printf(S_COLOR_YELLOW "WARNING: You should set 'g_synchronousUsers 1' for smoother demo recording\n");
	}

	if(Cmd_Argc() == 2) {
		// explicit demo name specified
		Q_strncpyz(demoName, Cmd_Argv(1), sizeof(demoName));
		ext = COM_GetExtension(demoName);
		if(*ext) {
			// strip demo extension
			sprintf(demoExt, "%s%d", DEMOEXT, PROTOCOL_VERSION);
			if(Q_stricmp(ext, demoExt) == 0) {
				*(strrchr(demoName, '.')) = '\0';
			} else {
				// check both protocols
				sprintf(demoExt, "%s%d", DEMOEXT, NEW_PROTOCOL_VERSION);
				if(Q_stricmp(ext, demoExt) == 0) {
					*(strrchr(demoName, '.')) = '\0';
				}
			}
		}
		Com_sprintf(name, sizeof(name), "demos/%s", demoName);

		clc.explicitRecordName = qtrue;
	} else {

		Com_RealTime(&t);
		Com_sprintf(name, sizeof(name), "demos/demo-%04d%02d%02d-%02d%02d%02d",
			1900 + t.tm_year, 1 + t.tm_mon,	t.tm_mday, t.tm_hour, t.tm_min, t.tm_sec);

		clc.explicitRecordName = qfalse;
	}

	// save desired filename without extension
	Q_strncpyz(clc.recordName, name, sizeof(clc.recordName));

	Com_Printf("recording to %s.\n", name);

	// start new record with temporary extension
	Q_strcat(name, sizeof(name), ".tmp");

	// open the demo file
	clc.recordfile = FS_FOpenFileWrite(name);
	if(clc.recordfile == FS_INVALID_HANDLE) {
		Com_Printf("ERROR: couldn't open.\n");
		clc.recordName[0] = '\0';
		return;
	}

	clc.demorecording = qtrue;

	Com_TruncateLongString(clc.recordNameShort, clc.recordName);

	if(Cvar_VariableIntegerValue("ui_recordSPDemo")) {
	  clc.spDemoRecording = qtrue;
	} else {
	  clc.spDemoRecording = qfalse;
	}

	// don't start saving messages until a non-delta compressed message is received
	clc.demowaiting = qtrue;

	// we will rename record to dm_68 or dm_71 depending from this flag
	clc.dm68compat = qtrue;

	// write out the gamestate message
	CL_WriteGamestate(qtrue);

	// the rest of the demo file will be copied from net messages
}


/*
====================
CL_CompleteRecordName
====================
*/
static void CL_CompleteRecordName(char *args, int argNum)
{
	if(argNum == 2)
	{
		char demoExt[ 16 ];

		Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", PROTOCOL_VERSION);
		Field_CompleteFilename("demos", demoExt, qtrue, FS_MATCH_EXTERN | FS_MATCH_STICK);
	}
}


/*
=======================================================================

USER SIDE DEMO PLAYBACK

=======================================================================
*/

/*
=================
CL_DemoCompleted
=================
*/
static void CL_DemoCompleted(void) {
	if(com_timedemo->integer) {
		int	time;

		time = Sys_Milliseconds() - clc.timeDemoStart;
		if(time > 0) {
			Com_Printf("%i frames, %3.*f seconds: %3.1f fps\n", clc.timeDemoFrames,
			time > 10000 ? 1 : 2, time/1000.0, clc.timeDemoFrames*1000.0 / time);
		}
	}

	CL_Disconnect(qtrue);
	CL_NextDemo();
}


/*
=================
CL_ReadDemoMessage
=================
*/
void CL_ReadDemoMessage(void) {
	int			r;
	msg_t		buf;
	byte		bufData[ MAX_MSGLEN_BUF ];
	int			s;

	if(clc.demofile == FS_INVALID_HANDLE) {
		CL_DemoCompleted();
		return;
	}

	// get the sequence number
	r = FS_Read(&s, 4, clc.demofile);
	if(r != 4) {
		CL_DemoCompleted();
		return;
	}
	clc.hostMessageSequence = LittleLong(s);

	// init the message
	MSG_Init(&buf, bufData, MAX_MSGLEN);

	// get the length
	r = FS_Read(&buf.cursize, 4, clc.demofile);
	if(r != 4) {
		CL_DemoCompleted();
		return;
	}
	buf.cursize = LittleLong(buf.cursize);
	if(buf.cursize == -1) {
		CL_DemoCompleted();
		return;
	}
	if(buf.cursize > buf.maxsize) {
		Com_Error(ERR_DROP, "CL_ReadDemoMessage: demoMsglen > MAX_MSGLEN");
	}
	r = FS_Read(buf.data, buf.cursize, clc.demofile);
	if(r != buf.cursize) {
		Com_Printf("Demo file was truncated.\n");
		CL_DemoCompleted();
		return;
	}

	clc.lastPacketTime = cls.realtime;
	buf.readcount = 0;

	clc.demoCommandSequence = clc.hostCommandSequence;

	CL_ParseHostMessage(&buf);

	if(clc.demorecording) {
		// track changes and write new message
		if(clc.eventMask & EM_GAMESTATE) {
			CL_WriteGamestate(qfalse);
			// nothing should came after gamestate in current message
		} else if(clc.eventMask &(EM_SNAPSHOT|EM_COMMAND)) {
			CL_WriteSnapshot();
		}
	}
}


/*
====================
CL_WalkDemoExt
====================
*/
static int CL_WalkDemoExt(const char *arg, char *name, fileHandle_t *handle)
{
	int i;

	*handle = FS_INVALID_HANDLE;
	i = 0;

	while(demo_protocols[ i ])
	{
		Com_sprintf(name, MAX_OSPATH, "demos/%s.dm_%d", arg, demo_protocols[ i ]);
		FS_BypassPure();
		FS_FOpenFileRead(name, handle, qtrue);
		FS_RestorePure();
		if(*handle != FS_INVALID_HANDLE)
		{
			Com_Printf("Demo file: %s\n", name);
			return demo_protocols[ i ];
		}
		else
			Com_Printf("Not found: %s\n", name);
		i++;
	}
	return -1;
}


/*
====================
CL_DemoExtCallback
====================
*/
static qboolean CL_DemoNameCallback_f(const char *filename, int length)
{
	int version;

	if(length < 7 || Q_stricmpn(filename + length - 6, ".dm_", 4))
		return qfalse;

	version = atoi(filename + length - 2);
	if(version < 66 || version > NEW_PROTOCOL_VERSION)
		return qfalse;

	return qtrue;
}


/*
====================
CL_CompleteDemoName
====================
*/
static void CL_CompleteDemoName(char *args, int argNum)
{
	if(argNum == 2)
	{
		FS_SetFilenameCallback(CL_DemoNameCallback_f);
		Field_CompleteFilename("demos", ".dm_??", qfalse, FS_MATCH_ANY | FS_MATCH_STICK);
		FS_SetFilenameCallback(NULL);
	}
}


/*
====================
CL_PlayDemo_f

demo <demoname>

====================
*/
static void CL_PlayDemo_f(void) {
	char		name[MAX_OSPATH];
	char		*arg, *ext_test;
	int			protocol, i;
	char		retry[MAX_OSPATH];
	const char	*shortname, *slash;
	fileHandle_t hFile;

	if(Cmd_Argc() != 2) {
		Com_Printf("demo <demoname>\n");
		return;
	}

	// open the demo file
	arg = Cmd_Argv(1);

	// check for an extension .DEMOEXT_??(?? is protocol)
	ext_test = strrchr(arg, '.');
	if(ext_test && !Q_stricmpn(ext_test + 1, DEMOEXT, ARRAY_LEN(DEMOEXT) - 1))
	{
		protocol = atoi(ext_test + ARRAY_LEN(DEMOEXT));

		for(i = 0; demo_protocols[ i ]; i++)
		{
			if(demo_protocols[ i ] == protocol)
				break;
		}

		if(demo_protocols[ i ] || protocol == com_protocol->integer )
		{
			Com_sprintf(name, sizeof(name), "demos/%s", arg);
			FS_BypassPure();
			FS_FOpenFileRead(name, &hFile, qtrue);
			FS_RestorePure();
		}
		else
		{
			size_t len;

			Com_Printf("Protocol %d not supported for demos\n", protocol);
			len = ext_test - arg;

			if(len >= ARRAY_LEN(retry))
				len = ARRAY_LEN(retry) - 1;

			Q_strncpyz(retry, arg, len + 1);
			retry[len] = '\0';
			protocol = CL_WalkDemoExt(retry, name, &hFile);
		}
	}
	else
		protocol = CL_WalkDemoExt(arg, name, &hFile);

	if(hFile == FS_INVALID_HANDLE) {
		Com_Printf(S_COLOR_YELLOW "couldn't open %s\n", name);
		return;
	}

	FS_FCloseFile(hFile);
	hFile = FS_INVALID_HANDLE;

	// make sure a local host is killed
	// 2 means don't force disconnect of local user
	Cvar_Set("sv_killhost", "2");

	CL_Disconnect(qtrue);

	// clc.demofile will be closed during CL_Disconnect so reopen it
	if(FS_FOpenFileRead(name, &clc.demofile, qtrue) == -1)
	{
		// drop this time
		Com_Error(ERR_DROP, "couldn't open %s\n", name);
		return;
	}

	if((slash = strrchr(name, '/')) != NULL)
		shortname = slash + 1;
	else
		shortname = name;

	Q_strncpyz(clc.demoName, shortname, sizeof(clc.demoName));

	Con_Close();

	cls.state = CA_CONNECTED;
	clc.demoplaying = qtrue;
	Q_strncpyz(cls.hostname, shortname, sizeof(cls.hostname));

	if(protocol < NEW_PROTOCOL_VERSION)
		clc.compat = qtrue;
	else
		clc.compat = qfalse;

	// read demo messages until connected
#ifdef CURL_ON_Make
	while(cls.state >= CA_CONNECTED && cls.state < CA_PRIMED && !Com_DL_InProgress(&download)) {
#else
	while(cls.state >= CA_CONNECTED && cls.state < CA_PRIMED) {
#endif
		CL_ReadDemoMessage();
	}

	// don't get the first snapshot this frame, to prevent the long
	// time from the gamestate load from messing causing a time skip
	clc.firstDemoFrameSkipped = qfalse;
}


/*
==================
CL_NextDemo

Called when a demo or cinematic finishes
If the "nextdemo" cvar is set, that command will be issued
==================
*/
static void CL_NextDemo(void) {
	char v[ MAX_CVAR_VALUE_STRING ];

	Cvar_VariableStringBuffer("nextdemo", v, sizeof(v));
	Com_DPrintf("CL_NextDemo: %s\n", v);
	if(!v[0]) {
		return;
	}

	Cvar_Set("nextdemo", "");
	Cbuf_AddText(v);
	Cbuf_AddText("\n");
	Cbuf_Execute();
}


//======================================================================

/*
=====================
CL_ShutdownVMs
=====================
*/
static void CL_ShutdownVMs(void)
{
	CL_ShutdownCGame();
	CL_ShutdownUI();
}


/*
=====================
Called by Com_GameRestart, CL_FlushMemory and SV_SpawnHost

CL_ShutdownAll
=====================
*/
void CL_ShutdownAll(void) {

#ifdef CURL_ON_Make
	CL_cURL_Shutdown();
#endif

	// clear and mute all sounds until next registration
	S_DisableSounds();

	// shutdown VMs
	CL_ShutdownVMs();

	// shutdown the gfxer
	if(re.Shutdown) {
		if(CL_GameSwitch()) {
			CL_ShutdownRef(REF_DESTROY_WINDOW); // shutdown gfxer & GLimp
		} else {
			re.Shutdown(REF_KEEP_CONTEXT); // don't destroy window or context
		}
	}

	cls.gfxerStarted = qfalse;
	cls.soundRegistered = qfalse;

	SCR_Done();
}


/*
=================
CL_ClearMemory
=================
*/
void CL_ClearMemory(void) {
	// if not running a host clear the whole hunk
	if(!com_sv_running->integer) {
		// clear the whole hunk
		Hunk_Clear();
		// clear collision map data
		CM_ClearMap();
	} else {
		// clear all the user data on the hunk
		Hunk_ClearToMark();
	}
}


/*
=================
CL_FlushMemory

Called by CL_Disconnect_f, CL_DownloadsComplete
Also called by Com_Error
=================
*/
void CL_FlushMemory(void) {

	// shutdown all the user stuff
	CL_ShutdownAll();

	CL_ClearMemory();

	CL_StartHunkUsers();
}


/*
=====================
CL_MapLoading

A local host is starting to load a map, so update the
screen to let the user know about it, then dump all user
memory on the hunk from app, ui, and gfxer
=====================
*/
void CL_MapLoading(void) {
	if(com_dedicated->integer) {
		cls.state = CA_DISCONNECTED;
		Key_SetCatcher(KEYCATCH_CONSOLE);
		return;
	}

	if(!com_cl_running->integer) {
		return;
	}

	Con_Close();
	Key_SetCatcher(0);

	// if we are already connected to the local host, stay connected
	if(cls.state >= CA_CONNECTED && !Q_stricmp(cls.hostname, "localhost")) {
		cls.state = CA_CONNECTED;		// so the connect screen is drawn
		Com_Memset(cls.updateInfoString, 0, sizeof(cls.updateInfoString));
		Com_Memset(clc.hostMessage, 0, sizeof(clc.hostMessage));
		Com_Memset(&cl.gameState, 0, sizeof(cl.gameState));
		clc.lastPacketSentTime = -9999;
		cls.framecount++;
		SCR_UpdateScreen();
	} else {
		// clear nextmap so the cinematic shutdown doesn't execute it
		Cvar_Set("nextmap", "");
		CL_Disconnect(qtrue);
		Q_strncpyz(cls.hostname, "localhost", sizeof(cls.hostname));
		cls.state = CA_CHALLENGING;		// so the connect screen is drawn
		Key_SetCatcher(0);
		cls.framecount++;
		SCR_UpdateScreen();
		clc.connectTime = -RETRANSMIT_TIMEOUT;
		NET_StringToAdr(cls.hostname, &clc.hostAddress, NA_UNSPEC);
		// we don't need a challenge on the localhost
		CL_CheckForResend();
	}
}


/*
=====================
CL_ClearState

Called before parsing a gamestate
=====================
*/
void CL_ClearState(void) {

//	S_StopAllSounds();

	Com_Memset(&cl, 0, sizeof(cl));
}


/*
====================
CL_UpdateGUID

update cl_guid using QKEY_FILE and optional prefix
====================
*/
static void CL_UpdateGUID(const char *prefix, int prefix_len)
{
#ifdef USE_Q3KEY
	fileHandle_t f;
	int len;

	len = FS_SV_FOpenFileRead(QKEY_FILE, &f);
	FS_FCloseFile(f);

	if(len != QKEY_SIZE)
		Cvar_Set("cl_guid", "");
	else
		Cvar_Set("cl_guid", Com_MD5File(QKEY_FILE, QKEY_SIZE,
			prefix, prefix_len));
#else
	Cvar_Set("cl_guid", Com_MD5Buf(&cl_cdkey[0], sizeof(cl_cdkey), prefix, prefix_len));
#endif
}


/*
=====================
CL_ResetOldGame
=====================
*/
void CL_ResetOldGame(void)
{
	cl_oldGameSet = qfalse;
	cl_oldGame[0] = '\0';
}


/*
=====================
CL_RestoreOldGame

change back to previous fs_game
=====================
*/
static qboolean CL_RestoreOldGame(void)
{
	if(cl_oldGameSet)
	{
		cl_oldGameSet = qfalse;
		Cvar_Set("fs_game", cl_oldGame);
		FS_ConditionalRestart(clc.checksumFeed, qtrue);
		return qtrue;
	}
	return qfalse;
}


/*
=====================
CL_Disconnect

Called when a connection, demo, or cinematic is being terminated.
Goes from a connected state to either a menu state or a console state
Sends a disconnect message to the host
This is also called on Com_Error and Com_Quit, so it shouldn't cause any errors
=====================
*/
qboolean CL_Disconnect(qboolean showMainMenu) {
	static qboolean cl_disconnecting = qfalse;
	qboolean cl_restarted = qfalse;

	if(!com_cl_running || !com_cl_running->integer) {
		return cl_restarted;
	}

	if(cl_disconnecting) {
		return cl_restarted;
	}

	cl_disconnecting = qtrue;

	// Stop demo recording
	if(clc.demorecording) {
		CL_StopRecord_f();
	}

	// Stop demo playback
	if(clc.demofile != FS_INVALID_HANDLE) {
		FS_FCloseFile(clc.demofile);
		clc.demofile = FS_INVALID_HANDLE;
	}

	// Finish downloads
	if(clc.download != FS_INVALID_HANDLE) {
		FS_FCloseFile(clc.download);
		clc.download = FS_INVALID_HANDLE;
	}
	*clc.downloadTempName = *clc.downloadName = '\0';
	Cvar_Set("cl_downloadName", "");

	// Stop recording any video
	if(CL_VideoRecording()) {
		// Finish drawing current frame
		cls.framecount++;
		SCR_UpdateScreen();
		CL_CloseAVI();
	}

	if(cgvm) {
		// do that right after we drawed last video frame
		CL_ShutdownCGame();
	}

	SCR_StopCinematic();
	S_StopAllSounds();
	Key_ClearStates();

	if(uivm && showMainMenu) {
		VM_Call(uivm, 1, UI_SET_ACTIVE_MENU, UIMENU_NONE);
	}

	// Remove pure paks
	FS_PureHostSetLoadedPaks("", "");
	FS_PureHostSetReferencedPaks("", "");

	FS_ClearPakReferences(FS_GENERAL_REF | FS_UI_REF | FS_CGAME_REF);

	if(CL_GameSwitch()) {
		// keep current gamestate and connection
		cl_disconnecting = qfalse;
		return qfalse;
	}

	// send a disconnect message to the host
	// send it a few times in case one is dropped
	if(cls.state >= CA_CONNECTED && cls.state != CA_CINEMATIC && !clc.demoplaying) {
		CL_AddReliableCommand("disconnect", qtrue);
		CL_WritePacket();
		CL_WritePacket();
		CL_WritePacket();
	}

	CL_ClearState();

	// wipe the user connection
	Com_Memset(&clc, 0, sizeof(clc));

	cls.state = CA_DISCONNECTED;

	// allow cheats locally
	Cvar_Set("sv_cheats", "1");

	// not connected to a pure host anymore
	cl_connectedToPureHost = 0;

	CL_UpdateGUID(NULL, 0);

	// Cmd_RemoveCommand("callvote");
	Cmd_RemoveCgameCommands();

	if(noGameRestart)
		noGameRestart = qfalse;
	else
		cl_restarted = CL_RestoreOldGame();

	cl_disconnecting = qfalse;

	return cl_restarted;
}


/*
===================
CL_ForwardCommandToHost

adds the current command line as a userCommand
things like godmode, noclip, etc, are commands directed to the host,
so when they are typed in at the console, they will need to be forwarded.
===================
*/
void CL_ForwardCommandToHost(const char *string) {
	const char *cmd;

	cmd = Cmd_Argv(0);

	// ignore key up commands
	if(cmd[0] == '-') {
		return;
	}

	// no userinfo updates from command line
	if(!strcmp(cmd, "userinfo")) {
		return;
	}

	if(clc.demoplaying || cls.state < CA_CONNECTED || cmd[0] == '+') {
		Com_Printf("Unknown command \"%s" S_COLOR_WHITE "\"\n", cmd);
		return;
	}

	if(Cmd_Argc() > 1) {
		CL_AddReliableCommand(string, qfalse);
	} else {
		CL_AddReliableCommand(cmd, qfalse);
	}
}


/*
===================
CL_RequestMotd

===================
*/
#if 0
void CL_RequestMotd(void) {
	char		info[MAX_INFO_STRING];

	if(!cl_motd->integer) {
		return;
	}
	Com_Printf("Resolving %s\n", UPDATE_HOST_NAME);
	if(!NET_StringToAdr(UPDATE_HOST_NAME, &cls.updateHost, NA_IP)) {
		Com_Printf("Couldn't resolve address\n");
		return;
	}
	cls.updateHost.port = BigShort(PORT_UPDATE);
	Com_Printf("%s resolved to %i.%i.%i.%i:%i\n", UPDATE_HOST_NAME,
		cls.updateHost.ip[0], cls.updateHost.ip[1],
		cls.updateHost.ip[2], cls.updateHost.ip[3],
		BigShort(cls.updateHost.port));

	info[0] = 0;
	// NOTE TTimo xoring against Com_Milliseconds, otherwise we may not have a true randomization
	// only srand I could catch before here is tr_noise.c l:26 srand(1001)
	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=382
	// NOTE: the Com_Milliseconds xoring only affects the lower 16-bit word,
	//   but I decided it was enough randomization
	Com_sprintf(cls.updateChallenge, sizeof(cls.updateChallenge), "%i",((rand() << 16) ^ rand()) ^ Com_Milliseconds());

	Info_SetValueForKey(info, "challenge", cls.updateChallenge);
	Info_SetValueForKey(info, "gfxer", cls.glconfig.gfxer_string);
	Info_SetValueForKey(info, "version", com_version->string);

	NET_OutOfBandPrint(NS_USER, &cls.updateHost, "getmotd \"%s\"\n", info);
}
#endif

/*
===================
CL_RequestAuthorization

Authorization host protocol
-----------------------------

All commands are text in Q3 out of band packets(leading 0xff 0xff 0xff 0xff).

Whenever the user tries to get a challenge from the host it wants to
connect to, it also blindly fires off a packet to the authorize host:

getKeyAuthorize <challenge> <cdkey>

cdkey may be "demo"


#OLD The authorize host returns a:
#OLD
#OLD keyAthorize <challenge> <accept | deny>
#OLD
#OLD A user will be accepted if the cdkey is valid and it has not been used by any other IP
#OLD address in the last 15 minutes.


The host sends a:

getIpAuthorize <challenge> <ip>

The authorize host returns a:

ipAuthorize <challenge> <accept | deny | demo | unknown >

A user will be accepted if a valid cdkey was sent by that ip(only) in the last 15 minutes.
If no response is received from the authorize host after two tries, the user will be let
in anyway.
===================
*/
#ifndef STANDALONE
static void CL_RequestAuthorization(void) {
	char	nums[64];
	int		i, j, l;
	cvar_t	*fs;

	if(!cls.authorizeHost.port) {
		Com_Printf("Resolving %s\n", AUTHORIZE_HOST_NAME);
		if(!NET_StringToAdr(AUTHORIZE_HOST_NAME, &cls.authorizeHost, NA_IP)) {
			Com_Printf("Couldn't resolve address\n");
			return;
		}

		cls.authorizeHost.port = BigShort(PORT_AUTHORIZE);
		Com_Printf("%s resolved to %i.%i.%i.%i:%i\n", AUTHORIZE_HOST_NAME,
			cls.authorizeHost.ipv._4[0], cls.authorizeHost.ipv._4[1],
			cls.authorizeHost.ipv._4[2], cls.authorizeHost.ipv._4[3],
			BigShort(cls.authorizeHost.port));
	}
	if(cls.authorizeHost.type == NA_BAD) {
		return;
	}

	// only grab the alphanumeric values from the cdkey, to avoid any dashes or spaces
	j = 0;
	l = strlen(cl_cdkey);
	if(l > 32) {
		l = 32;
	}
	for(i = 0 ; i < l ; i++) {
		if((cl_cdkey[i] >= '0' && cl_cdkey[i] <= '9')
				||(cl_cdkey[i] >= 'a' && cl_cdkey[i] <= 'z')
				||(cl_cdkey[i] >= 'A' && cl_cdkey[i] <= 'Z')
			) {
			nums[j] = cl_cdkey[i];
			j++;
		}
	}
	nums[j] = 0;

	fs = Cvar_Get("cl_anonymous", "0", CVAR_INIT | CVAR_SYSTEMINFO);

	NET_OutOfBandPrint(NS_USER, &cls.authorizeHost, "getKeyAuthorize %i %s", fs->integer, nums);
}
#endif


/*
======================================================================

CONSOLE COMMANDS

======================================================================
*/

/*
==================
CL_ForwardToHost_f
==================
*/
static void CL_ForwardToHost_f(void) {
	if(cls.state != CA_ACTIVE || clc.demoplaying) {
		Com_Printf("Not connected to a host.\n");
		return;
	}

	if(Cmd_Argc() <= 1 || strcmp(Cmd_Argv(1), "userinfo") == 0)
		return;

	// don't forward the first argument
	CL_AddReliableCommand(Cmd_ArgsFrom(1), qfalse);
}


/*
==================
CL_Disconnect_f
==================
*/
void CL_Disconnect_f(void) {
	SCR_StopCinematic();
	Cvar_Set("ui_singlePlayerActive", "0");
	if(cls.state != CA_DISCONNECTED && cls.state != CA_CINEMATIC) {
		if((uivm && uivm->callLevel) ||(cgvm && cgvm->callLevel)) {
			Com_Error(ERR_DISCONNECT, "Disconnected from host");
		} else {
			// clear any previous "host full" type messages
			clc.hostMessage[0] = '\0';
			if(com_sv_running && com_sv_running->integer) {
				// if running a local host, kill it
				SV_Shutdown("Disconnected from host");
			} else {
				Com_Printf("Disconnected from %s\n", cls.hostname);
			}
			Cvar_Set("com_errorMessage", "");
			if(!CL_Disconnect(qfalse)) { // restart user if not done already
				CL_FlushMemory();
			}
			if(uivm) {
				VM_Call(uivm, 1, UI_SET_ACTIVE_MENU, UIMENU_MAIN);
			}
		}
	}
}


/*
================
CL_Reconnect_f
================
*/
static void CL_Reconnect_f(void) {
	if(cl_reconnectArgs->string[0] == '\0' || Q_stricmp(cl_reconnectArgs->string, "localhost") == 0)
		return;
	Cvar_Set("ui_singlePlayerActive", "0");
	Cbuf_AddText(va("connect %s\n", cl_reconnectArgs->string));
}


/*
================
CL_Connect_f
================
*/
static void CL_Connect_f(void) {
	netadrtype_t family;
	netadr_t	addr;
	char	buffer[ sizeof(cls.hostname) ];  // same length as cls.hostname
	char	args[ sizeof(cls.hostname) + MAX_CVAR_VALUE_STRING ];
	char	*host;
	const char	*hostString;
	int		len;
	int		argc;

	argc = Cmd_Argc();
	family = NA_UNSPEC;

	if(argc != 2 && argc != 3) {
		Com_Printf("usage: connect [-4|-6] <host>\n");
		return;
	}

	if(argc == 2) {
		host = Cmd_Argv(1);
	} else {
		if(!strcmp(Cmd_Argv(1), "-4"))
			family = NA_IP;
#ifdef USE_IPV6
		else if(!strcmp(Cmd_Argv(1), "-6"))
			family = NA_IP6;
		else
			Com_Printf(S_COLOR_YELLOW "warning: only -4 or -6 as address type understood.\n");
#else
			Com_Printf(S_COLOR_YELLOW "warning: only -4 as address type understood.\n");
#endif
		host = Cmd_Argv(2);
	}

	Q_strncpyz(buffer, host, sizeof(buffer));
	host = buffer;

	// skip leading "q3a:/" in connection string
	if(!Q_stricmpn(host, "q3a:/", 5)) {
		host += 5;
	}

	// skip all slash prefixes
	while(*host == '/') {
		host++;
	}

	len = strlen(host);
	if(len <= 0) {
		return;
	}

	// some programs may add ending slash
	if(host[len-1] == '/') {
		host[len-1] = '\0';
	}

	if(!*host) {
		return;
	}

	// try resolve remote host first
	if(!NET_StringToAdr(host, &addr, family)) {
		Com_Printf(S_COLOR_YELLOW "Bad host address - %s\n", host);
		return;
	}

	// save arguments for reconnect
	Q_strncpyz(args, Cmd_ArgsFrom(1), sizeof(args));

	Cvar_Set("ui_singlePlayerActive", "0");

	// clear any previous "host full" type messages
	clc.hostMessage[0] = '\0';

	// if running a local host, kill it
	if(com_sv_running->integer && !strcmp(host, "localhost")) {
		SV_Shutdown("Host quit");
	}

	// make sure a local host is killed
	Cvar_Set("sv_killhost", "1");
	SV_Frame(0);

	noGameRestart = qtrue;
	CL_Disconnect(qtrue);
	Con_Close();

	Q_strncpyz(cls.hostname, host, sizeof(cls.hostname));

	// copy resolved address
	clc.hostAddress = addr;

	if(clc.hostAddress.port == 0) {
		clc.hostAddress.port = BigShort(PORT_HOST);
	}

	hostString = NET_AdrToStringwPort(&clc.hostAddress);

	Com_Printf("%s resolved to %s\n", cls.hostname, hostString);

	if(cl_guidHostUniq->integer)
		CL_UpdateGUID(hostString, strlen(hostString));
	else
		CL_UpdateGUID(NULL, 0);

	// if we aren't playing on a lan, we need to authenticate
	// with the cd key
	if(NET_IsLocalAddress(&clc.hostAddress)) {
		cls.state = CA_CHALLENGING;
	} else {
		cls.state = CA_CONNECTING;

		// Set a user challenge number that ideally is mirrored back by the host.
		//clc.challenge =((rand() << 16) ^ rand()) ^ Com_Milliseconds();
		Com_RandomBytes((byte*)&clc.challenge, sizeof(clc.challenge));
	}

	Key_SetCatcher(0);
	clc.connectTime = -99999;	// CL_CheckForResend() will fire immediately
	clc.connectPacketCount = 0;

	Cvar_Set("cl_reconnectArgs", args);

	// host connection string
	Cvar_Set("cl_currentHostAddress", host);
}

#define MAX_RCON_MESSAGE(MAX_STRING_CHARS+4)

/*
==================
CL_CompleteRcon
==================
*/
static void CL_CompleteRcon(char *args, int argNum)
{
	if(argNum >= 2)
	{
		// Skip "rcon "
		char *p = Com_SkipTokens(args, 1, " ");

		if(p > args)
			Field_CompleteCommand(p, qtrue, qtrue);
	}
}


/*
=====================
CL_Rcon_f

Send the rest of the command line over as
an unconnected command.
=====================
*/
static void CL_Rcon_f(void) {
	char message[MAX_RCON_MESSAGE];
	const char *sp;
	int len;

	if(!rcon_user_password->string[0]) {
		Com_Printf("You must set 'rconpassword' before\n"
			"issuing an rcon command.\n");
		return;
	}

	if(cls.state >= CA_CONNECTED) {
		rcon_address = clc.netchan.remoteAddress;
	} else {
		if(!rconAddress->string[0]) {
			Com_Printf("You must either be connected,\n"
				"or set the 'rconAddress' cvar\n"
				"to issue rcon commands\n");
			return;
		}
		if(!NET_StringToAdr(rconAddress->string, &rcon_address, NA_UNSPEC)) {
			return;
		}
		if(rcon_address.port == 0) {
			rcon_address.port = BigShort(PORT_HOST);
		}
	}

	message[0] = -1;
	message[1] = -1;
	message[2] = -1;
	message[3] = -1;
	message[4] = '\0';

	// we may need to quote password if it contains spaces
	sp = strchr(rcon_user_password->string, ' ');

	len = Com_sprintf(message+4, sizeof(message)-4,
		sp ? "rcon \"%s\" %s" : "rcon %s %s",
		rcon_user_password->string,
		Cmd_Cmd() + 5) + 4 + 1; // including OOB marker and '\0'

	NET_SendPacket(NS_USER, len, message, &rcon_address);
}


/*
=================
CL_SendPureChecksums
=================
*/
static void CL_SendPureChecksums(void) {
	char cMsg[ MAX_STRING_CHARS-1 ];
	int len;

	if(!cl_connectedToPureHost || clc.demoplaying)
		return;

	// if we are pure we need to send back a command with our referenced pk3 checksums
	len = sprintf(cMsg, "cp %d ", cl.hostId);
	strcpy(cMsg + len, FS_ReferencedPakPureChecksums(sizeof(cMsg) - len - 1));

	CL_AddReliableCommand(cMsg, qfalse);
}


/*
=================
CL_ResetPureUserAtHost
=================
*/
static void CL_ResetPureUserAtHost(void) {
	CL_AddReliableCommand("vdr", qfalse);
}


/*
=================
CL_Vid_Restart

Restart the video subsystem

we also have to reload the UI and CGame because the gfxer
doesn't know what graphics to reload
=================
*/
static void CL_Vid_Restart(qboolean keepWindow) {

	// Settings may have changed so stop recording now
	if(CL_VideoRecording())
		CL_CloseAVI();

	if(clc.demorecording)
		CL_StopRecord_f();

	// clear and mute all sounds until next registration
	S_DisableSounds();

	// shutdown VMs
	CL_ShutdownVMs();

	// shutdown the gfxer and clear the gfxer interface
	CL_ShutdownRef(keepWindow ? REF_KEEP_WINDOW : REF_DESTROY_WINDOW);

	// user is no longer pure until new checksums are sent
	CL_ResetPureUserAtHost();

	// clear pak references
	FS_ClearPakReferences(FS_UI_REF | FS_CGAME_REF);

	// reinitialize the filesystem if the game directory or checksum has changed
	if(!clc.demoplaying) // -EC-
		FS_ConditionalRestart(clc.checksumFeed, qfalse);

	cls.soundRegistered = qfalse;

	// unpause so the app definitely gets a snapshot and draws a frame
	Cvar_Set("cl_paused", "0");

	CL_ClearMemory();

	// startup all the user stuff
	CL_StartHunkUsers();

	// start the app if connected
	if((cls.state > CA_CONNECTED && cls.state != CA_CINEMATIC) || cls.startCgame) {
		cls.appStarted = qtrue;
		CL_InitCGame();
		// send pure checksums
		CL_SendPureChecksums();
	}

	cls.startCgame = qfalse;
}


/*
=================
CL_Vid_Restart_f

Wrapper for CL_Vid_Restart
=================
*/
static void CL_Vid_Restart_f(void) {

	 // hack for OSP mod: do not allow vid restart right after app init
	if(cls.lastVidRestart)
		if(abs(cls.lastVidRestart - Sys_Milliseconds()) < 500)
			return;

	if(Q_stricmp(Cmd_Argv(1), "keep_window") == 0)
		CL_Vid_Restart(qtrue);
	else
		CL_Vid_Restart(qfalse);
}


/*
=================
CL_Snd_Restart_f

Restart the sound subsystem
The app and game must also be forced to restart because
handles will be invalid
=================
*/
static void CL_Snd_Restart_f(void)
{
	S_Shutdown();

	// sound will be reinitialized by vid_restart
	CL_Vid_Restart(qtrue);
}


/*
==================
CL_PK3List_f
==================
*/
void CL_OpenedPK3List_f(void) {
	Com_Printf("Opened PK3 Names: %s\n", FS_LoadedPakNames());
}


/*
==================
CL_PureList_f
==================
*/
static void CL_ReferencedPK3List_f(void) {
	Com_Printf("Referenced PK3 Names: %s\n", FS_ReferencedPakNames());
}


/*
==================
CL_Configstrings_f
==================
*/
static void CL_Configstrings_f(void) {
	int		i;
	int		ofs;

	if(cls.state != CA_ACTIVE) {
		Com_Printf("Not connected to a host.\n");
		return;
	}

	for(i = 0 ; i < MAX_CONFIGSTRINGS ; i++) {
		ofs = cl.gameState.stringOffsets[ i ];
		if(!ofs) {
			continue;
		}
		Com_Printf("%4i: %s\n", i, cl.gameState.stringData + ofs);
	}
}


/*
==============
CL_Userinfo_f
==============
*/
static void CL_Userinfo_f(void) {
	Com_Printf("--------- User Information ---------\n");
	Com_Printf("state: %i\n", cls.state);
	Com_Printf("Host: %s\n", cls.hostname);
	Com_Printf("User info settings:\n");
	Info_Print(Cvar_InfoString(CVAR_USERINFO, NULL));
	Com_Printf("--------------------------------------\n");
}


/*
==============
CL_Hostinfo_f
==============
*/
static void CL_Hostinfo_f(void) {
	int		ofs;

	ofs = cl.gameState.stringOffsets[ CS_HOSTINFO ];
	if(!ofs)
		return;

	Com_Printf("Host info settings:\n");
	Info_Print(cl.gameState.stringData + ofs);
}


/*
===========
CL_Systeminfo_f
===========
*/
static void CL_Systeminfo_f(void) {
	int ofs;

	ofs = cl.gameState.stringOffsets[ CS_SYSTEMINFO ];
	if(!ofs)
		return;

	Com_Printf("System info settings:\n");
	Info_Print(cl.gameState.stringData + ofs);
}


static void CL_CompleteCallvote(char *args, int argNum)
{
	if(argNum >= 2)
	{
		// Skip "callvote "
		char *p = Com_SkipTokens(args, 1, " ");

		if(p > args)
			Field_CompleteCommand(p, qtrue, qtrue);
	}
}


//====================================================================

/*
=================
CL_DownloadsComplete

Called when all downloading has been completed
=================
*/
static void CL_DownloadsComplete(void) {

#ifdef CURL_ON_Make
	// if we downloaded with cURL
	if(clc.cURLUsed) {
		clc.cURLUsed = qfalse;
		CL_cURL_Shutdown();
		if(clc.cURLDisconnected) {
			if(clc.downloadRestart) {
				FS_Restart(clc.checksumFeed);
				clc.downloadRestart = qfalse;
			}
			clc.cURLDisconnected = qfalse;
			CL_Reconnect_f();
			return;
		}
	}
#endif

	// if we downloaded files we need to restart the file system
	if(clc.downloadRestart) {
		clc.downloadRestart = qfalse;

		FS_Restart(clc.checksumFeed); // We possibly downloaded a pak, restart the file system to load it

		// inform the host so we get new gamestate info
		CL_AddReliableCommand("donedl", qfalse);

		// by sending the donedl command we request a new gamestate
		// so we don't want to load stuff yet
		return;
	}

	// let the user game init and load data
	cls.state = CA_LOADING;

	// Pump the loop, this may change gamestate!
	Com_EventLoop();

	// if the gamestate was changed by calling Com_EventLoop
	// then we loaded everything already and we don't want to do it again.
	if(cls.state != CA_LOADING) {
		return;
	}

	// flush user memory and start loading stuff
	// this will also(re)load the UI
	// if this is a local user then only the user part of the hunk
	// will be cleared, note that this is done after the hunk mark has been set
	//if(!com_sv_running->integer)
	CL_FlushMemory();

	// initialize the CGame
	cls.appStarted = qtrue;
	CL_InitCGame();

	if(clc.demofile == FS_INVALID_HANDLE) {
		Cmd_AddCommand("callvote", NULL);
		Cmd_SetCommandCompletionFunc("callvote", CL_CompleteCallvote);
	}

	// set pure checksums
	CL_SendPureChecksums();

	CL_WritePacket();
	CL_WritePacket();
	CL_WritePacket();
}


/*
=================
CL_BeginDownload

Requests a file to download from the host.  Stores it in the current
game directory.
=================
*/
static void CL_BeginDownload(const char *localName, const char *remoteName) {

	Com_DPrintf("***** CL_BeginDownload *****\n"
				"Localname: %s\n"
				"Remotename: %s\n"
				"****************************\n", localName, remoteName);

	Q_strncpyz(clc.downloadName, localName, sizeof(clc.downloadName));
	Com_sprintf(clc.downloadTempName, sizeof(clc.downloadTempName), "%s.tmp", localName);

	// Set so UI gets access to it
	Cvar_Set("cl_downloadName", remoteName);
	Cvar_Set("cl_downloadSize", "0");
	Cvar_Set("cl_downloadCount", "0");
	Cvar_SetIntegerValue("cl_downloadTime", cls.realtime);

	clc.downloadBlock = 0; // Starting new file
	clc.downloadCount = 0;

	CL_AddReliableCommand(va("download %s", remoteName), qfalse);
}


/*
=================
CL_NextDownload

A download completed or failed
=================
*/
void CL_NextDownload(void)
{
	char *s;
	char *remoteName, *localName;
	qboolean useCURL = qfalse;

	// A download has finished, check whether this matches a referenced checksum
	if(*clc.downloadName)
	{
		const char *zippath = FS_BuildOSPath(Cvar_VariableString("fs_homepath"), clc.downloadName, NULL);

		if(!FS_CompareZipChecksum(zippath))
			Com_Error(ERR_DROP, "Incorrect checksum for file: %s", clc.downloadName);
	}

	*clc.downloadTempName = *clc.downloadName = 0;
	Cvar_Set("cl_downloadName", "");

	// We are looking to start a download here
	if(*clc.downloadList) {
		s = clc.downloadList;

		// format is:
		//  @remotename@localname@remotename@localname, etc.

		if(*s == '@')
			s++;
		remoteName = s;

		if((s = strchr(s, '@')) == NULL) {
			CL_DownloadsComplete();
			return;
		}

		*s++ = '\0';
		localName = s;
		if((s = strchr(s, '@')) != NULL)
			*s++ = '\0';
		else
			s = localName + strlen(localName); // point at the null byte

#ifdef CURL_ON_Make
		if(!(cl_allowDownload->integer & DLF_NO_REDIRECT)) {
			if(clc.sv_allowDownload & DLF_NO_REDIRECT) {
				Com_Printf("WARNING: host does not "
					"allow download redirection "
					"(sv_allowDownload is %d)\n",
					clc.sv_allowDownload);
			}
			else if(!*clc.sv_dlURL) {
				Com_Printf("WARNING: host allows "
					"download redirection, but does not "
					"have sv_dlURL set\n");
			}
			else if(!CL_cURL_Init()) {
				Com_Printf("WARNING: could not load "
					"cURL library\n");
			}
			else {
				CL_cURL_BeginDownload(localName, va("%s/%s",
					clc.sv_dlURL, remoteName));
				useCURL = qtrue;
			}
		}
		else if(!(clc.sv_allowDownload & DLF_NO_REDIRECT)) {
			Com_Printf("WARNING: host allows download "
				"redirection, but it disabled by user "
				"configuration(cl_allowDownload is %d)\n",
				cl_allowDownload->integer);
		}
#endif /* CURL_ON_Make */

		if(!useCURL) {
		if((cl_allowDownload->integer & DLF_NO_UDP)) {
				Com_Error(ERR_DROP, "UDP Downloads are "
					"disabled on your user. "
					"(cl_allowDownload is %d)",
					cl_allowDownload->integer);
				return;
			}
			else {
				CL_BeginDownload(localName, remoteName);
			}
		}
		clc.downloadRestart = qtrue;

		// move over the rest
		memmove(clc.downloadList, s, strlen(s) + 1);

		return;
	}

	CL_DownloadsComplete();
}


/*
=================
CL_InitDownloads

After receiving a valid game state, we valid the app and local zip files here
and determine if we need to download them
=================
*/
void CL_InitDownloads(void) {

	if(!(cl_allowDownload->integer & DLF_ENABLE))
	{
		char missingfiles[ MAXPRINTMSG ];

		// autodownload is disabled on the user
		// but it's possible that some referenced files on the host are missing
		if(FS_ComparePaks(missingfiles, sizeof(missingfiles), qfalse))
		{
			// NOTE TTimo I would rather have that printed as a modal message box
			// but at this point while joining the game we don't know wether we will successfully join or not
			Com_Printf("\nWARNING: You are missing some files referenced by the host:\n%s"
				"You might not be able to join the game\n"
				"Go to the setting menu to turn on autodownload, or get the file elsewhere\n\n", missingfiles);
		}
	}
	else if(FS_ComparePaks(clc.downloadList, sizeof(clc.downloadList) , qtrue)) {

		Com_Printf("Need paks: %s\n", clc.downloadList);

		if(*clc.downloadList) {
			// if autodownloading is not enabled on the host
			cls.state = CA_CONNECTED;

			*clc.downloadTempName = *clc.downloadName = '\0';
			Cvar_Set("cl_downloadName", "");

			CL_NextDownload();
			return;
		}

	}

#ifdef CURL_ON_Make
	if(cl_mapAutoDownload->integer &&(!(clc.sv_allowDownload & DLF_ENABLE) || clc.demoplaying))
	{
		const char *info, *mapname, *bsp;

		// get map name and BSP file name
		info = cl.gameState.stringData + cl.gameState.stringOffsets[ CS_HOSTINFO ];
		mapname = Info_ValueForKey(info, "mapname");
		bsp = va("maps/%s.bsp", mapname);

		if(FS_FOpenFileRead(bsp, NULL, qfalse) == -1)
		{
			if(CL_Download("dlmap", mapname, qtrue))
			{
				cls.state = CA_CONNECTED; // prevent continue loading and shows the ui download progress screen
				return;
			}
		}
	}
#endif // CURL_ON_Make

	CL_DownloadsComplete();
}


/*
=================
CL_CheckForResend

Resend a connect message if the last one has timed out
=================
*/
static void CL_CheckForResend(void) {
	int		port, len;
	char	info[MAX_INFO_STRING*2]; // larger buffer to detect overflows
	char	data[MAX_INFO_STRING];
	qboolean	notOverflowed;
	qboolean	infoTruncated;

	// don't send anything if playing back a demo
	if(clc.demoplaying) {
		return;
	}

	// resend if we haven't gotten a reply yet
	if(cls.state != CA_CONNECTING && cls.state != CA_CHALLENGING) {
		return;
	}

	if(cls.realtime - clc.connectTime < RETRANSMIT_TIMEOUT) {
		return;
	}

	clc.connectTime = cls.realtime;	// for retransmit requests
	clc.connectPacketCount++;

	switch(cls.state) {
	case CA_CONNECTING:
		// requesting a challenge .. IPv6 users always get in as authorize host supports no ipv6.
#ifndef STANDALONE
		if(!Cvar_VariableIntegerValue("com_standalone") && clc.hostAddress.type == NA_IP && !Sys_IsLANAddress(&clc.hostAddress))
			CL_RequestAuthorization();
#endif
		// The challenge request shall be followed by a user challenge so no malicious host can hijack this connection.
		NET_OutOfBandPrint(NS_USER, &clc.hostAddress, "getchallenge %d %s", clc.challenge, GAMENAME_FOR_MASTER);
		break;

	case CA_CHALLENGING:
		// sending back the challenge
		port = Cvar_VariableIntegerValue("net_qport");

		infoTruncated = qfalse;
		Q_strncpyz(info, Cvar_InfoString(CVAR_USERINFO, &infoTruncated), sizeof(info));

		// remove some non-important keys that may cause overflow during connection
		if(strlen(info) > MAX_USERINFO_LENGTH - 64) {
			infoTruncated |= Info_RemoveKey(info, "xp_name") ? qtrue : qfalse;
			infoTruncated |= Info_RemoveKey(info, "xp_country") ? qtrue : qfalse;
		}

		len = strlen(info);
		if(len > MAX_USERINFO_LENGTH) {
			notOverflowed = qfalse;
		} else {
			notOverflowed = qtrue;
		}

		if(com_protocol->integer != PROTOCOL_VERSION) {
			notOverflowed &= Info_SetValueForKey_s(info, MAX_USERINFO_LENGTH, "protocol",
				com_protocol->string);
		} else {
			notOverflowed &= Info_SetValueForKey_s(info, MAX_USERINFO_LENGTH, "protocol",
				clc.compat ? XSTRING(PROTOCOL_VERSION) : XSTRING(NEW_PROTOCOL_VERSION));
		}

		notOverflowed &= Info_SetValueForKey_s(info, MAX_USERINFO_LENGTH, "qport",
			va("%i", port));

		notOverflowed &= Info_SetValueForKey_s(info, MAX_USERINFO_LENGTH, "challenge",
			va("%i", clc.challenge));

		// for now - this will be used to inform host about q3msgboom fix
		// this is optional key so will not trigger oversize warning
		Info_SetValueForKey_s(info, MAX_USERINFO_LENGTH, "user", APP_VERSION);

		if(!notOverflowed) {
			Com_Printf(S_COLOR_YELLOW "WARNING: oversize userinfo, you might be not able to join remote host!\n");
		}

		len = Com_sprintf(data, sizeof(data), "connect \"%s\"", info);
		// NOTE TTimo don't forget to set the right data length!
		NET_OutOfBandCompress(NS_USER, &clc.hostAddress,(byte *) &data[0], len);
		// the most current userinfo has been sent, so watch for any
		// newer changes to userinfo variables
		cvar_modifiedFlags &= ~CVAR_USERINFO;

		// ... but force re-send if userinfo was truncated in any way
		if(infoTruncated || !notOverflowed) {
			cvar_modifiedFlags |= CVAR_USERINFO;
		}
		break;

	default:
		Com_Error(ERR_FATAL, "CL_CheckForResend: bad cls.state");
	}
}


/*
===================
CL_MotdPacket
===================
*/
static void CL_MotdPacket(const netadr_t *from) {
	const char *challenge;
	const char *info;

	// if not from our host, ignore it
	if(!NET_CompareAdr(from, &cls.updateHost)) {
		return;
	}

	info = Cmd_Argv(1);

	// check challenge
	challenge = Info_ValueForKey(info, "challenge");
	if(strcmp(challenge, cls.updateChallenge)) {
		return;
	}

	challenge = Info_ValueForKey(info, "motd");

	Q_strncpyz(cls.updateInfoString, info, sizeof(cls.updateInfoString));
	Cvar_Set("cl_motdString", challenge);
}


/*
===================
CL_InitHostInfo
===================
*/
static void CL_InitHostInfo(hostInfo_t *host, const netadr_t *address) {
	host->adr = *address;
	host->users = 0;
	host->hostName[0] = '\0';
	host->mapName[0] = '\0';
	host->maxUsers = 0;
	host->maxPing = 0;
	host->minPing = 0;
	host->ping = -1;
	host->game[0] = '\0';
	host->gameType = 0;
	host->netType = 0;
	host->punkbuster = 0;
	host->g_humanplayers = 0;
	host->g_needpass = 0;
}

#define MAX_HOSTSPERPACKET	256

typedef struct hash_chain_s {
	netadr_t             addr;
	struct hash_chain_s *next;
} hash_chain_t;

hash_chain_t *hash_table[1024];
hash_chain_t hash_list[MAX_GLOBAL_HOSTS];
unsigned int hash_count = 0;

unsigned int hash_func(const netadr_t *addr) {

	const byte		*ip = NULL;
	unsigned int	size;
	unsigned int	i;
	unsigned int	hash = 0;

	switch(addr->type) {
		case NA_IP:  ip = addr->ipv._4; size = 4;  break;
#ifdef USE_IPV6
		case NA_IP6: ip = addr->ipv._6; size = 16; break;
#endif
		default: size = 0; break;
	}

	for(i = 0; i < size; i++)
		hash = hash * 101 +(int)(*ip++);

	hash = hash ^(hash >> 16);

	return(hash & 1023);
}

static void hash_insert(const netadr_t *addr)
{
	hash_chain_t **tab, *cur;
	unsigned int hash;
	if(hash_count >= MAX_GLOBAL_HOSTS)
		return;
	hash = hash_func(addr);
	tab = &hash_table[ hash ];
	cur = &hash_list[ hash_count++ ];
	cur->addr = *addr;
	if(cur != *tab)
		cur->next = *tab;
	else
		cur->next = NULL;
	*tab = cur;
}

static void hash_reset(void)
{
	hash_count = 0;
	memset(hash_list, 0, sizeof(hash_list));
	memset(hash_table, 0, sizeof(hash_table));
}

static hash_chain_t *hash_find(const netadr_t *addr)
{
	hash_chain_t *cur;
	cur = hash_table[ hash_func(addr) ];
	while(cur != NULL) {
		if(NET_CompareAdr(addr, &cur->addr))
			return cur;
		cur = cur->next;
	}
	return NULL;
}


/*
===================
CL_HostsResponsePacket
===================
*/
static void CL_HostsResponsePacket(const netadr_t* from, msg_t *msg, qboolean extended) {
	int				i, count, total;
	netadr_t addresses[MAX_HOSTSPERPACKET];
	int				numhosts;
	byte*			buffptr;
	byte*			buffend;
	hostInfo_t	*host;

	//Com_Printf("CL_HostsResponsePacket\n"); // moved down

	if(cls.numglobalhosts == -1) {
		// state to detect lack of hosts or lack of response
		cls.numglobalhosts = 0;
		cls.numGlobalHostAddresses = 0;
		hash_reset();
	}

	// parse through host response string
	numhosts = 0;
	buffptr    = msg->data;
	buffend    = buffptr + msg->cursize;

	// advance to initial token
	do
	{
		if(*buffptr == '\\' ||(extended && *buffptr == '/'))
			break;

		buffptr++;
	} while(buffptr < buffend);

	while(buffptr + 1 < buffend)
	{
		// IPv4 address
		if(*buffptr == '\\')
		{
			buffptr++;

			if(buffend - buffptr < sizeof(addresses[numhosts].ipv._4) + sizeof(addresses[numhosts].port) + 1)
				break;

			for(i = 0; i < sizeof(addresses[numhosts].ipv._4); i++)
				addresses[numhosts].ipv._4[i] = *buffptr++;

			addresses[numhosts].type = NA_IP;
		}
#ifdef USE_IPV6
		// IPv6 address, if it's an extended response
		else if(extended && *buffptr == '/')
		{
			buffptr++;

			if(buffend - buffptr < sizeof(addresses[numhosts].ipv._6) + sizeof(addresses[numhosts].port) + 1)
				break;

			for(i = 0; i < sizeof(addresses[numhosts].ipv._6); i++)
				addresses[numhosts].ipv._6[i] = *buffptr++;

			addresses[numhosts].type = NA_IP6;
			addresses[numhosts].scope_id = from->scope_id;
		}
#endif
		else
			// syntax error!
			break;

		// parse out port
		addresses[numhosts].port =(*buffptr++) << 8;
		addresses[numhosts].port += *buffptr++;
		addresses[numhosts].port = BigShort(addresses[numhosts].port);

		// syntax check
		if(*buffptr != '\\' && *buffptr != '/')
			break;

		numhosts++;
		if(numhosts >= MAX_HOSTSPERPACKET)
			break;
	}

	count = cls.numglobalhosts;

	for(i = 0; i < numhosts && count < MAX_GLOBAL_HOSTS; i++) {

		// Tequila: It's possible to have sent many master host requests. Then
		// we may receive many times the same addresses from the master host.
		// We just avoid to add a host if it is still in the global hosts list.
		if(hash_find(&addresses[i]))
			continue;

		hash_insert(&addresses[i]);

		// build net address
		host = &cls.globalHosts[count];

		CL_InitHostInfo(host, &addresses[i]);
		// advance to next slot
		count++;
	}

	// if getting the global list
	if(count >= MAX_GLOBAL_HOSTS && cls.numGlobalHostAddresses < MAX_GLOBAL_HOSTS)
	{
		// if we couldn't store the hosts in the main list anymore
		for(; i < numhosts && cls.numGlobalHostAddresses < MAX_GLOBAL_HOSTS; i++)
		{
			// just store the addresses in an additional list
			cls.globalHostAddresses[cls.numGlobalHostAddresses++] = addresses[i];
		}
	}

	cls.numglobalhosts = count;
	total = count + cls.numGlobalHostAddresses;

	Com_Printf("gethostsResponse:%3d hosts parsed(total %d)\n", numhosts, total);
}


/*
=================
CL_ConnectionlessPacket

Responses to broadcasts, etc

return true only for commands indicating that our host is alive
or connection sequence is going into the right way
=================
*/
static qboolean CL_ConnectionlessPacket(const netadr_t *from, msg_t *msg) {
	qboolean fromhost;
	const char *s;
	const char *c;
	int challenge = 0;

	MSG_BeginReadingOOB(msg);
	MSG_ReadLong(msg);	// skip the -1

	s = MSG_ReadStringLine(msg);

	Cmd_TokenizeString(s);

	c = Cmd_Argv(0);

	if(com_developer->integer) {
		Com_Printf("CL packet %s: %s\n", NET_AdrToStringwPort(from), s);
	}

	// challenge from the host we are connecting to
	if(!Q_stricmp(c, "challengeResponse"))
	{
		char *strver;
		int ver;

		if(cls.state != CA_CONNECTING)
		{
			Com_DPrintf("Unwanted challenge response received. Ignored.\n");
			return qfalse;
		}

		c = Cmd_Argv(2);
		if(*c)
			challenge = atoi(c);

 		clc.compat = qtrue;
		strver = Cmd_Argv(3); // analyze host protocol version
		if(*strver) {
			ver = atoi(strver);
			if(ver != PROTOCOL_VERSION) {
				if(ver == NEW_PROTOCOL_VERSION) {
					clc.compat = qfalse;
				} else {
					Com_Printf(S_COLOR_YELLOW "Warning: Host reports protocol version %d, "
						   "we have %d. Trying legacy protocol %d.\n",
						   ver, NEW_PROTOCOL_VERSION, PROTOCOL_VERSION);
				}
			}
		}

		if(clc.compat)
		{
			if(!NET_CompareAdr(from, &clc.hostAddress))
			{
				// This challenge response is not coming from the expected address.
				// Check whether we have a matching user challenge to prevent
				// connection hi-jacking.
				if(!*c || challenge != clc.challenge)
				{
					Com_DPrintf("Challenge response received from unexpected source. Ignored.\n");
					return qfalse;
				}
			}
		}
		else
		{
			if(!*c || challenge != clc.challenge)
			{
				Com_Printf("Bad challenge for challengeResponse. Ignored.\n");
				return qfalse;
			}
		}

		// start sending connect instead of challenge request packets
		clc.challenge = atoi(Cmd_Argv(1));
		cls.state = CA_CHALLENGING;
		clc.connectPacketCount = 0;
		clc.connectTime = -99999;

		// take this address as the new host address.  This allows
		// a host proxy to hand off connections to multiple hosts
		clc.hostAddress = *from;
		Com_DPrintf("challengeResponse: %d\n", clc.challenge);
		return qtrue;
	}

	// host connection
	if(!Q_stricmp(c, "connectResponse")) {
		if(cls.state >= CA_CONNECTED) {
			Com_Printf("Dup connect received. Ignored.\n");
			return qfalse;
		}
		if(cls.state != CA_CHALLENGING) {
			Com_Printf("connectResponse packet while not connecting. Ignored.\n");
			return qfalse;
		}
		if(!NET_CompareAdr(from, &clc.hostAddress)) {
			Com_Printf("connectResponse from wrong address. Ignored.\n");
			return qfalse;
		}

		if(!clc.compat)
		{
			c = Cmd_Argv(1);

			if(*c)
				challenge = atoi(c);
			else
			{
				Com_Printf("Bad connectResponse received. Ignored.\n");
				return qfalse;
			}

			if(challenge != clc.challenge)
			{
				Com_Printf("ConnectResponse with bad challenge received. Ignored.\n");
				return qfalse;
			}
		}

		Netchan_Setup(NS_USER, &clc.netchan, from, Cvar_VariableIntegerValue("net_qport"),
			clc.challenge, clc.compat);

		cls.state = CA_CONNECTED;
		clc.lastPacketSentTime = -9999;		// send first packet immediately
		return qtrue;
	}

	// host responding to an info broadcast
	if(!Q_stricmp(c, "infoResponse")) {
		CL_HostInfoPacket(from, msg);
		return qfalse;
	}

	// host responding to a get playerlist
	if(!Q_stricmp(c, "statusResponse")) {
		CL_HostStatusResponse(from, msg);
		return qfalse;
	}

	// echo request from host
	if(!Q_stricmp(c, "echo")) {
		// NOTE: we may have to add exceptions for auth and update hosts
		if((fromhost = NET_CompareAdr(from, &clc.hostAddress)) != qfalse || NET_CompareAdr(from, &rcon_address)) {
			NET_OutOfBandPrint(NS_USER, from, "%s", Cmd_Argv(1));
		}
		return fromhost;
	}

	// cd check
	if(!Q_stricmp(c, "keyAuthorize")) {
		// we don't use these now, so dump them on the floor
		return qfalse;
	}

	// global MOTD from id
	if(!Q_stricmp(c, "motd")) {
		CL_MotdPacket(from);
		return qfalse;
	}

	// print string from host
	if(!Q_stricmp(c, "print")) {
		// NOTE: we may have to add exceptions for auth and update hosts
		if((fromhost = NET_CompareAdr(from, &clc.hostAddress)) != qfalse || NET_CompareAdr(from, &rcon_address)) {
			s = MSG_ReadString(msg);
			Q_strncpyz(clc.hostMessage, s, sizeof(clc.hostMessage));
			Com_Printf("%s", s);
		}
		return fromhost;
	}

	// list of hosts sent back by a master host(classic)
	if(!Q_strncmp(c, "gethostsResponse", 18)) {
		CL_HostsResponsePacket(from, msg, qfalse);
		return qfalse;
	}

	// list of hosts sent back by a master host(extended)
	if(!Q_strncmp(c, "gethostsExtResponse", 21)) {
		CL_HostsResponsePacket(from, msg, qtrue);
		return qfalse;
	}

	Com_DPrintf("Unknown connectionless packet command.\n");
	return qfalse;
}


/*
=================
CL_PacketEvent

A packet has arrived from the main event loop
=================
*/
void CL_PacketEvent(const netadr_t *from, msg_t *msg) {
	int		headerBytes;

	if(msg->cursize < 5) {
		Com_DPrintf("%s: Runt packet\n", NET_AdrToStringwPort(from));
		return;
	}

	if(*(int *)msg->data == -1) {
		if(CL_ConnectionlessPacket(from, msg))
			clc.lastPacketTime = cls.realtime;
		return;
	}

	if(cls.state < CA_CONNECTED) {
		return;		// can't be a valid sequenced packet
	}

	//
	// packet from host
	//
	if(!NET_CompareAdr(from, &clc.netchan.remoteAddress)) {
		if(com_developer->integer) {
			Com_Printf("%s:sequenced packet without connection\n",
				NET_AdrToStringwPort(from));
		}
		// FIXME: send a user disconnect?
		return;
	}

	if(!CL_Netchan_Process(&clc.netchan, msg)) {
		return;		// out of order, duplicated, etc
	}

	// the header is different lengths for reliable and unreliable messages
	headerBytes = msg->readcount;

	// track the last message received so it can be returned in
	// user messages, allowing the host to detect a dropped
	// gamestate
	clc.hostMessageSequence = LittleLong(*(int32_t *)msg->data);

	clc.lastPacketTime = cls.realtime;
	CL_ParseHostMessage(msg);

	//
	// we don't know if it is ok to save a demo message until
	// after we have parsed the frame
	//
	if(clc.demorecording && !clc.demowaiting && !clc.demoplaying) {
		CL_WriteDemoMessage(msg, headerBytes);
	}
}


/*
==================
CL_CheckTimeout
==================
*/
static void CL_CheckTimeout(void) {
	//
	// check timeout
	//
	if((!CL_CheckPaused() || !sv_paused->integer)
		&& cls.state >= CA_CONNECTED && cls.state != CA_CINEMATIC
		&& cls.realtime - clc.lastPacketTime > cl_timeout->integer * 1000) {
		if(++cl.timeoutcount > 5) { // timeoutcount saves debugger
			Com_Printf("\nHost connection timed out.\n");
			Cvar_Set("com_errorMessage", "Host connection timed out.");
			if(!CL_Disconnect(qfalse)) { // restart user if not done already
				CL_FlushMemory();
			}
			if(uivm) {
				VM_Call(uivm, 1, UI_SET_ACTIVE_MENU, UIMENU_MAIN);
			}
			return;
		}
	} else {
		cl.timeoutcount = 0;
	}
}


/*
==================
CL_CheckPaused
Check whether user has been paused.
==================
*/
qboolean CL_CheckPaused(void)
{
	// if cl_paused->modified is set, the cvar has only been changed in
	// this frame. Keep paused in this frame to ensure the host doesn't
	// lag behind.
	if(cl_paused->integer || cl_paused->modified)
		return qtrue;

	return qfalse;
}


/*
==================
CL_NoDelay
==================
*/
qboolean CL_NoDelay(void)
{
	if(CL_VideoRecording() ||(com_timedemo->integer && clc.demofile != FS_INVALID_HANDLE))
		return qtrue;

	return qfalse;
}


/*
==================
CL_CheckUserinfo
==================
*/
static void CL_CheckUserinfo(void) {

	// don't add reliable commands when not yet connected
	if(cls.state < CA_CONNECTED)
		return;

	// don't overflow the reliable command buffer when paused
	if(CL_CheckPaused())
		return;

	// send a reliable userinfo update if needed
	if(cvar_modifiedFlags & CVAR_USERINFO)
	{
		qboolean infoTruncated = qfalse;
		const char *info;

		cvar_modifiedFlags &= ~CVAR_USERINFO;

		info = Cvar_InfoString(CVAR_USERINFO, &infoTruncated);
		if(strlen(info) > MAX_USERINFO_LENGTH || infoTruncated) {
			Com_Printf(S_COLOR_YELLOW "WARNING: oversize userinfo, you might be not able to play on remote host!\n");
		}

		CL_AddReliableCommand(va("userinfo \"%s\"", info), qfalse);
	}
}


/*
==================
CL_Frame
==================
*/
void CL_Frame(int msec, int realMsec) {
	float fps;
	float frameDuration;

#ifdef CURL_ON_Make
	if(download.cURL) {
		Com_DL_Perform(&download);
	}
#endif

	if(!com_cl_running->integer) {
		return;
	}

	// save the msec before checking pause
	cls.realFrametime = realMsec;

#ifdef CURL_ON_Make
	if(clc.downloadCURLM) {
		CL_cURL_PerformDownload();
		// we can't process frames normally when in disconnected
		// download mode since the ui vm expects cls.state to be
		// CA_CONNECTED
		if(clc.cURLDisconnected) {
			cls.frametime = msec;
			cls.realtime += msec;
			cls.framecount++;
			SCR_UpdateScreen();
			S_Update(realMsec);
			Con_RunConsole();
			return;
		}
	}
#endif

	if(cls.cddialog) {
		// bring up the cd error dialog if needed
		cls.cddialog = qfalse;
		VM_Call(uivm, 1, UI_SET_ACTIVE_MENU, UIMENU_NEED_CD);
	} else	if(cls.state == CA_DISCONNECTED && !(Key_GetCatcher() & KEYCATCH_UI)
		&& !com_sv_running->integer && uivm) {
		// if disconnected, bring up the menu
		S_StopAllSounds();
		VM_Call(uivm, 1, UI_SET_ACTIVE_MENU, UIMENU_MAIN);
	}

	// if recording an avi, lock to a fixed fps
	if(CL_VideoRecording() && msec) {
		// save the current screen
		if(cls.state == CA_ACTIVE || cl_forceavidemo->integer) {

			if(com_timescale->value > 0.0001f)
				fps = MIN(cl_aviFrameRate->value / com_timescale->value, 1000.0f);
			else
				fps = 1000.0f;

			frameDuration = MAX(1000.0f / fps, 1.0f) + clc.aviVideoFrameRemainder;

			CL_TakeVideoFrame();

			msec =(int)frameDuration;
			clc.aviVideoFrameRemainder = frameDuration - msec;
		}
	}

	if(cl_autoRecordDemo->integer && !clc.demoplaying) {
		if(cls.state == CA_ACTIVE && !clc.demorecording) {
			// If not recording a demo, and we should be, start one
			qtime_t	now;
			const char	*nowString;
			char		*p;
			char		mapName[ MAX_QPATH ];
			char		hostName[ MAX_OSPATH ];

			Com_RealTime(&now);
			nowString = va("%04d%02d%02d%02d%02d%02d",
					1900 + now.tm_year,
					1 + now.tm_mon,
					now.tm_mday,
					now.tm_hour,
					now.tm_min,
					now.tm_sec);

			Q_strncpyz(hostName, cls.hostname, MAX_OSPATH);
			// Replace the ":" in the address as it is not a valid
			// file name character
			p = strchr(hostName, ':');
			if(p) {
				*p = '.';
			}

			Q_strncpyz(mapName, COM_SkipPath(cl.mapname), sizeof(cl.mapname));
			COM_StripExtension(mapName, mapName, sizeof(mapName));

			Cbuf_ExecuteText(EXEC_NOW,
					va("record %s-%s-%s", nowString, hostName, mapName));
		}
		else if(cls.state != CA_ACTIVE && clc.demorecording) {
			// Recording, but not CA_ACTIVE, so stop recording
			CL_StopRecord_f();
		}
	}

	// decide the simulation time
	cls.frametime = msec;
	cls.realtime += msec;

	if(cl_timegraph->integer) {
		SCR_DebugGraph(msec * 0.25f);
	}

	// see if we need to update any userinfo
	CL_CheckUserinfo();

	// if we haven't gotten a packet in a long time, drop the connection
	if(!clc.demoplaying) {
		CL_CheckTimeout();
	}

	// send intentions now
	CL_SendCmd();

	// resend a connection request if necessary
	CL_CheckForResend();

	// decide on the hostTime to draw
	CL_SetCGameTime();

	// update the screen
	cls.framecount++;
	SCR_UpdateScreen();

	// update audio
	S_Update(realMsec);

	// advance local effects for next frame
	SCR_RunCinematic();

	Con_RunConsole();
}


//============================================================================

/*
================
CL_RefPrintf
================
*/
static __attribute__((format(printf, 2, 3))) void QDECL CL_RefPrintf(printParm_t level, const char *fmt, ...) {
	va_list		argptr;
	char		msg[MAXPRINTMSG];

	va_start(argptr, fmt);
	Q_vsnprintf(msg, sizeof(msg), fmt, argptr);
	va_end(argptr);

	switch(level) {
		default: Com_Printf("%s", msg); break;
		case PRINT_DEVELOPER: Com_DPrintf("%s", msg); break;
		case PRINT_WARNING: Com_Printf(S_COLOR_YELLOW "%s", msg); break;
		case PRINT_ERROR: Com_Printf(S_COLOR_RED "%s", msg); break;
	}
}


/*
============
CL_ShutdownRef
============
*/
static void CL_ShutdownRef(refShutdownCode_t code) {

#ifdef GFXER_DLLS_ON_Make
	if(cl_gfxer->modified) {
		code = REF_UNLOAD_DLL;
	}
#endif

	// clear and mute all sounds until next registration
	// S_DisableSounds();

	if(code >= REF_DESTROY_WINDOW) { // +REF_UNLOAD_DLL
		// shutdown sound system before gfxer
		// because it may depend from window handle
		S_Shutdown();
	}

	SCR_Done();

	if(re.Shutdown) {
		re.Shutdown(code);
	}

#ifdef GFXER_DLLS_ON_Make
	if(gfxerLib) {
		Sys_UnloadLibrary(gfxerLib);
		gfxerLib = NULL;
	}
#endif

	Com_Memset(&re, 0, sizeof(re));

	cls.gfxerStarted = qfalse;
}


/*
============
CL_InitDraw
============
*/
static void CL_InitDraw(void) {
	// this sets up the gfxer and calls R_Init
	re.BeginRegistration(&cls.glconfig);

	// load character sets
	cls.charSetShader = re.RegisterShader("gfx/2d/bigchars");
	cls.whiteShader = re.RegisterShader("white");
	cls.consoleShader = re.RegisterShader("console");
	g_console_field_width = cls.glconfig.vidWidth / smallchar_width - 2;
	g_consoleField.widthInChars = g_console_field_width;

	// for 640x480 virtualized screen
	cls.biasY = 0;
	cls.biasX = 0;
	if(cls.glconfig.vidWidth * 480 > cls.glconfig.vidHeight * 640) {
		// wide screen, scale by height
		cls.scale = cls.glconfig.vidHeight *(1.0/480.0);
		cls.biasX = 0.5 *(cls.glconfig.vidWidth -(cls.glconfig.vidHeight *(640.0/480.0)));
	} else {
		// no wide screen, scale by width
		cls.scale = cls.glconfig.vidWidth *(1.0/640.0);
		cls.biasY = 0.5 *(cls.glconfig.vidHeight -(cls.glconfig.vidWidth *(480.0/640)));
	}

	SCR_Init();
}


/*
============================
CL_StartHunkUsers

After the host has cleared the hunk, these will need to be restarted
This is the only place that any of these functions are called from
============================
*/
void CL_StartHunkUsers(void) {

	if(!com_cl_running || !com_cl_running->integer) {
		return;
	}

	// fixup gfxer -EC-
	if(!re.BeginRegistration) {
		CL_InitRef();
	}

	if(!cls.gfxerStarted) {
		cls.gfxerStarted = qtrue;
		CL_InitDraw();
	}

	if(!cls.soundStarted) {
		cls.soundStarted = qtrue;
		S_Init();
	}

	if(!cls.soundRegistered) {
		cls.soundRegistered = qtrue;
		S_BeginRegistration();
	}

	if(!cls.uiStarted) {
		cls.uiStarted = qtrue;
		CL_InitUI();
	}
}


/*
============
CL_RefMalloc
============
*/
static void *CL_RefMalloc(int size) {
	return Z_TagMalloc(size, TAG_GFXER);
}


/*
============
CL_RefFreeAll
============
*/
static void CL_RefFreeAll(void) {
	Z_FreeTags(TAG_GFXER);
}


/*
============
CL_ScaledMilliseconds
============
*/
int CL_ScaledMilliseconds(void) {
	return Sys_Milliseconds()*com_timescale->value;
}


/*
============
CL_IsMinimized
============
*/
static qboolean CL_IsMininized(void) {
	return gw_minimized;
}


/*
============
CL_SetScaling

Sets console chars height
============
*/
static void CL_SetScaling(float factor, int captureWidth, int captureHeight) {

	float scale;
	int h;

	// adjust factor proportionally to FullHD height(1080 pixels), with 1/16 granularity
	h =(captureHeight * 16 / 1080);
	scale = h / 16.0f;
	if(scale < 1.0f)
		scale = 1.0f;

	factor *= scale;

	// set console scaling
	smallchar_width = SMALLCHAR_WIDTH * factor;
	smallchar_height = SMALLCHAR_HEIGHT * factor;
	bigchar_width = BIGCHAR_WIDTH * factor;
	bigchar_height = BIGCHAR_HEIGHT * factor;

	// set custom capture resolution
	cls.captureWidth = captureWidth;
	cls.captureHeight = captureHeight;
}


/*
============
CL_InitRef
============
*/
static void CL_InitRef(void) {
	refimport_t	rimp;
	refexport_t	*ret;
#ifdef GFXER_DLLS_ON_Make
	GetRefAPI_t		GetRefAPI;
	char			dllName[ MAX_OSPATH ];
#endif

	CL_InitGLimp_Cvars();

	Com_Printf("----- Initializing Draw ----\n");

#ifdef GFXER_DLLS_ON_Make

#if defined(__linux__) && defined(__i386__)
#define DRAW_ARCH_STRING "x86"
#else
#define DRAW_ARCH_STRING ARCH_STRING
#endif

	Com_sprintf(dllName, sizeof(dllName), GFXER_PREFIX_Make "_%s_" DRAW_ARCH_STRING DLL_EXT, cl_gfxer->string);
	gfxerLib = FS_LoadLibrary(dllName);
	if(!gfxerLib)
	{
		Cvar_ForceReset("cl_gfxer");
		Com_sprintf(dllName, sizeof(dllName), GFXER_PREFIX_Make "_%s_" DRAW_ARCH_STRING DLL_EXT, cl_gfxer->string);
		gfxerLib = FS_LoadLibrary(dllName);
		if(!gfxerLib)
		{
			Com_Error(ERR_FATAL, "Failed to load gfxer %s", dllName);
		}
	}

	GetRefAPI = Sys_LoadFunction(gfxerLib, "GetRefAPI");
	if(!GetRefAPI)
	{
		Com_Error(ERR_FATAL, "Can't load symbol GetRefAPI");
		return;
	}

	cl_gfxer->modified = qfalse;
#endif

	Com_Memset(&rimp, 0, sizeof(rimp));

	rimp.Cmd_AddCommand = Cmd_AddCommand;
	rimp.Cmd_RemoveCommand = Cmd_RemoveCommand;
	rimp.Cmd_Argc = Cmd_Argc;
	rimp.Cmd_Argv = Cmd_Argv;
	rimp.Cmd_ExecuteText = Cbuf_ExecuteText;
	rimp.Printf = CL_RefPrintf;
	rimp.Error = Com_Error;
	rimp.Milliseconds = CL_ScaledMilliseconds;
	rimp.Microseconds = Sys_Microseconds;
	rimp.Malloc = CL_RefMalloc;
	rimp.FreeAll = CL_RefFreeAll;
	rimp.Free = Z_Free;
#ifdef HUNK_DEBUG
	rimp.Hunk_AllocDebug = Hunk_AllocDebug;
#else
	rimp.Hunk_Alloc = Hunk_Alloc;
#endif
	rimp.Hunk_AllocateTempMemory = Hunk_AllocateTempMemory;
	rimp.Hunk_FreeTempMemory = Hunk_FreeTempMemory;

	rimp.CM_ClusterPVS = CM_ClusterPVS;
	rimp.CM_DrawDebugSurface = CM_DrawDebugSurface;

	rimp.FS_ReadFile = FS_ReadFile;
	rimp.FS_FreeFile = FS_FreeFile;
	rimp.FS_WriteFile = FS_WriteFile;
	rimp.FS_FreeFileList = FS_FreeFileList;
	rimp.FS_ListFiles = FS_ListFiles;
	//rimp.FS_FileIsInPAK = FS_FileIsInPAK;
	rimp.FS_FileExists = FS_FileExists;

	rimp.Cvar_Get = Cvar_Get;
	rimp.Cvar_Set = Cvar_Set;
	rimp.Cvar_SetValue = Cvar_SetValue;
	rimp.Cvar_CheckRange = Cvar_CheckRange;
	rimp.Cvar_SetDescription = Cvar_SetDescription;
	rimp.Cvar_VariableStringBuffer = Cvar_VariableStringBuffer;
	rimp.Cvar_VariableString = Cvar_VariableString;
	rimp.Cvar_VariableIntegerValue = Cvar_VariableIntegerValue;

	rimp.Cvar_SetGroup = Cvar_SetGroup;
	rimp.Cvar_CheckGroup = Cvar_CheckGroup;
	rimp.Cvar_ResetGroup = Cvar_ResetGroup;

	// cinematic stuff

	rimp.CIN_UploadCinematic = CIN_UploadCinematic;
	rimp.CIN_PlayCinematic = CIN_PlayCinematic;
	rimp.CIN_RunCinematic = CIN_RunCinematic;

	rimp.CL_WriteAVIVideoFrame = CL_WriteAVIVideoFrame;
	rimp.CL_SaveJPGToBuffer = CL_SaveJPGToBuffer;
	rimp.CL_SaveJPG = CL_SaveJPG;
	rimp.CL_LoadJPG = CL_LoadJPG;

	rimp.CL_IsMinimized = CL_IsMininized;
	rimp.CL_SetScaling = CL_SetScaling;

	rimp.Sys_SetClipboardBitmap = Sys_SetClipboardBitmap;
	rimp.Sys_LowPhysicalMemory = Sys_LowPhysicalMemory;
	rimp.Com_RealTime = Com_RealTime;

	// OpenGL API
	rimp.GLimp_Init = GLimp_Init;
	rimp.GLimp_Shutdown = GLimp_Shutdown;
	rimp.GL_GetProcAddress = GL_GetProcAddress;

	rimp.GLimp_EndFrame = GLimp_EndFrame;
	rimp.GLimp_InitGamma = GLimp_InitGamma;
	rimp.GLimp_SetGamma = GLimp_SetGamma;

	// Vulkan API
#ifdef VULKAN_API_ON_Make
	rimp.VKimp_Init = VKimp_Init;
	rimp.VKimp_Shutdown = VKimp_Shutdown;
	rimp.VK_GetInstanceProcAddr = VK_GetInstanceProcAddr;
	rimp.VK_CreateSurface = VK_CreateSurface;
#endif

	ret = GetRefAPI(REF_API_VERSION, &rimp);

	Com_Printf("-------------------------------\n");

	if(!ret) {
		Com_Error(ERR_FATAL, "Couldn't initialize refresh");
	}

	re = *ret;

	// unpause so the app definitely gets a snapshot and draws a frame
	Cvar_Set("cl_paused", "0");
}


//===========================================================================================


void CL_SetModel_f(void) {
	const char *arg;
	char name[ MAX_CVAR_VALUE_STRING ];

	arg = Cmd_Argv(1);
	if(arg[0]) {
		Cvar_Set("model", arg);
		Cvar_Set("headmodel", arg);
	} else {
		Cvar_VariableStringBuffer("model", name, sizeof(name));
		Com_Printf("model is set to %s\n", name);
	}
}


//===========================================================================================


/*
===============
CL_Video_f

video
video [filename]
===============
*/
void CL_Video_f(void)
{
	char filename[ MAX_OSPATH ];
	const char *ext;
	qboolean pipe;
	int i;

	if(!clc.demoplaying)
	{
		Com_Printf("The %s command can only be used when playing back demos\n", Cmd_Argv(0));
		return;
	}

	pipe =(Q_stricmp(Cmd_Argv(0), "video-pipe") == 0);

	if(pipe)
		ext = "mp4";
	else
		ext = "avi";

	if(Cmd_Argc() == 2)
	{
		// explicit filename
		Com_sprintf(filename, sizeof(filename), "videos/%s", Cmd_Argv(1));

		// override video file extension
		if(pipe)
		{
			char *sep = strrchr(filename, '/'); // last path separator
			char *e = strrchr(filename, '.');

			if(e && e > sep && *(e+1) != '\0') {
				ext = e + 1;
				*e = '\0';
			}
		}
	}
	else
	{
		 // scan for a free filename
		for(i = 0; i <= 9999; i++)
		{
			Com_sprintf(filename, sizeof(filename), "videos/video%04d.%s", i, ext);
			if(!FS_FileExists(filename))
				break; // file doesn't exist
		}

		if(i > 9999)
		{
			Com_Printf(S_COLOR_RED "ERROR: no free file names to create video\n");
			return;
		}

		// without extension
		Com_sprintf(filename, sizeof(filename), "videos/video%04d", i);
	}


	clc.aviSoundFrameRemainder = 0.0f;
	clc.aviVideoFrameRemainder = 0.0f;

	Q_strncpyz(clc.videoName, filename, sizeof(clc.videoName));
	clc.videoIndex = 0;

	CL_OpenAVIForWriting(va("%s.%s", clc.videoName, ext), pipe);
}


/*
===============
CL_StopVideo_f
===============
*/
static void CL_StopVideo_f(void)
{
  CL_CloseAVI();
}


/*
====================
CL_CompleteRecordName
====================
*/
static void CL_CompleteVideoName(char *args, int argNum)
{
	if(argNum == 2)
	{
		Field_CompleteFilename("videos", ".avi", qtrue, FS_MATCH_EXTERN | FS_MATCH_STICK);
	}
}


/*
===============
CL_GenerateQKey

test to see if a valid QKEY_FILE exists.  If one does not, try to generate
it by filling it with 2048 bytes of random data.
===============
*/
#ifdef USE_Q3KEY
static void CL_GenerateQKey(void)
{
	int len = 0;
	unsigned char buff[ QKEY_SIZE ];
	fileHandle_t f;

	len = FS_SV_FOpenFileRead(QKEY_FILE, &f);
	FS_FCloseFile(f);
	if(len == QKEY_SIZE) {
		Com_Printf("QKEY found.\n");
		return;
	}
	else {
		if(len > 0) {
			Com_Printf("QKEY file size != %d, regenerating\n",
				QKEY_SIZE);
		}

		Com_Printf("QKEY building random string\n");
		Com_RandomBytes(buff, sizeof(buff));

		f = FS_SV_FOpenFileWrite(QKEY_FILE);
		if(!f) {
			Com_Printf("QKEY could not open %s for write\n",
				QKEY_FILE);
			return;
		}
		FS_Write(buff, sizeof(buff), f);
		FS_FCloseFile(f);
		Com_Printf("QKEY generated\n");
	}
}
#endif


/*
** CL_GetModeInfo
*/
typedef struct vidmode_s
{
	const char	*description;
	int			width, height;
	float		pixelAspect;		// pixel width / height
} vidmode_t;

static const vidmode_t cl_vidModes[] =
{
	{ "Mode  0: 320x240",			320,	240,	1 },
	{ "Mode  1: 400x300",			400,	300,	1 },
	{ "Mode  2: 512x384",			512,	384,	1 },
	{ "Mode  3: 640x480",			640,	480,	1 },
	{ "Mode  4: 800x600",			800,	600,	1 },
	{ "Mode  5: 960x720",			960,	720,	1 },
	{ "Mode  6: 1024x768",			1024,	768,	1 },
	{ "Mode  7: 1152x864",			1152,	864,	1 },
	{ "Mode  8: 1280x1024(5:4)",	1280,	1024,	1 },
	{ "Mode  9: 1600x1200",			1600,	1200,	1 },
	{ "Mode 10: 2048x1536",			2048,	1536,	1 },
	{ "Mode 11: 856x480(wide)",	856,	480,	1 },
	// extra modes:
	{ "Mode 12: 1280x960",			1280,	960,	1 },
	{ "Mode 13: 1280x720",			1280,	720,	1 },
	{ "Mode 14: 1280x800(16:10)",	1280,	800,	1 },
	{ "Mode 15: 1366x768",			1366,	768,	1 },
	{ "Mode 16: 1440x900(16:10)",	1440,	900,	1 },
	{ "Mode 17: 1600x900",			1600,	900,	1 },
	{ "Mode 18: 1680x1050(16:10)",	1680,	1050,	1 },
	{ "Mode 19: 1920x1080",			1920,	1080,	1 },
	{ "Mode 20: 1920x1200(16:10)",	1920,	1200,	1 },
	{ "Mode 21: 2560x1080(21:9)",	2560,	1080,	1 },
	{ "Mode 22: 3440x1440(21:9)",	3440,	1440,	1 },
	{ "Mode 23: 3840x2160",			3840,	2160,	1 },
	{ "Mode 24: 4096x2160(4K)",	4096,	2160,	1 }
};
static const int s_numVidModes = ARRAY_LEN(cl_vidModes);

qboolean CL_GetModeInfo(int *width, int *height, float *windowAspect, int mode, const char *modeFS, int dw, int dh, qboolean fullscreen)
{
	const	vidmode_t *vm;
	float	pixelAspect;

	// set dedicated fullscreen mode
	if(fullscreen && *modeFS)
		mode = atoi(modeFS);

	if(mode < -2)
		return qfalse;

	if(mode >= s_numVidModes)
		return qfalse;

	// fix unknown desktop resolution
	if(mode == -2 &&(dw == 0 || dh == 0))
		mode = 3;

	if(mode == -2) { // desktop resolution
		*width = dw;
		*height = dh;
		pixelAspect = r_customPixelAspect->value;
	} else if(mode == -1) { // custom resolution
		*width = r_customwidth->integer;
		*height = r_customheight->integer;
		pixelAspect = r_customPixelAspect->value;
	} else { // predefined resolution
		vm = &cl_vidModes[ mode ];
		*width  = vm->width;
		*height = vm->height;
		pixelAspect = vm->pixelAspect;
	}

	*windowAspect =(float)*width /(*height * pixelAspect);

	return qtrue;
}


/*
** CL_ModeList_f
*/
static void CL_ModeList_f(void)
{
	int i;

	Com_Printf("\n");
	for(i = 0; i < s_numVidModes; i++)
	{
		Com_Printf("%s\n", cl_vidModes[ i ].description);
	}
	Com_Printf("\n");
}


#ifdef GFXER_DLLS_ON_Make
static qboolean isValidDraw(const char *s) {
	while(*s) {
		if(!((*s >= 'a' && *s <= 'z') ||(*s >= 'A' && *s <= 'Z') ||(*s >= '1' && *s <= '9')))
			return qfalse;
		++s;
	}
	return qtrue;
}
#endif


static void CL_InitGLimp_Cvars(void)
{
	// shared with GLimp
	r_allowSoftwareGL = Cvar_Get("r_allowSoftwareGL", "0", CVAR_LATCH);
	r_swapInterval = Cvar_Get("r_swapInterval", "0", CVAR_ARCHIVE_ND);
	r_glDriver = Cvar_Get("r_glDriver", OPENGL_DRIVER_NAME, CVAR_ARCHIVE_ND | CVAR_LATCH);

	r_displayRefresh = Cvar_Get("r_displayRefresh", "0", CVAR_LATCH);
	Cvar_CheckRange(r_displayRefresh, "0", "360", CV_INTEGER);
	Cvar_SetDescription(r_displayRefresh, "Override monitor refresh rate in fullscreen mode:\n  0 - use current monitor refresh rate\n >0 - use custom refresh rate");

	vid_xpos = Cvar_Get("vid_xpos", "3", CVAR_ARCHIVE);
	vid_ypos = Cvar_Get("vid_ypos", "22", CVAR_ARCHIVE);
	Cvar_CheckRange(vid_xpos, NULL, NULL, CV_INTEGER);
	Cvar_CheckRange(vid_ypos, NULL, NULL, CV_INTEGER);

	r_noborder = Cvar_Get("r_noborder", "0", CVAR_ARCHIVE_ND | CVAR_LATCH);
	Cvar_CheckRange(r_noborder, "0", "1", CV_INTEGER);

	r_mode = Cvar_Get("r_mode", "-2", CVAR_ARCHIVE | CVAR_LATCH);
	r_modeFullscreen = Cvar_Get("r_modeFullscreen", "-2", CVAR_ARCHIVE | CVAR_LATCH);
	Cvar_CheckRange(r_mode, "-2", va("%i", s_numVidModes-1), CV_INTEGER);
	Cvar_SetDescription(r_mode, "Set video mode:\n -2 - use current desktop resolution\n -1 - use \\r_customWidth and \\r_customHeight\n  0..N - enter \\modelist for details");
	Cvar_SetDescription(r_modeFullscreen, "Dedicated fullscreen mode, set to \"\" to use \\r_mode in all cases");

	r_fullscreen = Cvar_Get("r_fullscreen", "1", CVAR_ARCHIVE | CVAR_LATCH);
	r_customPixelAspect = Cvar_Get("r_customPixelAspect", "1", CVAR_ARCHIVE_ND | CVAR_LATCH);
	r_customwidth = Cvar_Get("r_customWidth", "1600", CVAR_ARCHIVE | CVAR_LATCH);
	r_customheight = Cvar_Get("r_customHeight", "1024", CVAR_ARCHIVE | CVAR_LATCH);
	Cvar_CheckRange(r_customwidth, "4", NULL, CV_INTEGER);
	Cvar_CheckRange(r_customheight, "4", NULL, CV_INTEGER);
	Cvar_SetDescription(r_customwidth, "Custom width to use with \\r_mode -1");
	Cvar_SetDescription(r_customheight, "Custom height to use with \\r_mode -1");

	r_colorbits = Cvar_Get("r_colorbits", "0", CVAR_ARCHIVE_ND | CVAR_LATCH);
	Cvar_CheckRange(r_colorbits, "0", "32", CV_INTEGER);

	// shared with gfxer:
	cl_stencilbits = Cvar_Get("r_stencilbits", "8", CVAR_ARCHIVE_ND | CVAR_LATCH);
	Cvar_CheckRange(cl_stencilbits, "0", "8", CV_INTEGER);
	cl_depthbits = Cvar_Get("r_depthbits", "0", CVAR_ARCHIVE_ND | CVAR_LATCH);
	Cvar_CheckRange(cl_depthbits, "0", "32", CV_INTEGER);

	cl_drawBuffer = Cvar_Get("r_drawBuffer", "GL_BACK", CVAR_CHEAT);

#ifdef GFXER_DLLS_ON_Make
#ifdef GFXER_MAIN_Make
	cl_gfxer = Cvar_Get("cl_gfxer", XSTRING(GFXER_MAIN_Make), CVAR_ARCHIVE | CVAR_LATCH);
#else
	cl_gfxer = Cvar_Get("cl_gfxer", "opengl", CVAR_ARCHIVE | CVAR_LATCH);
#endif
	if(!isValidDraw(cl_gfxer->string)) {
		Cvar_ForceReset("cl_gfxer");
	}
#endif
}


/*
====================
CL_Init
====================
*/
void CL_Init(void) {
	const char *s;

	Com_Printf("----- User Initialization -----\n");

	Con_Init();

	CL_ClearState();
	cls.state = CA_DISCONNECTED;	// no longer CA_UNINITIALIZED

	CL_ResetOldGame();

	cls.realtime = 0;

	CL_InitInput();

	//
	// register user variables
	//
	cl_noprint = Cvar_Get("cl_noprint", "0", 0);
	cl_motd = Cvar_Get("cl_motd", "1", 0);

	cl_timeout = Cvar_Get("cl_timeout", "200", 0);
	Cvar_CheckRange(cl_timeout, "5", NULL, CV_INTEGER);

	cl_autoNudge = Cvar_Get("cl_autoNudge", "0", CVAR_TEMP);
	Cvar_CheckRange(cl_autoNudge, "0", "1", CV_FLOAT);
	cl_timeNudge = Cvar_Get("cl_timeNudge", "0", CVAR_TEMP);
	Cvar_CheckRange(cl_timeNudge, "-30", "30", CV_INTEGER);

	cl_shownet = Cvar_Get("cl_shownet", "0", CVAR_TEMP);
	cl_showTimeDelta = Cvar_Get("cl_showTimeDelta", "0", CVAR_TEMP);
	rcon_user_password = Cvar_Get("rconPassword", "", CVAR_TEMP);
	cl_activeAction = Cvar_Get("activeAction", "", CVAR_TEMP);

	cl_autoRecordDemo = Cvar_Get("cl_autoRecordDemo", "0", CVAR_ARCHIVE);

	cl_aviFrameRate = Cvar_Get("cl_aviFrameRate", "25", CVAR_ARCHIVE);
	Cvar_CheckRange(cl_aviFrameRate, "1", "1000", CV_INTEGER);
	cl_aviMotionJpeg = Cvar_Get("cl_aviMotionJpeg", "1", CVAR_ARCHIVE);
	cl_forceavidemo = Cvar_Get("cl_forceavidemo", "0", 0);

	cl_aviPipeFormat = Cvar_Get("cl_aviPipeFormat",
		"-preset medium -crf 23 -vcodec libx264 -flags +cgop -pix_fmt yuv420p "
		"-bf 2 -codec:a aac -strict -2 -b:a 160k -r:a 22050 -movflags faststart",
		CVAR_ARCHIVE);

	rconAddress = Cvar_Get("rconAddress", "", 0);

	cl_allowDownload = Cvar_Get("cl_allowDownload", "1", CVAR_ARCHIVE_ND);
#ifdef CURL_ON_Make
	cl_mapAutoDownload = Cvar_Get("cl_mapAutoDownload", "0", CVAR_ARCHIVE_ND);
#ifdef CURL_DLL_ON_Make
	cl_cURLLib = Cvar_Get("cl_cURLLib", DEFAULT_CURL_LIB, 0);
#endif
#endif

	cl_conXOffset = Cvar_Get("cl_conXOffset", "0", 0);
	cl_conColor = Cvar_Get("cl_conColor", "", 0);

#ifdef MACOS_X
	// In game video is REALLY slow in Mac OS X right now due to driver slowness
	cl_inGameVideo = Cvar_Get("r_inGameVideo", "0", CVAR_ARCHIVE_ND);
#else
	cl_inGameVideo = Cvar_Get("r_inGameVideo", "1", CVAR_ARCHIVE_ND);
#endif
	Cvar_SetDescription(cl_inGameVideo, "Controls whether in game video should be draw");

	cl_hostStatusResendTime = Cvar_Get("cl_hostStatusResendTime", "750", 0);

	// init autoswitch so the ui will have it correctly even
	// if the app hasn't been started
	Cvar_Get("cg_autoswitch", "1", CVAR_ARCHIVE);

	cl_motdString = Cvar_Get("cl_motdString", "", CVAR_ROM);

	Cvar_Get("cl_maxPing", "800", CVAR_ARCHIVE_ND);

	cl_lanForcePackets = Cvar_Get("cl_lanForcePackets", "1", CVAR_ARCHIVE_ND);

	cl_guidHostUniq = Cvar_Get("cl_guidHostUniq", "1", CVAR_ARCHIVE_ND);

	cl_dlURL = Cvar_Get("cl_dlURL", "http://ws.q3df.org/maps/download/%1", CVAR_ARCHIVE_ND);

	cl_dlDirectory = Cvar_Get("cl_dlDirectory", "0", CVAR_ARCHIVE_ND);
	Cvar_CheckRange(cl_dlDirectory, "0", "1", CV_INTEGER);
	s = va("Save downloads initiated by \\dlmap and \\download commands in:\n"
		" 0 - current game directory\n"
		" 1 - fs_basegame(%s) directory\n", FS_GetBaseGameDir());
	Cvar_SetDescription(cl_dlDirectory, s);

	cl_reconnectArgs = Cvar_Get("cl_reconnectArgs", "", CVAR_ARCHIVE_ND | CVAR_NOTABCOMPLETE);

	// userinfo
	Cvar_Get("name", "UnnamedPlayer", CVAR_USERINFO | CVAR_ARCHIVE_ND);
	Cvar_Get("rate", "25000", CVAR_USERINFO | CVAR_ARCHIVE);
	Cvar_Get("snaps", "40", CVAR_USERINFO | CVAR_ARCHIVE);
	Cvar_Get("model", "sarge", CVAR_USERINFO | CVAR_ARCHIVE_ND);
	Cvar_Get("headmodel", "sarge", CVAR_USERINFO | CVAR_ARCHIVE_ND);
 	Cvar_Get("team_model", "sarge", CVAR_USERINFO | CVAR_ARCHIVE_ND);
	Cvar_Get("team_headmodel", "sarge", CVAR_USERINFO | CVAR_ARCHIVE_ND);
//	Cvar_Get("g_redTeam", "Stroggs", CVAR_HOSTINFO | CVAR_ARCHIVE);
//	Cvar_Get("g_blueTeam", "Pagans", CVAR_HOSTINFO | CVAR_ARCHIVE);
	Cvar_Get("color1", "4", CVAR_USERINFO | CVAR_ARCHIVE);
	Cvar_Get("color2", "5", CVAR_USERINFO | CVAR_ARCHIVE);
	Cvar_Get("handicap", "100", CVAR_USERINFO | CVAR_ARCHIVE_ND);
//	Cvar_Get("teamtask", "0", CVAR_USERINFO);
	Cvar_Get("sex", "male", CVAR_USERINFO | CVAR_ARCHIVE_ND);
	Cvar_Get("cl_anonymous", "0", CVAR_USERINFO | CVAR_ARCHIVE_ND);

	Cvar_Get("password", "", CVAR_USERINFO);
	Cvar_Get("cg_predictItems", "1", CVAR_USERINFO | CVAR_ARCHIVE);


	// app might not be initialized before menu is used
	Cvar_Get("cg_viewsize", "100", CVAR_ARCHIVE_ND);
	// Make sure cg_stereoSeparation is zero as that variable is deprecated and should not be used anymore.
	Cvar_Get("cg_stereoSeparation", "0", CVAR_ROM);

	//
	// register user commands
	//
	Cmd_AddCommand("cmd", CL_ForwardToHost_f);
	Cmd_AddCommand("configstrings", CL_Configstrings_f);
	Cmd_AddCommand("userinfo", CL_Userinfo_f);
	Cmd_AddCommand("snd_restart", CL_Snd_Restart_f);
	Cmd_AddCommand("vid_restart", CL_Vid_Restart_f);
	Cmd_AddCommand("disconnect", CL_Disconnect_f);
	Cmd_AddCommand("record", CL_Record_f);
	Cmd_SetCommandCompletionFunc("record", CL_CompleteRecordName);
	Cmd_AddCommand("demo", CL_PlayDemo_f);
	Cmd_SetCommandCompletionFunc("demo", CL_CompleteDemoName);
	Cmd_AddCommand("cinematic", CL_PlayCinematic_f);
	Cmd_AddCommand("stoprecord", CL_StopRecord_f);
	Cmd_AddCommand("connect", CL_Connect_f);
	Cmd_AddCommand("reconnect", CL_Reconnect_f);
	Cmd_AddCommand("localhosts", CL_LocalHosts_f);
	Cmd_AddCommand("globalhosts", CL_GlobalHosts_f);
	Cmd_AddCommand("rcon", CL_Rcon_f);
	Cmd_SetCommandCompletionFunc("rcon", CL_CompleteRcon);
	Cmd_AddCommand("ping", CL_Ping_f);
	Cmd_AddCommand("hoststatus", CL_HostStatus_f);
	Cmd_AddCommand("showip", CL_ShowIP_f);
	Cmd_AddCommand("fs_openedList", CL_OpenedPK3List_f);
	Cmd_AddCommand("fs_referencedList", CL_ReferencedPK3List_f);
	Cmd_AddCommand("model", CL_SetModel_f);
	Cmd_AddCommand("video", CL_Video_f);
	Cmd_AddCommand("video-pipe", CL_Video_f);
	Cmd_SetCommandCompletionFunc("video", CL_CompleteVideoName);
	Cmd_AddCommand("stopvideo", CL_StopVideo_f);
	Cmd_AddCommand("hostinfo", CL_Hostinfo_f);
	Cmd_AddCommand("systeminfo", CL_Systeminfo_f);

#ifdef CURL_ON_Make
	Cmd_AddCommand("download", CL_Download_f);
	Cmd_AddCommand("dlmap", CL_Download_f);
#endif
	Cmd_AddCommand("modelist", CL_ModeList_f);

	Cvar_Set("cl_running", "1");
#ifdef USE_MD5
	CL_GenerateQKey();
#endif
	Cvar_Get("cl_guid", "", CVAR_USERINFO | CVAR_ROM | CVAR_PROTECTED);
	CL_UpdateGUID(NULL, 0);

	Com_Printf("----- User Initialization Complete -----\n");
}


/*
===============
CL_Shutdown

Called on fatal error, quit and dedicated mode switch
===============
*/
void CL_Shutdown(const char *finalmsg, qboolean quit) {
	static qboolean recursive = qfalse;

	// check whether the user is running at all.
	if(!(com_cl_running && com_cl_running->integer))
		return;

	Com_Printf("----- User Shutdown(%s) -----\n", finalmsg);

	if(recursive) {
		Com_Printf("WARNING: Recursive CL_Shutdown()\n");
		return;
	}
	recursive = qtrue;

	noGameRestart = quit;
	CL_Disconnect(qfalse);

	// clear and mute all sounds until next registration
	S_DisableSounds();

	CL_ShutdownVMs();

	CL_ShutdownRef(quit ? REF_UNLOAD_DLL : REF_DESTROY_WINDOW);

	Con_Shutdown();

	Cmd_RemoveCommand("cmd");
	Cmd_RemoveCommand("configstrings");
	Cmd_RemoveCommand("userinfo");
	Cmd_RemoveCommand("userinfo");
	Cmd_RemoveCommand("snd_restart");
	Cmd_RemoveCommand("vid_restart");
	Cmd_RemoveCommand("disconnect");
	Cmd_RemoveCommand("record");
	Cmd_RemoveCommand("demo");
	Cmd_RemoveCommand("cinematic");
	Cmd_RemoveCommand("stoprecord");
	Cmd_RemoveCommand("connect");
	Cmd_RemoveCommand("reconnect");
	Cmd_RemoveCommand("localhosts");
	Cmd_RemoveCommand("globalhosts");
	Cmd_RemoveCommand("rcon");
	Cmd_RemoveCommand("ping");
	Cmd_RemoveCommand("hoststatus");
	Cmd_RemoveCommand("showip");
	Cmd_RemoveCommand("fs_openedList");
	Cmd_RemoveCommand("fs_referencedList");
	Cmd_RemoveCommand("model");
	Cmd_RemoveCommand("video");
	Cmd_RemoveCommand("stopvideo");
	Cmd_RemoveCommand("hostinfo");
	Cmd_RemoveCommand("systeminfo");
	Cmd_RemoveCommand("modelist");

#ifdef CURL_ON_Make
	Com_DL_Cleanup(&download);

	Cmd_RemoveCommand("download");
	Cmd_RemoveCommand("dlmap");
#endif

	CL_ClearInput();

	Cvar_Set("cl_running", "0");

	recursive = qfalse;

	Com_Memset(&cls, 0, sizeof(cls));
	Key_SetCatcher(0);
	Com_Printf("-----------------------\n");
}


static void CL_SetHostInfo(hostInfo_t *host, const char *info, int ping) {
	if(host) {
		if(info) {
			host->users = atoi(Info_ValueForKey(info, "users"));
			Q_strncpyz(host->hostName,Info_ValueForKey(info, "hostname"), MAX_NAME_LENGTH);
			Q_strncpyz(host->mapName, Info_ValueForKey(info, "mapname"), MAX_NAME_LENGTH);
			host->maxUsers = atoi(Info_ValueForKey(info, "sv_maxusers"));
			Q_strncpyz(host->game,Info_ValueForKey(info, "game"), MAX_NAME_LENGTH);
			host->gameType = atoi(Info_ValueForKey(info, "gametype"));
			host->netType = atoi(Info_ValueForKey(info, "nettype"));
			host->minPing = atoi(Info_ValueForKey(info, "minping"));
			host->maxPing = atoi(Info_ValueForKey(info, "maxping"));
			host->punkbuster = atoi(Info_ValueForKey(info, "punkbuster"));
			host->g_humanplayers = atoi(Info_ValueForKey(info, "g_humanplayers"));
			host->g_needpass = atoi(Info_ValueForKey(info, "g_needpass"));
		}
		host->ping = ping;
	}
}


static void CL_SetHostInfoByAddress(const netadr_t *from, const char *info, int ping) {
	int i;

	for(i = 0; i < MAX_OTHER_HOSTS; i++) {
		if(NET_CompareAdr(from, &cls.localHosts[i].adr)) {
			CL_SetHostInfo(&cls.localHosts[i], info, ping);
		}
	}

	for(i = 0; i < MAX_GLOBAL_HOSTS; i++) {
		if(NET_CompareAdr(from, &cls.globalHosts[i].adr)) {
			CL_SetHostInfo(&cls.globalHosts[i], info, ping);
		}
	}

	for(i = 0; i < MAX_OTHER_HOSTS; i++) {
		if(NET_CompareAdr(from, &cls.favoriteHosts[i].adr)) {
			CL_SetHostInfo(&cls.favoriteHosts[i], info, ping);
		}
	}
}


/*
===================
CL_HostInfoPacket
===================
*/
static void CL_HostInfoPacket(const netadr_t *from, msg_t *msg) {
	int		i, type, len;
	char	info[MAX_INFO_STRING];
	const char *infoString;
	int		prot;

	infoString = MSG_ReadString(msg);

	// if this isn't the correct protocol version, ignore it
	prot = atoi(Info_ValueForKey(infoString, "protocol"));
	if(prot != PROTOCOL_VERSION && prot != NEW_PROTOCOL_VERSION) {
		Com_DPrintf("Different protocol info packet: %s\n", infoString);
		return;
	}

	// iterate hosts waiting for ping response
	for(i=0; i<MAX_PINGREQUESTS; i++)
	{
		if(cl_pinglist[i].adr.port && !cl_pinglist[i].time && NET_CompareAdr(from, &cl_pinglist[i].adr))
		{
			// calc ping time
			cl_pinglist[i].time = Sys_Milliseconds() - cl_pinglist[i].start;
			if(cl_pinglist[i].time < 1)
			{
				cl_pinglist[i].time = 1;
			}
			if(com_developer->integer)
			{
				Com_Printf("ping time %dms from %s\n", cl_pinglist[i].time, NET_AdrToString(from));
			}

			// save of info
			Q_strncpyz(cl_pinglist[i].info, infoString, sizeof(cl_pinglist[i].info));

			// tack on the net type
			// NOTE: make sure these types are in sync with the netnames strings in the UI
			switch(from->type)
			{
				case NA_BROADCAST:
				case NA_IP:
					type = 1;
					break;
#ifdef USE_IPV6
				case NA_IP6:
					type = 2;
					break;
#endif
				default:
					type = 0;
					break;
			}

			Info_SetValueForKey(cl_pinglist[i].info, "nettype", va("%d", type));
			CL_SetHostInfoByAddress(from, infoString, cl_pinglist[i].time);

			return;
		}
	}

	// if not just sent a local broadcast or pinging local hosts
	if(cls.pingUpdateSource != AS_LOCAL) {
		return;
	}

	for(i = 0 ; i < MAX_OTHER_HOSTS ; i++) {
		// empty slot
		if(cls.localHosts[i].adr.port == 0) {
			break;
		}

		// avoid duplicate
		if(NET_CompareAdr(from, &cls.localHosts[i].adr)) {
			return;
		}
	}

	if(i == MAX_OTHER_HOSTS) {
		Com_DPrintf("MAX_OTHER_HOSTS hit, dropping infoResponse\n");
		return;
	}

	// add this to the list
	cls.numlocalhosts = i+1;
	CL_InitHostInfo(&cls.localHosts[i], from);

	Q_strncpyz(info, MSG_ReadString(msg), sizeof(info));
	len =(int) strlen(info);
	if(len > 0) {
		if(info[ len-1 ] == '\n') {
			info[ len-1 ] = '\0';
		}
		Com_Printf("%s: %s\n", NET_AdrToStringwPort(from), info);
	}
}


/*
===================
CL_GetHostStatus
===================
*/
static hostStatus_t *CL_GetHostStatus(const netadr_t *from) {
	int i, oldest, oldestTime;

	for(i = 0; i < MAX_HOSTSTATUSREQUESTS; i++) {
		if(NET_CompareAdr(from, &cl_hostStatusList[i].address)) {
			return &cl_hostStatusList[i];
		}
	}
	for(i = 0; i < MAX_HOSTSTATUSREQUESTS; i++) {
		if(cl_hostStatusList[i].retrieved) {
			return &cl_hostStatusList[i];
		}
	}
	oldest = -1;
	oldestTime = 0;
	for(i = 0; i < MAX_HOSTSTATUSREQUESTS; i++) {
		if(oldest == -1 || cl_hostStatusList[i].startTime < oldestTime) {
			oldest = i;
			oldestTime = cl_hostStatusList[i].startTime;
		}
	}
	return &cl_hostStatusList[oldest];
}


/*
===================
CL_HostStatus
===================
*/
int CL_HostStatus(const char *hostAddress, char *hostStatusString, int maxLen) {
	int i;
	netadr_t	to;
	hostStatus_t *hostStatus;

	// if no host address then reset all host status requests
	if(!hostAddress) {
		for(i = 0; i < MAX_HOSTSTATUSREQUESTS; i++) {
			cl_hostStatusList[i].address.port = 0;
			cl_hostStatusList[i].retrieved = qtrue;
		}
		return qfalse;
	}
	// get the address
	if(!NET_StringToAdr(hostAddress, &to, NA_UNSPEC)) {
		return qfalse;
	}
	hostStatus = CL_GetHostStatus(&to);
	// if no host status string then reset the host status request for this address
	if(!hostStatusString) {
		hostStatus->retrieved = qtrue;
		return qfalse;
	}

	// if this host status request has the same address
	if(NET_CompareAdr(&to, &hostStatus->address)) {
		// if we received a response for this host status request
		if(!hostStatus->pending) {
			Q_strncpyz(hostStatusString, hostStatus->string, maxLen);
			hostStatus->retrieved = qtrue;
			hostStatus->startTime = 0;
			return qtrue;
		}
		// resend the request regularly
		else if(Sys_Milliseconds() - hostStatus->startTime > cl_hostStatusResendTime->integer) {
			hostStatus->print = qfalse;
			hostStatus->pending = qtrue;
			hostStatus->retrieved = qfalse;
			hostStatus->time = 0;
			hostStatus->startTime = Sys_Milliseconds();
			NET_OutOfBandPrint(NS_USER, &to, "getstatus");
			return qfalse;
		}
	}
	// if retrieved
	else if(hostStatus->retrieved) {
		hostStatus->address = to;
		hostStatus->print = qfalse;
		hostStatus->pending = qtrue;
		hostStatus->retrieved = qfalse;
		hostStatus->startTime = Sys_Milliseconds();
		hostStatus->time = 0;
		NET_OutOfBandPrint(NS_USER, &to, "getstatus");
		return qfalse;
	}
	return qfalse;
}


/*
===================
CL_HostStatusResponse
===================
*/
static void CL_HostStatusResponse(const netadr_t *from, msg_t *msg) {
	const char	*s;
	char	info[MAX_INFO_STRING];
	char	buf[64], *v[2];
	int		i, l, score, ping;
	int		len;
	hostStatus_t *hostStatus;

	hostStatus = NULL;
	for(i = 0; i < MAX_HOSTSTATUSREQUESTS; i++) {
		if(NET_CompareAdr(from, &cl_hostStatusList[i].address)) {
			hostStatus = &cl_hostStatusList[i];
			break;
		}
	}
	// if we didn't request this host status
	if(!hostStatus) {
		return;
	}

	s = MSG_ReadStringLine(msg);

	len = 0;
	Com_sprintf(&hostStatus->string[len], sizeof(hostStatus->string)-len, "%s", s);

	if(hostStatus->print) {
		Com_Printf("Host settings:\n");
		// print cvars
		while(*s) {
			for(i = 0; i < 2 && *s; i++) {
				if(*s == '\\')
					s++;
				l = 0;
				while(*s) {
					info[l++] = *s;
					if(l >= MAX_INFO_STRING-1)
						break;
					s++;
					if(*s == '\\') {
						break;
					}
				}
				info[l] = '\0';
				if(i) {
					Com_Printf("%s\n", info);
				}
				else {
					Com_Printf("%-24s", info);
				}
			}
		}
	}

	len = strlen(hostStatus->string);
	Com_sprintf(&hostStatus->string[len], sizeof(hostStatus->string)-len, "\\");

	if(hostStatus->print) {
		Com_Printf("\nPlayers:\n");
		Com_Printf("num: score: ping: name:\n");
	}
	for(i = 0, s = MSG_ReadStringLine(msg); *s; s = MSG_ReadStringLine(msg), i++) {

		len = strlen(hostStatus->string);
		Com_sprintf(&hostStatus->string[len], sizeof(hostStatus->string)-len, "\\%s", s);

		if(hostStatus->print) {
			//score = ping = 0;
			//sscanf(s, "%d %d", &score, &ping);
			Q_strncpyz(buf, s, sizeof(buf));
			Com_Split(buf, v, 2, ' ');
			score = atoi(v[0]);
			ping = atoi(v[1]);
			s = strchr(s, ' ');
			if(s)
				s = strchr(s+1, ' ');
			if(s)
				s++;
			else
				s = "unknown";
			Com_Printf("%-2d   %-3d    %-3d   %s\n", i, score, ping, s);
		}
	}
	len = strlen(hostStatus->string);
	Com_sprintf(&hostStatus->string[len], sizeof(hostStatus->string)-len, "\\");

	hostStatus->time = Sys_Milliseconds();
	hostStatus->address = *from;
	hostStatus->pending = qfalse;
	if(hostStatus->print) {
		hostStatus->retrieved = qtrue;
	}
}


/*
==================
CL_LocalHosts_f
==================
*/
static void CL_LocalHosts_f(void) {
	char		*message;
	int			i, j, n;
	netadr_t	to;

	Com_Printf("Scanning for hosts on the local network...\n");

	// reset the list, waiting for response
	cls.numlocalhosts = 0;
	cls.pingUpdateSource = AS_LOCAL;

	for(i = 0; i < MAX_OTHER_HOSTS; i++) {
		qboolean b = cls.localHosts[i].visible;
		Com_Memset(&cls.localHosts[i], 0, sizeof(cls.localHosts[i]));
		cls.localHosts[i].visible = b;
	}
	Com_Memset(&to, 0, sizeof(to));

	// The 'xxx' in the message is a challenge that will be echoed back
	// by the host.  We don't care about that here, but master hosts
	// can use that to prevent spoofed host responses from invalid ip
	message = "\377\377\377\377getinfo xxx";
	n =(int)strlen(message);

	// send each message twice in case one is dropped
	for(i = 0 ; i < 2 ; i++) {
		// send a broadcast packet on each host port
		// we support multiple host ports so a single machine
		// can nicely run multiple hosts
		for(j = 0 ; j < NUM_HOST_PORTS ; j++) {
			to.port = BigShort((short)(PORT_HOST + j));

			to.type = NA_BROADCAST;
			NET_SendPacket(NS_USER, n, message, &to);
#ifdef USE_IPV6
			to.type = NA_MULTICAST6;
			NET_SendPacket(NS_USER, n, message, &to);
#endif
		}
	}
}


/*
==================
CL_GlobalHosts_f

Originally master 0 was Internet and master 1 was MPlayer.
ioquake3 2008; added support for requesting five separate master hosts using 0-4.
ioquake3 2017; made master 0 fetch all master hosts and 1-5 request a single master host.
==================
*/
static void CL_GlobalHosts_f(void) {
	netadr_t	to;
	int			count, i, masterNum;
	char		command[1024];
	const char	*masteraddress;

	if((count = Cmd_Argc()) < 3 ||(masterNum = atoi(Cmd_Argv(1))) < 0 || masterNum > MAX_MASTER_HOSTS)
	{
		Com_Printf("usage: globalhosts <master# 0-%d> <protocol> [keywords]\n", MAX_MASTER_HOSTS);
		return;
	}

	// request from all master hosts
	if(masterNum == 0) {
		int numAddress = 0;

		for(i = 1; i <= MAX_MASTER_HOSTS; i++) {
			sprintf(command, "sv_master%d", i);
			masteraddress = Cvar_VariableString(command);

			if(!*masteraddress)
				continue;

			numAddress++;

			Com_sprintf(command, sizeof(command), "globalhosts %d %s %s\n", i, Cmd_Argv(2), Cmd_ArgsFrom(3));
			Cbuf_AddText(command);
		}

		if(!numAddress) {
			Com_Printf("CL_GlobalHosts_f: Error: No master host addresses.\n");
		}
		return;
	}

	sprintf(command, "sv_master%d", masterNum);
	masteraddress = Cvar_VariableString(command);

	if(!*masteraddress)
	{
		Com_Printf("CL_GlobalHosts_f: Error: No master host address given.\n");
		return;
	}

	// reset the list, waiting for response
	// -1 is used to distinguish a "no response"

	i = NET_StringToAdr(masteraddress, &to, NA_UNSPEC);

	if(i == 0)
	{
		Com_Printf("CL_GlobalHosts_f: Error: could not resolve address of master %s\n", masteraddress);
		return;
	}
	else if(i == 2)
		to.port = BigShort(PORT_MASTER);

	Com_Printf("Requesting hosts from %s(%s)...\n", masteraddress, NET_AdrToStringwPort(&to));

	cls.numglobalhosts = -1;
	cls.pingUpdateSource = AS_GLOBAL;

	// Use the extended query for IPv6 masters
#ifdef USE_IPV6
	if(to.type == NA_IP6 || to.type == NA_MULTICAST6)
	{
		int v4enabled = Cvar_VariableIntegerValue("net_enabled") & NET_ENABLEV4;

		if(v4enabled)
		{
			Com_sprintf(command, sizeof(command), "gethostsExt %s %s",
				GAMENAME_FOR_MASTER, Cmd_Argv(2));
		}
		else
		{
			Com_sprintf(command, sizeof(command), "gethostsExt %s %s ipv6",
				GAMENAME_FOR_MASTER, Cmd_Argv(2));
		}
	}
	else
#endif
		Com_sprintf(command, sizeof(command), "gethosts %s", Cmd_Argv(2));

	for(i = 3; i < count; i++)
	{
		Q_strcat(command, sizeof(command), " ");
		Q_strcat(command, sizeof(command), Cmd_Argv(i));
	}

	NET_OutOfBandPrint(NS_HOST, &to, "%s", command);
}


/*
==================
CL_GetPing
==================
*/
void CL_GetPing(int n, char *buf, int buflen, int *pingtime)
{
	const char	*str;
	int		time;
	int		maxPing;

	if(n < 0 || n >= MAX_PINGREQUESTS || !cl_pinglist[n].adr.port)
	{
		// empty or invalid slot
		buf[0]    = '\0';
		*pingtime = 0;
		return;
	}

	str = NET_AdrToStringwPort(&cl_pinglist[n].adr);
	Q_strncpyz(buf, str, buflen);

	time = cl_pinglist[n].time;
	if(!time)
	{
		// check for timeout
		time = Sys_Milliseconds() - cl_pinglist[n].start;
		maxPing = Cvar_VariableIntegerValue("cl_maxPing");
		if(maxPing < 100) {
			maxPing = 100;
		}
		if(time < maxPing)
		{
			// not timed out yet
			time = 0;
		}
	}

	CL_SetHostInfoByAddress(&cl_pinglist[n].adr, cl_pinglist[n].info, cl_pinglist[n].time);

	*pingtime = time;
}


/*
==================
CL_GetPingInfo
==================
*/
void CL_GetPingInfo(int n, char *buf, int buflen)
{
	if(n < 0 || n >= MAX_PINGREQUESTS || !cl_pinglist[n].adr.port)
	{
		// empty or invalid slot
		if(buflen)
			buf[0] = '\0';
		return;
	}

	Q_strncpyz(buf, cl_pinglist[n].info, buflen);
}


/*
==================
CL_ClearPing
==================
*/
void CL_ClearPing(int n)
{
	if(n < 0 || n >= MAX_PINGREQUESTS)
		return;

	cl_pinglist[n].adr.port = 0;
}


/*
==================
CL_GetPingQueueCount
==================
*/
int CL_GetPingQueueCount(void)
{
	int		i;
	int		count;
	ping_t*	pingptr;

	count   = 0;
	pingptr = cl_pinglist;

	for(i=0; i<MAX_PINGREQUESTS; i++, pingptr++) {
		if(pingptr->adr.port) {
			count++;
		}
	}

	return(count);
}


/*
==================
CL_GetFreePing
==================
*/
static ping_t* CL_GetFreePing(void)
{
	ping_t* pingptr;
	ping_t* best;
	int		oldest;
	int		i;
	int		time, msec;

	msec = Sys_Milliseconds();
	pingptr = cl_pinglist;
	for(i = 0; i < ARRAY_LEN(cl_pinglist); i++, pingptr++)
	{
		// find free ping slot
		if(pingptr->adr.port)
		{
			if(pingptr->time == 0)
			{
				if(msec - pingptr->start < 500)
				{
					// still waiting for response
					continue;
				}
			}
			else if(pingptr->time < 500)
			{
				// results have not been queried
				continue;
			}
		}

		// clear it
		pingptr->adr.port = 0;
		return pingptr;
	}

	// use oldest entry
	pingptr = cl_pinglist;
	best    = cl_pinglist;
	oldest  = INT_MIN;
	for(i = 0; i < ARRAY_LEN(cl_pinglist); i++, pingptr++)
	{
		// scan for oldest
		time = msec - pingptr->start;
		if(time > oldest)
		{
			oldest = time;
			best   = pingptr;
		}
	}

	return best;
}


/*
==================
CL_Ping_f
==================
*/
static void CL_Ping_f(void) {
	netadr_t	to;
	ping_t*		pingptr;
	char*		host;
	int			argc;
	netadrtype_t	family = NA_UNSPEC;

	argc = Cmd_Argc();

	if(argc != 2 && argc != 3) {
		Com_Printf("usage: ping [-4|-6] <host>\n");
		return;
	}

	if(argc == 2)
		host = Cmd_Argv(1);
	else
	{
		if(!strcmp(Cmd_Argv(1), "-4"))
			family = NA_IP;
#ifdef USE_IPV6
		else if(!strcmp(Cmd_Argv(1), "-6"))
			family = NA_IP6;
		else
			Com_Printf("warning: only -4 or -6 as address type understood.\n");
#else
		else
			Com_Printf("warning: only -4 as address type understood.\n");
#endif

		host = Cmd_Argv(2);
	}

	Com_Memset(&to, 0, sizeof(to));

	if(!NET_StringToAdr(host, &to, family)) {
		return;
	}

	pingptr = CL_GetFreePing();

	memcpy(&pingptr->adr, &to, sizeof(netadr_t));
	pingptr->start = Sys_Milliseconds();
	pingptr->time  = 0;

	CL_SetHostInfoByAddress(&pingptr->adr, NULL, 0);

	NET_OutOfBandPrint(NS_USER, &to, "getinfo xxx");
}


/*
==================
CL_UpdateVisiblePings_f
==================
*/
qboolean CL_UpdateVisiblePings_f(int source) {
	int			slots, i;
	char		buff[MAX_STRING_CHARS];
	int			pingTime;
	int			max;
	qboolean status = qfalse;

	if(source < 0 || source > AS_FAVORITES) {
		return qfalse;
	}

	cls.pingUpdateSource = source;

	slots = CL_GetPingQueueCount();
	if(slots < MAX_PINGREQUESTS) {
		hostInfo_t *host = NULL;

		switch(source) {
			case AS_LOCAL :
				host = &cls.localHosts[0];
				max = cls.numlocalhosts;
			break;
			case AS_GLOBAL :
				host = &cls.globalHosts[0];
				max = cls.numglobalhosts;
			break;
			case AS_FAVORITES :
				host = &cls.favoriteHosts[0];
				max = cls.numfavoritehosts;
			break;
			default:
				return qfalse;
		}
		for(i = 0; i < max; i++) {
			if(host[i].visible) {
				if(host[i].ping == -1) {
					int j;

					if(slots >= MAX_PINGREQUESTS) {
						break;
					}
					for(j = 0; j < MAX_PINGREQUESTS; j++) {
						if(!cl_pinglist[j].adr.port) {
							continue;
						}
						if(NET_CompareAdr(&cl_pinglist[j].adr, &host[i].adr)) {
							// already on the list
							break;
						}
					}
					if(j >= MAX_PINGREQUESTS) {
						status = qtrue;
						for(j = 0; j < MAX_PINGREQUESTS; j++) {
							if(!cl_pinglist[j].adr.port) {
								memcpy(&cl_pinglist[j].adr, &host[i].adr, sizeof(netadr_t));
								cl_pinglist[j].start = Sys_Milliseconds();
								cl_pinglist[j].time = 0;
								NET_OutOfBandPrint(NS_USER, &cl_pinglist[j].adr, "getinfo xxx");
								slots++;
								break;
							}
						}
					}
				}
				// if the host has a ping higher than cl_maxPing or
				// the ping packet got lost
				else if(host[i].ping == 0) {
					// if we are updating global hosts
					if(source == AS_GLOBAL) {
						//
						if(cls.numGlobalHostAddresses > 0) {
							// overwrite this host with one from the additional global hosts
							cls.numGlobalHostAddresses--;
							CL_InitHostInfo(&host[i], &cls.globalHostAddresses[cls.numGlobalHostAddresses]);
							// NOTE: the host[i].visible flag stays untouched
						}
					}
				}
			}
		}
	}

	if(slots) {
		status = qtrue;
	}
	for(i = 0; i < MAX_PINGREQUESTS; i++) {
		if(!cl_pinglist[i].adr.port) {
			continue;
		}
		CL_GetPing(i, buff, MAX_STRING_CHARS, &pingTime);
		if(pingTime != 0) {
			CL_ClearPing(i);
			status = qtrue;
		}
	}

	return status;
}


/*
==================
CL_HostStatus_f
==================
*/
static void CL_HostStatus_f(void) {
	netadr_t	to, *toptr = NULL;
	char		*host;
	hostStatus_t *hostStatus;
	int			argc;
	netadrtype_t	family = NA_UNSPEC;

	argc = Cmd_Argc();

	if(argc != 2 && argc != 3)
	{
		if(cls.state != CA_ACTIVE || clc.demoplaying)
		{
			Com_Printf("Not connected to a host.\n");
#ifdef USE_IPV6
			Com_Printf("usage: hoststatus [-4|-6] <host>\n");
#else
			Com_Printf("usage: hoststatus <host>\n");
#endif
			return;
		}

		toptr = &clc.hostAddress;
	}

	if(!toptr)
	{
		Com_Memset(&to, 0, sizeof(to));

		if(argc == 2)
			host = Cmd_Argv(1);
		else
		{
			if(!strcmp(Cmd_Argv(1), "-4"))
				family = NA_IP;
#ifdef USE_IPV6
			else if(!strcmp(Cmd_Argv(1), "-6"))
				family = NA_IP6;
			else
				Com_Printf("warning: only -4 or -6 as address type understood.\n");
#else
			else
				Com_Printf("warning: only -4 as address type understood.\n");
#endif

			host = Cmd_Argv(2);
		}

		toptr = &to;
		if(!NET_StringToAdr(host, toptr, family))
			return;
	}

	NET_OutOfBandPrint(NS_USER, toptr, "getstatus");

	hostStatus = CL_GetHostStatus(toptr);
	hostStatus->address = *toptr;
	hostStatus->print = qtrue;
	hostStatus->pending = qtrue;
}


/*
==================
CL_ShowIP_f
==================
*/
static void CL_ShowIP_f(void) {
	Sys_ShowIP();
}


#ifdef CURL_ON_Make

qboolean CL_Download(const char *cmd, const char *pakname, qboolean autoDownload)
{
	char url[MAX_OSPATH];
	char name[MAX_CVAR_VALUE_STRING];
	const char *s;

	if(cl_dlURL->string[0] == '\0')
	{
		Com_Printf(S_COLOR_YELLOW "cl_dlURL cvar is not set\n");
		return qfalse;
	}

	// skip leading slashes
	while(*pakname == '/' || *pakname == '\\')
		pakname++;

	// skip gamedir
	s = strrchr(pakname, '/');
	if(s)
		pakname = s+1;

	if(!Com_DL_ValidFileName(pakname))
	{
		Com_Printf(S_COLOR_YELLOW "invalid file name: '%s'.\n", pakname);
		return qfalse;
	}

	if(!Q_stricmp(cmd, "dlmap"))
	{
		Q_strncpyz(name, pakname, sizeof(name));
		FS_StripExt(name, ".pk3");
		if(!name[0])
			return qfalse;
		s = va("maps/%s.bsp", name);
		if(FS_FileIsInPAK(s, NULL, url))
		{
			Com_Printf(S_COLOR_YELLOW " map %s already exists in %s.pk3\n", name, url);
			return qfalse;
		}
	}

	return Com_DL_Begin(&download, pakname, cl_dlURL->string, autoDownload);
}


/*
==================
CL_Download_f
==================
*/
static void CL_Download_f(void)
{
	if(Cmd_Argc() < 2 || *Cmd_Argv(1) == '\0')
	{
		Com_Printf("usage: %s <mapname>\n", Cmd_Argv(0));
		return;
	}

	if(!strcmp(Cmd_Argv(1), "-"))
	{
		Com_DL_Cleanup(&download);
		return;
	}

	CL_Download(Cmd_Argv(0), Cmd_Argv(1), qfalse);
}
#endif // CURL_ON_Make
