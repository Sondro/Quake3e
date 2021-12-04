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
// user.h -- primary header for user

#include "../co/q_shared.h"
#include "../co/co.h"
#include "../co/vm_local.h"
#include "../gfxercommon/tr_public.h"
#include "../ui/ui_public.h"
#include "keys.h"
#include "snd_public.h"
#include "../user/app/cg_public.h"
#include "../co/app/bg_public.h"

#ifdef CURL_ON_Make
#include "./cl_curl.h"
#endif /* CURL_ON_Make */

// file full of random crap that gets used to create cl_guid
#define QKEY_FILE "qkey"
#define QKEY_SIZE 2048

#define RETRANSMIT_TIMEOUT	3000	// time between connection packet retransmits

// snapshots are a view of the host at a given time
typedef struct {
	qboolean		valid;			// cleared if delta parsing was invalid
	int				snapFlags;		// rate delayed and dropped commands

	int				hostTime;		// host time the message is valid for(in msec)

	int				messageNum;		// copied from netchan->incoming_sequence
	int				deltaNum;		// messageNum the delta is from
	int				ping;			// time from when cmdNum-1 was sent to time packet was reeceived
	int				areabytes;
	byte			areamask[MAX_MAP_AREA_BYTES];		// portalarea visibility bits

	int				cmdNum;			// the next cmdNum the host is expecting
	playerState_t	ps;						// complete information about the current player at this time

	int				numEntities;			// all of the entities that need to be presented
	int				parseEntitiesNum;		// at the time of this snapshot

	int				hostCommandNum;		// execute all commands up to this before
											// making the snapshot current
} clSnapshot_t;



/*
=============================================================================

the userActive_t structure is wiped completely at every
new gamestate_t, potentially several times during an established connection

=============================================================================
*/

typedef struct {
	int		p_cmdNumber;		// cl.cmdNumber when packet was sent
	int		p_hostTime;		// usercmd->hostTime when packet was sent
	int		p_realtime;			// cls.realtime when packet was sent
} outPacket_t;

// the parseEntities array must be large enough to hold PACKET_BACKUP frames of
// entities, so that when a delta compressed message arives from the host
// it can be un-deltad from the original 
#define MAX_PARSE_ENTITIES	(PACKET_BACKUP * MAX_SNAPSHOT_ENTITIES)

extern int g_console_field_width;

typedef struct {
	int			timeoutcount;		// it requres several frames in a timeout condition
									// to disconnect, preventing debugging breaks from
									// causing immediate disconnects on continue
	clSnapshot_t	snap;			// latest received from host

	int			hostTime;			// may be paused during play
	int			oldHostTime;		// to prevent time from flowing bakcwards
	int			oldFrameHostTime;	// to check tournament restarts
	int			hostTimeDelta;	// cl.hostTime = cls.realtime + cl.hostTimeDelta
									// this value changes as net lag varies
	qboolean	extrapolatedSnapshot;	// set if any app frame has been forced to extrapolate
									// cleared when CL_AdjustTimeDelta looks at it
	qboolean	newSnapshots;		// set on parse of any valid packet

	gameState_t	gameState;			// configstrings
	char		mapname[MAX_QPATH];	// extracted from CS_HOSTINFO

	int			parseEntitiesNum;	// index(not anded off) into cl_parse_entities[]

	int			mouseDx[2], mouseDy[2];	// added to by mouse events
	int			mouseIndex;
	int			joystickAxis[MAX_JOYSTICK_AXIS];	// set by joystick events

	// app communicates a few values to the user system
	int			appUserCmdValue;	// current weapon to add to usercmd_t
	float		appSensitivity;

	// cmds[cmdNumber] is the predicted command, [cmdNumber-1] is the last
	// properly generated command
	usercmd_t	cmds[CMD_BACKUP];	// each mesage will send several old cmds
	int			cmdNumber;			// incremented each frame, because multiple
									// frames may need to be packed into a single packet

	outPacket_t	outPackets[PACKET_BACKUP];	// information about each packet we have sent out

	// the user maintains its own idea of view angles, which are
	// sent to the host each frame.  It is cleared to 0 upon entering each level.
	// the host sends a delta each frame which is added to the locally
	// tracked view angles to account for standing on rotating objects,
	// and teleport direction changes
	vec3_t		viewangles;

	int			hostId;			// included in each user message so the host
												// can tell if it is for a prior map_restart
	// big stuff at end of structure so most offsets are 15 bits or less
	clSnapshot_t	snapshots[PACKET_BACKUP];

	entityState_t	entityBaselines[MAX_GENTITIES];	// for delta compression when not in previous frame

	entityState_t	parseEntities[MAX_PARSE_ENTITIES];

	byte			baselineUsed[MAX_GENTITIES];
} userActive_t;

extern	userActive_t		cl;

#define EM_GAMESTATE 1
#define EM_SNAPSHOT  2
#define EM_COMMAND   4

/*
=============================================================================

the userConnection_t structure is wiped when disconnecting from a host,
either to go to a full screen console, play a demo, or connect to a different host

A connection can be to either a host through the network layer or a
demo through a file.

=============================================================================
*/

typedef struct {

	int			userNum;
	int			lastPacketSentTime;			// for retransmits during connection
	int			lastPacketTime;				// for timeouts

	netadr_t	hostAddress;
	int			connectTime;				// for connection retransmits
	int			connectPacketCount;			// for display on connection dialog
	char		hostMessage[MAX_STRING_CHARS]; // for display on connection dialog

	int			challenge;					// from the host to use for connecting
	int			checksumFeed;				// from the host for checksum calculations

	// these are our reliable messages that go to the host
	int			reliableSequence;
	int			reliableAcknowledge;		// the last one the host has executed
	char		reliableCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS];

	// host message(unreliable) and command(reliable) sequence
	// numbers are NOT cleared at level changes, but continue to
	// increase as long as the connection is valid

	// message sequence is used by both the network layer and the
	// delta compression layer
	int			hostMessageSequence;

	// reliable messages received from host
	int			hostCommandSequence;
	int			lastExecutedHostCommand;		// last host command grabbed or executed with CL_GetHostCommand
	char		hostCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS];
	qboolean	hostCommandsIgnore[MAX_RELIABLE_COMMANDS];

	// file transfer from host
	fileHandle_t download;
	char		downloadName[MAX_OSPATH];
	char		downloadTempName[MAX_OSPATH + 4]; // downloadName + ".tmp"
	int			sv_allowDownload;
	char		sv_dlURL[MAX_CVAR_VALUE_STRING];
	int			downloadNumber;
	int			downloadBlock;	// block we are waiting for
	int			downloadCount;	// how many bytes we got
	int			downloadSize;	// how many bytes we got
	char		downloadList[BIG_INFO_STRING]; // list of paks we need to download
	qboolean	downloadRestart;	// if true, we need to do another FS_Restart because we downloaded a pak

#ifdef CURL_ON_Make
	qboolean	cURLEnabled;
	qboolean	cURLUsed;
	qboolean	cURLDisconnected;
	char		downloadURL[MAX_OSPATH];
	CURL		*downloadCURL;
	CURLM		*downloadCURLM;
#endif /* CURL_ON_Make */

	// demo information
	char		demoName[MAX_OSPATH];
	char		recordName[MAX_OSPATH]; // without extension
	qboolean	explicitRecordName;
	char		recordNameShort[TRUNCATE_LENGTH]; // for recording message
	qboolean	dm68compat;
	qboolean	spDemoRecording;
	qboolean	demorecording;
	qboolean	demoplaying;
	qboolean	demowaiting;	// don't record until a non-delta message is received
	qboolean	firstDemoFrameSkipped;
	fileHandle_t	demofile;
	fileHandle_t	recordfile;

	int		timeDemoFrames;		// counter of gfxed frames
	int		timeDemoStart;		// cls.realtime before first frame
	int		timeDemoBaseTime;	// each frame will be at this time + frameNum * 50

	float	aviVideoFrameRemainder;
	float	aviSoundFrameRemainder;
	int		aviFrameEndTime;
	char	videoName[MAX_QPATH];
	int		videoIndex;

	// big stuff at end of structure so most offsets are 15 bits or less
	netchan_t	netchan;

	qboolean compat;

	// simultaneous demo playback and recording
	int		eventMask;
	int		demoCommandSequence;
	int		demoDeltaNum;
	int		demoMessageSequence;

} userConnection_t;

extern	userConnection_t clc;

/*
==================================================================

the userStatic_t structure is never wiped, and is used even when
no user connection is active at all

==================================================================
*/

typedef struct {
	netadr_t	adr;
	int			start;
	int			time;
	char		info[MAX_INFO_STRING];
} ping_t;

typedef struct {
	netadr_t	adr;
	char	  	hostName[MAX_NAME_LENGTH];
	char	  	mapName[MAX_NAME_LENGTH];
	char	  	game[MAX_NAME_LENGTH];
	int			netType;
	int			gameType;
	int		  	users;
	int		  	maxUsers;
	int			minPing;
	int			maxPing;
	int			ping;
	qboolean	visible;
	int			punkbuster;
	int			g_humanplayers;
	int			g_needpass;
} hostInfo_t;

typedef struct {
	connstate_t	state;				// connection status
	qboolean	gameSwitch;

	qboolean	cddialog;			// bring up the cd needed dialog next frame

	char		hostname[MAX_OSPATH];		// name of host from original connect(used by reconnect)

	// when the host clears the hunk, all of these must be restarted
	qboolean	gfxerStarted;
	qboolean	soundStarted;
	qboolean	soundRegistered;
	qboolean	uiStarted;
	qboolean	appStarted;

	int			framecount;
	int			frametime;			// msec since last frame

	int			realtime;			// ignores pause
	int			realFrametime;		// ignoring pause, so console always works

	int			numlocalhosts;
	hostInfo_t	localHosts[MAX_OTHER_HOSTS];

	int			numglobalhosts;
	hostInfo_t  globalHosts[MAX_GLOBAL_HOSTS];
	// additional global hosts
	int			numGlobalHostAddresses;
	netadr_t		globalHostAddresses[MAX_GLOBAL_HOSTS];

	int			numfavoritehosts;
	hostInfo_t	favoriteHosts[MAX_OTHER_HOSTS];

	int pingUpdateSource;		// source currently pinging or updating

	// update host info
	netadr_t	updateHost;
	char		updateChallenge[MAX_TOKEN_CHARS];
	char		updateInfoString[MAX_INFO_STRING];

	netadr_t	authorizeHost;

	// gfxing info
	glconfig_t	glconfig;
	qhandle_t	charSetShader;
	qhandle_t	whiteShader;
	qhandle_t	consoleShader;

	int			lastVidRestart;
	int			soundMuted;

	qboolean	startCgame;

	int			captureWidth;
	int			captureHeight;

	float		scale;
	float		biasX;
	float		biasY;

} userStatic_t;

extern int bigchar_width;
extern int bigchar_height;
extern int smallchar_width;
extern int smallchar_height;

extern	userStatic_t		cls;

extern	char		cl_oldGame[MAX_QPATH];
extern	qboolean	cl_oldGameSet;

#ifdef CURL_ON_Make

extern		download_t	download;
qboolean	Com_DL_Perform(download_t *dl);
void		Com_DL_Cleanup(download_t *dl);
qboolean	Com_DL_Begin(download_t *dl, const char *localName, const char *remoteURL, qboolean autoDownload);
qboolean	Com_DL_InProgress(const download_t *dl);
qboolean	Com_DL_ValidFileName(const char *fileName);
qboolean	CL_Download(const char *cmd, const char *pakname, qboolean autoDownload);

#endif

//=============================================================================

extern	vm_t			*cgvm;	// interface to app dll or vm
extern	vm_t			*uivm;	// interface to ui dll or vm
extern	refexport_t		re;		// interface to refresh .dll


//
// cvars
//
extern	cvar_t	*cl_noprint;
extern	cvar_t	*cl_debugMove;
extern	cvar_t	*cl_timegraph;
extern	cvar_t	*cl_shownet;
extern	cvar_t	*cl_autoNudge;
extern	cvar_t	*cl_timeNudge;
extern	cvar_t	*cl_showTimeDelta;

extern	cvar_t	*com_timedemo;
extern	cvar_t	*cl_aviFrameRate;
extern	cvar_t	*cl_aviMotionJpeg;
extern	cvar_t	*cl_aviPipeFormat;

extern	cvar_t	*cl_activeAction;

extern	cvar_t	*cl_allowDownload;
#ifdef CURL_ON_Make
extern	cvar_t	*cl_mapAutoDownload;
extern	cvar_t	*cl_dlDirectory;
#endif
extern	cvar_t	*cl_conXOffset;
extern	cvar_t	*cl_conColor;
extern	cvar_t	*cl_inGameVideo;

extern	cvar_t	*cl_lanForcePackets;
extern	cvar_t	*cl_autoRecordDemo;

extern	cvar_t	*com_maxfps;

extern	cvar_t	*vid_xpos;
extern	cvar_t	*vid_ypos;
extern	cvar_t	*r_noborder;

extern	cvar_t	*r_allowSoftwareGL;
extern	cvar_t	*r_swapInterval;
extern	cvar_t	*r_glDriver;

extern	cvar_t	*r_displayRefresh;
extern	cvar_t	*r_fullscreen;
extern	cvar_t	*r_mode;
extern	cvar_t	*r_modeFullscreen;
extern	cvar_t	*r_customwidth;
extern	cvar_t	*r_customheight;
extern	cvar_t	*r_customPixelAspect;
extern	cvar_t	*r_colorbits;
extern	cvar_t	*cl_stencilbits;
extern	cvar_t	*cl_depthbits;
extern	cvar_t	*cl_drawBuffer;

//=================================================

//
// cl_main
//
void CL_AddReliableCommand(const char *cmd, qboolean isDisconnectCmd);

void CL_StartHunkUsers(void);

void CL_Disconnect_f(void);
void CL_ReadDemoMessage(void);
void CL_StopRecord_f(void);

void CL_InitDownloads(void);
void CL_NextDownload(void);

void CL_GetPing(int n, char *buf, int buflen, int *pingtime);
void CL_GetPingInfo(int n, char *buf, int buflen);
void CL_ClearPing(int n);
int CL_GetPingQueueCount(void);

void CL_ClearState(void);

int CL_HostStatus(const char *hostAddress, char *hostStatusString, int maxLen);

qboolean CL_CheckPaused(void);
qboolean CL_NoDelay(void);

qboolean CL_GetModeInfo(int *width, int *height, float *windowAspect, int mode, const char *modeFS, int dw, int dh, qboolean fullscreen);


//
// cl_input
//
void CL_InitInput(void);
void CL_ClearInput(void);
void CL_SendCmd(void);
void CL_WritePacket(void);

//
// cl_keys.c
//
extern  field_t     chatField;
extern  field_t     g_consoleField;

void Field_Draw(field_t *edit, int x, int y, int width, qboolean showCursor, qboolean noColorEscape);
void Field_BigDraw(field_t *edit, int x, int y, int width, qboolean showCursor, qboolean noColorEscape);

//
// cl_parse.c
//
extern int cl_connectedToPureHost;
extern int cl_connectedToCheatHost;

void CL_ParseHostMessage(msg_t *msg);

//====================================================================

qboolean CL_UpdateVisiblePings_f(int source);
qboolean CL_ValidPakSignature(const byte *data, int len);


//
// console
//
void Con_CheckResize(void);
void Con_Init(void);
void Con_Shutdown(void);
void Con_ToggleConsole_f(void);
void Con_DrawNotify(void);
void Con_ClearNotify(void);
void Con_RunConsole(void);
void Con_DrawConsole(void);
void Con_PageUp(int lines);
void Con_PageDown(int lines);
void Con_Top(void);
void Con_Bottom(void);
void Con_Close(void);

void CL_LoadConsoleHistory(void);
void CL_SaveConsoleHistory(void);

//
// cl_scrn.c
//
void	SCR_Init(void);
void	SCR_Done(void);
void	SCR_UpdateScreen(void);

void	SCR_DebugGraph(float value);

int		SCR_GetBigStringWidth(const char *str);	// returns in virtual 640x480 coordinates

void	SCR_AdjustFrom640(float *x, float *y, float *w, float *h);
void	SCR_FillRect(float x, float y, float width, float height, 
					 const float *color);
void	SCR_DrawPic(float x, float y, float width, float height, qhandle_t hShader);
void	SCR_DrawNamedPic(float x, float y, float width, float height, const char *picname);

void	SCR_DrawBigString(int x, int y, const char *s, float alpha, qboolean noColorEscape);			// draws a string with embedded color control characters with fade
void	SCR_DrawStringExt(int x, int y, float size, const char *string, const float *setColor, qboolean forceColor, qboolean noColorEscape);
void	SCR_DrawSmallStringExt(int x, int y, const char *string, const float *setColor, qboolean forceColor, qboolean noColorEscape);
void	SCR_DrawSmallChar(int x, int y, int ch);
void	SCR_DrawSmallString(int x, int y, const char *s, int len);

//
// cl_cin.c
//

void CL_PlayCinematic_f(void);
void SCR_DrawCinematic(void);
void SCR_RunCinematic(void);
void SCR_StopCinematic(void);
int CIN_PlayCinematic(const char *arg0, int xpos, int ypos, int width, int height, int bits);
e_status CIN_StopCinematic(int handle);
e_status CIN_RunCinematic(int handle);
void CIN_DrawCinematic(int handle);
void CIN_SetExtents(int handle, int x, int y, int w, int h);
void CIN_UploadCinematic(int handle);
void CIN_CloseAllVideos(void);

//
// cl_app.c
//
void CL_InitCGame(void);
void CL_ShutdownCGame(void);
qboolean CL_GameCommand(void);
void CL_CGameGfxing(stereoFrame_t stereo);
void CL_SetCGameTime(void);

//
// cl_ui.c
//
void CL_InitUI(void);
void CL_ShutdownUI(void);
int Key_GetCatcher(void);
void Key_SetCatcher(int catcher);
void LAN_LoadCachedHosts(void);
void LAN_SaveHostsToCache(void);


//
// cl_net_chan.c
//
void CL_Netchan_Transmit(netchan_t *chan, msg_t *msg);
qboolean CL_Netchan_Process(netchan_t *chan, msg_t *msg);

//
// cl_avi.c
//
qboolean CL_OpenAVIForWriting(const char *filename, qboolean pipe);
void CL_TakeVideoFrame(void);
void CL_WriteAVIVideoFrame(const byte *imageBuffer, int size);
void CL_WriteAVIAudioFrame(const byte *pcmBuffer, int size);
qboolean CL_CloseAVI(void);
qboolean CL_VideoRecording(void);

//
// cl_jpeg.c
//
size_t	CL_SaveJPGToBuffer(byte *buffer, size_t bufSize, int quality, int image_width, int image_height, byte *image_buffer, int padding);
void	CL_SaveJPG(const char *filename, int quality, int image_width, int image_height, byte *image_buffer, int padding);
void	CL_LoadJPG(const char *filename, unsigned char **pic, int *width, int *height);

// platform-specific
void	GLimp_Init(glconfig_t *config);
void	GLimp_Shutdown(qboolean unloadDLL);
void	GLimp_EndFrame(void);

void	GLimp_InitGamma(glconfig_t *config);
void	GLimp_SetGamma(unsigned char red[256], unsigned char green[256], unsigned char blue[256]);

void	*GL_GetProcAddress(const char *name);

// Vulkan
#ifdef VULKAN_API_ON_Make
void	VKimp_Init(glconfig_t *config);
void	VKimp_Shutdown(qboolean unloadDLL);
void	*VK_GetInstanceProcAddr(VkInstance instance, const char *name);
qboolean VK_CreateSurface(VkInstance instance, VkSurfaceKHR* pSurface);
#endif
