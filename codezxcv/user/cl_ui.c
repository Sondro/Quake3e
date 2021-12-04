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

#include "user.h"

#include "../botlib/botlib.h"

extern	botlib_export_t	*botlib_export;

vm_t *uivm = NULL;

/*
====================
GetUserState
====================
*/
static void GetUserState(uiUserState_t *state) {
	state->connectPacketCount = clc.connectPacketCount;
	state->connState = cls.state;
	Q_strncpyz(state->hostname, cls.hostname, sizeof(state->hostname));
	Q_strncpyz(state->updateInfoString, cls.updateInfoString, sizeof(state->updateInfoString));
	Q_strncpyz(state->messageString, clc.hostMessage, sizeof(state->messageString));
	state->userNum = cl.snap.ps.userNum;
}


/*
====================
LAN_LoadCachedHosts
====================
*/
void LAN_LoadCachedHosts(void) {
	fileHandle_t fileIn;
	int size, file_size;

	cls.numglobalhosts = cls.numfavoritehosts = 0;
	cls.numGlobalHostAddresses = 0;

	file_size = FS_Home_FOpenFileRead("hostcache.dat", &fileIn);
	if(file_size <(3*sizeof(int))) {
		if(fileIn != FS_INVALID_HANDLE) {
			FS_FCloseFile(fileIn);
		}
		return;
	}

	FS_Read(&cls.numglobalhosts, sizeof(int), fileIn);
	FS_Read(&cls.numfavoritehosts, sizeof(int), fileIn);
	FS_Read(&size, sizeof(int), fileIn);

	if(size == sizeof(cls.globalHosts) + sizeof(cls.favoriteHosts)) {
		FS_Read(&cls.globalHosts, sizeof(cls.globalHosts), fileIn);
		FS_Read(&cls.favoriteHosts, sizeof(cls.favoriteHosts), fileIn);
	} else {
		cls.numglobalhosts = cls.numfavoritehosts = 0;
		cls.numGlobalHostAddresses = 0;
	}

	FS_FCloseFile(fileIn);
}


/*
====================
LAN_SaveHostsToCache
====================
*/
void LAN_SaveHostsToCache(void) {
	fileHandle_t fileOut;
	int size;

	fileOut = FS_FOpenFileWrite("hostcache.dat");
	if(fileOut == FS_INVALID_HANDLE)
		return;

	FS_Write(&cls.numglobalhosts, sizeof(int), fileOut);
	FS_Write(&cls.numfavoritehosts, sizeof(int), fileOut);
	size = sizeof(cls.globalHosts) + sizeof(cls.favoriteHosts);
	FS_Write(&size, sizeof(int), fileOut);
	FS_Write(&cls.globalHosts, sizeof(cls.globalHosts), fileOut);
	FS_Write(&cls.favoriteHosts, sizeof(cls.favoriteHosts), fileOut);

	FS_FCloseFile(fileOut);
}


/*
====================
LAN_ResetPings
====================
*/
static void LAN_ResetPings(int source) {
	int count,i;
	hostInfo_t *hosts = NULL;
	count = 0;

	switch(source) {
		case AS_LOCAL :
			hosts = &cls.localHosts[0];
			count = MAX_OTHER_HOSTS;
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			hosts = &cls.globalHosts[0];
			count = MAX_GLOBAL_HOSTS;
			break;
		case AS_FAVORITES :
			hosts = &cls.favoriteHosts[0];
			count = MAX_OTHER_HOSTS;
			break;
	}
	if(hosts) {
		for(i = 0; i < count; i++) {
			hosts[i].ping = -1;
		}
	}
}


/*
====================
LAN_AddHost
====================
*/
static int LAN_AddHost(int source, const char *name, const char *address) {
	int max, *count, i;
	netadr_t adr;
	hostInfo_t *hosts = NULL;
	max = MAX_OTHER_HOSTS;
	count = NULL;

	switch(source) {
		case AS_LOCAL :
			count = &cls.numlocalhosts;
			hosts = &cls.localHosts[0];
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			max = MAX_GLOBAL_HOSTS;
			count = &cls.numglobalhosts;
			hosts = &cls.globalHosts[0];
			break;
		case AS_FAVORITES :
			count = &cls.numfavoritehosts;
			hosts = &cls.favoriteHosts[0];
			break;
	}
	if(hosts && *count < max) {
		NET_StringToAdr(address, &adr, NA_UNSPEC);
		for(i = 0; i < *count; i++) {
			if(NET_CompareAdr(&hosts[i].adr, &adr)) {
				break;
			}
		}
		if(i >= *count) {
			hosts[*count].adr = adr;
			Q_strncpyz(hosts[*count].hostName, name, sizeof(hosts[*count].hostName));
			hosts[*count].visible = qtrue;
			(*count)++;
			return 1;
		}
		return 0;
	}
	return -1;
}


/*
====================
LAN_RemoveHost
====================
*/
static void LAN_RemoveHost(int source, const char *addr) {
	int *count, i;
	hostInfo_t *hosts = NULL;
	count = NULL;
	switch(source) {
		case AS_LOCAL :
			count = &cls.numlocalhosts;
			hosts = &cls.localHosts[0];
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			count = &cls.numglobalhosts;
			hosts = &cls.globalHosts[0];
			break;
		case AS_FAVORITES :
			count = &cls.numfavoritehosts;
			hosts = &cls.favoriteHosts[0];
			break;
	}
	if(hosts) {
		netadr_t comp;
		NET_StringToAdr(addr, &comp, NA_UNSPEC);
		for(i = 0; i < *count; i++) {
			if(NET_CompareAdr(&comp, &hosts[i].adr)) {
				int j = i;
				while(j < *count - 1) {
					Com_Memcpy(&hosts[j], &hosts[j+1], sizeof(hosts[j]));
					j++;
				}
				(*count)--;
				break;
			}
		}
	}
}


/*
====================
LAN_GetHostCount
====================
*/
static int LAN_GetHostCount(int source) {
	switch(source) {
		case AS_LOCAL :
			return cls.numlocalhosts;
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			return cls.numglobalhosts;
			break;
		case AS_FAVORITES :
			return cls.numfavoritehosts;
			break;
	}
	return 0;
}


/*
====================
LAN_GetLocalHostAddressString
====================
*/
static void LAN_GetHostAddressString(int source, int n, char *buf, int buflen) {
	switch(source) {
		case AS_LOCAL :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				Q_strncpyz(buf, NET_AdrToStringwPort(&cls.localHosts[n].adr) , buflen);
				return;
			}
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			if(n >= 0 && n < MAX_GLOBAL_HOSTS) {
				Q_strncpyz(buf, NET_AdrToStringwPort(&cls.globalHosts[n].adr) , buflen);
				return;
			}
			break;
		case AS_FAVORITES :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				Q_strncpyz(buf, NET_AdrToStringwPort(&cls.favoriteHosts[n].adr) , buflen);
				return;
			}
			break;
	}
	buf[0] = '\0';
}


/*
====================
LAN_GetHostInfo
====================
*/
static void LAN_GetHostInfo(int source, int n, char *buf, int buflen) {
	char info[MAX_STRING_CHARS];
	hostInfo_t *host = NULL;
	info[0] = '\0';
	switch(source) {
		case AS_LOCAL :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				host = &cls.localHosts[n];
			}
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			if(n >= 0 && n < MAX_GLOBAL_HOSTS) {
				host = &cls.globalHosts[n];
			}
			break;
		case AS_FAVORITES :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				host = &cls.favoriteHosts[n];
			}
			break;
	}
	if(host && buf) {
		buf[0] = '\0';
		Info_SetValueForKey(info, "hostname", host->hostName);
		Info_SetValueForKey(info, "mapname", host->mapName);
		Info_SetValueForKey(info, "users", va("%i",host->users));
		Info_SetValueForKey(info, "sv_maxusers", va("%i",host->maxUsers));
		Info_SetValueForKey(info, "ping", va("%i",host->ping));
		Info_SetValueForKey(info, "minping", va("%i",host->minPing));
		Info_SetValueForKey(info, "maxping", va("%i",host->maxPing));
		Info_SetValueForKey(info, "game", host->game);
		Info_SetValueForKey(info, "gametype", va("%i",host->gameType));
		Info_SetValueForKey(info, "nettype", va("%i",host->netType));
		Info_SetValueForKey(info, "addr", NET_AdrToStringwPort(&host->adr));
		Info_SetValueForKey(info, "punkbuster", va("%i", host->punkbuster));
		Info_SetValueForKey(info, "g_needpass", va("%i", host->g_needpass));
		Info_SetValueForKey(info, "g_humanplayers", va("%i", host->g_humanplayers));
		Q_strncpyz(buf, info, buflen);
	} else {
		if(buf) {
			buf[0] = '\0';
		}
	}
}


/*
====================
LAN_GetHostPing
====================
*/
static int LAN_GetHostPing(int source, int n) {
	hostInfo_t *host = NULL;
	switch(source) {
		case AS_LOCAL :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				host = &cls.localHosts[n];
			}
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			if(n >= 0 && n < MAX_GLOBAL_HOSTS) {
				host = &cls.globalHosts[n];
			}
			break;
		case AS_FAVORITES :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				host = &cls.favoriteHosts[n];
			}
			break;
	}
	if(host) {
		return host->ping;
	}
	return -1;
}

/*
====================
LAN_GetHostPtr
====================
*/
static hostInfo_t *LAN_GetHostPtr(int source, int n) {
	switch(source) {
		case AS_LOCAL :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				return &cls.localHosts[n];
			}
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			if(n >= 0 && n < MAX_GLOBAL_HOSTS) {
				return &cls.globalHosts[n];
			}
			break;
		case AS_FAVORITES :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				return &cls.favoriteHosts[n];
			}
			break;
	}
	return NULL;
}


/*
====================
LAN_CompareHosts
====================
*/
static int LAN_CompareHosts(int source, int sortKey, int sortDir, int s1, int s2) {
	int res;
	hostInfo_t *host1, *host2;

	host1 = LAN_GetHostPtr(source, s1);
	host2 = LAN_GetHostPtr(source, s2);
	if(!host1 || !host2) {
		return 0;
	}

	res = 0;
	switch(sortKey) {
		case SORT_HOST:
			res = Q_stricmp(host1->hostName, host2->hostName);
			break;

		case SORT_MAP:
			res = Q_stricmp(host1->mapName, host2->mapName);
			break;
		case SORT_USERS:
			if(host1->users < host2->users) {
				res = -1;
			}
			else if(host1->users > host2->users) {
				res = 1;
			}
			else {
				res = 0;
			}
			break;
		case SORT_GAME:
			if(host1->gameType < host2->gameType) {
				res = -1;
			}
			else if(host1->gameType > host2->gameType) {
				res = 1;
			}
			else {
				res = 0;
			}
			break;
		case SORT_PING:
			if(host1->ping < host2->ping) {
				res = -1;
			}
			else if(host1->ping > host2->ping) {
				res = 1;
			}
			else {
				res = 0;
			}
			break;
	}

	if(sortDir) {
		if(res < 0)
			return 1;
		if(res > 0)
			return -1;
		return 0;
	}
	return res;
}


/*
====================
LAN_GetPingQueueCount
====================
*/
static int LAN_GetPingQueueCount(void) {
	return(CL_GetPingQueueCount());
}


/*
====================
LAN_ClearPing
====================
*/
static void LAN_ClearPing(int n) {
	CL_ClearPing(n);
}


/*
====================
LAN_GetPing
====================
*/
static void LAN_GetPing(int n, char *buf, int buflen, int *pingtime) {
	CL_GetPing(n, buf, buflen, pingtime);
}


/*
====================
LAN_GetPingInfo
====================
*/
static void LAN_GetPingInfo(int n, char *buf, int buflen) {
	CL_GetPingInfo(n, buf, buflen);
}


/*
====================
LAN_MarkHostVisible
====================
*/
static void LAN_MarkHostVisible(int source, int n, qboolean visible) {
	if(n == -1) {
		int count = MAX_OTHER_HOSTS;
		hostInfo_t *host = NULL;
		switch(source) {
			case AS_LOCAL :
				host = &cls.localHosts[0];
				break;
			case AS_MPLAYER:
			case AS_GLOBAL :
				host = &cls.globalHosts[0];
				count = MAX_GLOBAL_HOSTS;
				break;
			case AS_FAVORITES :
				host = &cls.favoriteHosts[0];
				break;
		}
		if(host) {
			for(n = 0; n < count; n++) {
				host[n].visible = visible;
			}
		}

	} else {
		switch(source) {
			case AS_LOCAL :
				if(n >= 0 && n < MAX_OTHER_HOSTS) {
					cls.localHosts[n].visible = visible;
				}
				break;
			case AS_MPLAYER:
			case AS_GLOBAL :
				if(n >= 0 && n < MAX_GLOBAL_HOSTS) {
					cls.globalHosts[n].visible = visible;
				}
				break;
			case AS_FAVORITES :
				if(n >= 0 && n < MAX_OTHER_HOSTS) {
					cls.favoriteHosts[n].visible = visible;
				}
				break;
		}
	}
}


/*
=======================
LAN_HostIsVisible
=======================
*/
static int LAN_HostIsVisible(int source, int n) {
	switch(source) {
		case AS_LOCAL :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				return cls.localHosts[n].visible;
			}
			break;
		case AS_MPLAYER:
		case AS_GLOBAL :
			if(n >= 0 && n < MAX_GLOBAL_HOSTS) {
				return cls.globalHosts[n].visible;
			}
			break;
		case AS_FAVORITES :
			if(n >= 0 && n < MAX_OTHER_HOSTS) {
				return cls.favoriteHosts[n].visible;
			}
			break;
	}
	return qfalse;
}


/*
=======================
LAN_UpdateVisiblePings
=======================
*/
qboolean LAN_UpdateVisiblePings(int source) {
	return CL_UpdateVisiblePings_f(source);
}


/*
====================
LAN_GetHostStatus
====================
*/
static int LAN_GetHostStatus(const char *hostAddress, char *hostStatus, int maxLen) {
	return CL_HostStatus(hostAddress, hostStatus, maxLen);
}


/*
====================
CL_GetGlConfig
====================
*/
static void CL_GetGlconfig(glconfig_t *config) {
	*config = *re.GetConfig();
}


/*
====================
CL_GetClipboardData
====================
*/
static void CL_GetClipboardData(char *buf, int buflen) {
	char	*cbd;

	cbd = Sys_GetClipboardData();

	if(!cbd) {
		*buf = '\0';
		return;
	}

	Q_strncpyz(buf, cbd, buflen);

	Z_Free(cbd);
}


/*
====================
Key_KeynumToStringBuf
====================
*/
static void Key_KeynumToStringBuf(int keynum, char *buf, int buflen) {
	Q_strncpyz(buf, Key_KeynumToString(keynum), buflen);
}


/*
====================
Key_GetBindingBuf
====================
*/
static void Key_GetBindingBuf(int keynum, char *buf, int buflen) {
	const char *value;

	value = Key_GetBinding(keynum);
	if(value) {
		Q_strncpyz(buf, value, buflen);
	}
	else {
		*buf = '\0';
	}
}


/*
====================
CLUI_GetCDKey
====================
*/
static void CLUI_GetCDKey(char *buf, int buflen) {
#ifndef STANDALONE
	const char *gamedir;
	gamedir = Cvar_VariableString("fs_game");
	if(UI_usesUniqueCDKey() && gamedir[0] != '\0') {
		Com_Memcpy(buf, &cl_cdkey[16], 16);
		buf[16] = '\0';
	} else {
		Com_Memcpy(buf, cl_cdkey, 16);
		buf[16] = '\0';
	}
#else
	*buf = '\0';
#endif
}


/*
====================
CLUI_SetCDKey
====================
*/
#ifndef STANDALONE
static void CLUI_SetCDKey(char *buf) {
	const char *gamedir;
	gamedir = Cvar_VariableString("fs_game");
	if(UI_usesUniqueCDKey() && gamedir[0] != '\0') {
		Com_Memcpy(&cl_cdkey[16], buf, 16);
		cl_cdkey[32] = '\0';
		// set the flag so the fle will be written at the next opportunity
		cvar_modifiedFlags |= CVAR_ARCHIVE;
	} else {
		Com_Memcpy(cl_cdkey, buf, 16);
		// set the flag so the fle will be written at the next opportunity
		cvar_modifiedFlags |= CVAR_ARCHIVE;
	}
}
#endif


/*
====================
GetConfigString
====================
*/
static int GetConfigString(int index, char *buf, int size)
{
	int		offset;

	if(index < 0 || index >= MAX_CONFIGSTRINGS)
		return qfalse;

	offset = cl.gameState.stringOffsets[index];
	if(!offset) {
		if(size) {
			buf[0] = 0;
		}
		return qfalse;
	}

	Q_strncpyz(buf, cl.gameState.stringData+offset, size);

	return qtrue;
}


/*
====================
FloatAsInt
====================
*/
static int FloatAsInt(float f) {
	floatint_t fi;
	fi.f = f;
	return fi.i;
}


/*
====================
VM_ArgPtr
====================
*/
static void *VM_ArgPtr(intptr_t intValue) {

	if(!intValue || uivm == NULL)
	  return NULL;

	if(uivm->entryPoint)
		return(void *)(intValue);
	else
		return(void *)(uivm->dataBase +(intValue & uivm->dataMask));
}


static qboolean UI_GetValue(char* value, int valueSize, const char* key) {

	if(!Q_stricmp(key, "trap_R_AddRefEntityToScene2")) {
		Com_sprintf(value, valueSize, "%i", UI_R_ADDREFENTITYTOSCENE2);
		return qtrue;
	}

	if(!Q_stricmp(key, "trap_R_AddLinearLightToScene_Q3E") && re.AddLinearLightToScene) {
		Com_sprintf(value, valueSize, "%i", UI_R_ADDLINEARLIGHTTOSCENE);
		return qtrue;
	}

	return qfalse;
}


/*
====================
CL_UISystemCalls

The ui module is making a system call
====================
*/
static intptr_t CL_UISystemCalls(intptr_t *args) {
	switch(args[0]) {
	case UI_ERROR:
		Com_Error(ERR_DROP, "%s",(const char*)VMA(1));
		return 0;

	case UI_PRINT:
		Com_Printf("%s",(const char*)VMA(1));
		return 0;

	case UI_MILLISECONDS:
		return Sys_Milliseconds();

	case UI_CVAR_REGISTER:
		Cvar_Register(VMA(1), VMA(2), VMA(3), args[4], uivm->privateFlag);
		return 0;

	case UI_CVAR_UPDATE:
		Cvar_Update(VMA(1), uivm->privateFlag);
		return 0;

	case UI_CVAR_SET:
		Cvar_SetSafe(VMA(1), VMA(2));
		return 0;

	case UI_CVAR_VARIABLEVALUE:
		return FloatAsInt(Cvar_VariableValue(VMA(1)));

	case UI_CVAR_VARIABLESTRINGBUFFER:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		Cvar_VariableStringBufferSafe(VMA(1), VMA(2), args[3], CVAR_PRIVATE);
		return 0;

	case UI_CVAR_SETVALUE:
		Cvar_SetValueSafe(VMA(1), VMF(2));
		return 0;

	case UI_CVAR_RESET:
		Cvar_Reset(VMA(1));
		return 0;

	case UI_CVAR_CREATE:
		Cvar_Register(NULL, VMA(1), VMA(2), args[3], uivm->privateFlag);
		return 0;

	case UI_CVAR_INFOSTRINGBUFFER:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		Cvar_InfoStringBuffer(args[1], VMA(2), args[3]);
		return 0;

	case UI_ARGC:
		return Cmd_Argc();

	case UI_ARGV:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		Cmd_ArgvBuffer(args[1], VMA(2), args[3]);
		return 0;

	case UI_CMD_EXECUTETEXT:
		if(args[1] == EXEC_NOW
		&&(!strncmp(VMA(2), "snd_restart", 11)
		|| !strncmp(VMA(2), "vid_restart", 11)
		|| !strncmp(VMA(2), "disconnect", 10)
		|| !strncmp(VMA(2), "quit", 5)))
		{
			Com_Printf(S_COLOR_YELLOW "turning EXEC_NOW '%.11s' into EXEC_INSERT\n",(const char*)VMA(2));
			args[1] = EXEC_INSERT;
		}
		Cbuf_ExecuteText(args[1], VMA(2));
		return 0;

	case UI_FS_FOPENFILE:
		return FS_VM_OpenFile(VMA(1), VMA(2), args[3], H_Q3UI);

	case UI_FS_READ:
		VM_CHECKBOUNDS(uivm, args[1], args[2]);
		FS_VM_ReadFile(VMA(1), args[2], args[3], H_Q3UI);
		return 0;

	case UI_FS_WRITE:
		VM_CHECKBOUNDS(uivm, args[1], args[2]);
		FS_VM_WriteFile(VMA(1), args[2], args[3], H_Q3UI);
		return 0;

	case UI_FS_FCLOSEFILE:
		FS_VM_CloseFile(args[1], H_Q3UI);
		return 0;

	case UI_FS_SEEK:
		return FS_VM_SeekFile(args[1], args[2], args[3], H_Q3UI);

	case UI_FS_GETFILELIST:
		VM_CHECKBOUNDS(uivm, args[3], args[4]);
		return FS_GetFileList(VMA(1), VMA(2), VMA(3), args[4]);

	case UI_R_REGISTERMODEL:
		return re.RegisterModel(VMA(1));

	case UI_R_REGISTERSKIN:
		return re.RegisterSkin(VMA(1));

	case UI_R_REGISTERSHADERNOMIP:
		return re.RegisterShaderNoMip(VMA(1));

	case UI_R_CLEARSCENE:
		re.ClearScene();
		return 0;

	case UI_R_ADDREFENTITYTOSCENE:
		re.AddRefEntityToScene(VMA(1), qfalse);
		return 0;

	case UI_R_ADDPOLYTOSCENE:
		re.AddPolyToScene(args[1], args[2], VMA(3), 1);
		return 0;

	case UI_R_ADDLIGHTTOSCENE:
		re.AddLightToScene(VMA(1), VMF(2), VMF(3), VMF(4), VMF(5));
		return 0;

	case UI_R_DRAWSCENE:
		re.DrawScene(VMA(1));
		return 0;

	case UI_R_SETCOLOR:
		re.SetColor(VMA(1));
		return 0;

	case UI_R_DRAWSTRETCHPIC:
		re.DrawStretchPic(VMF(1), VMF(2), VMF(3), VMF(4), VMF(5), VMF(6), VMF(7), VMF(8), args[9]);
		return 0;

	case UI_R_MODELBOUNDS:
		re.ModelBounds(args[1], VMA(2), VMA(3));
		return 0;

	case UI_UPDATESCREEN:
		SCR_UpdateScreen();
		return 0;

	case UI_CM_LERPTAG:
		re.LerpTag(VMA(1), args[2], args[3], args[4], VMF(5), VMA(6));
		return 0;

	case UI_S_REGISTERSOUND:
		return S_RegisterSound(VMA(1), args[2]);

	case UI_S_STARTLOCALSOUND:
		S_StartLocalSound(args[1], args[2]);
		return 0;

	case UI_KEY_KEYNUMTOSTRINGBUF:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		Key_KeynumToStringBuf(args[1], VMA(2), args[3]);
		return 0;

	case UI_KEY_GETBINDINGBUF:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		Key_GetBindingBuf(args[1], VMA(2), args[3]);
		return 0;

	case UI_KEY_SETBINDING:
		Key_SetBinding(args[1], VMA(2));
		return 0;

	case UI_KEY_ISDOWN:
		return Key_IsDown(args[1]);

	case UI_KEY_GETOVERSTRIKEMODE:
		return Key_GetOverstrikeMode();

	case UI_KEY_SETOVERSTRIKEMODE:
		Key_SetOverstrikeMode(args[1]);
		return 0;

	case UI_KEY_CLEARSTATES:
		Key_ClearStates();
		return 0;

	case UI_KEY_GETCATCHER:
		return Key_GetCatcher();

	case UI_KEY_SETCATCHER:
		// Don't allow the ui module to close the console
		Key_SetCatcher(args[1] |(Key_GetCatcher() & KEYCATCH_CONSOLE));
		return 0;

	case UI_GETCLIPBOARDDATA:
		VM_CHECKBOUNDS(uivm, args[1], args[2]);
		CL_GetClipboardData(VMA(1), args[2]);
		return 0;

	case UI_GETUSERSTATE:
		VM_CHECKBOUNDS(uivm, args[1], sizeof(uiUserState_t));
		GetUserState(VMA(1));
		return 0;

	case UI_GETGLCONFIG:
		VM_CHECKBOUNDS(uivm, args[1], sizeof(glconfig_t));
		CL_GetGlconfig(VMA(1));
		return 0;

	case UI_GETCONFIGSTRING:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		return GetConfigString(args[1], VMA(2), args[3]);

	case UI_LAN_LOADCACHEDHOSTS:
		LAN_LoadCachedHosts();
		return 0;

	case UI_LAN_SAVECACHEDHOSTS:
		LAN_SaveHostsToCache();
		return 0;

	case UI_LAN_ADDHOST:
		return LAN_AddHost(args[1], VMA(2), VMA(3));

	case UI_LAN_REMOVEHOST:
		LAN_RemoveHost(args[1], VMA(2));
		return 0;

	case UI_LAN_GETPINGQUEUECOUNT:
		return LAN_GetPingQueueCount();

	case UI_LAN_CLEARPING:
		LAN_ClearPing(args[1]);
		return 0;

	case UI_LAN_GETPING:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		LAN_GetPing(args[1], VMA(2), args[3], VMA(4));
		return 0;

	case UI_LAN_GETPINGINFO:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		LAN_GetPingInfo(args[1], VMA(2), args[3]);
		return 0;

	case UI_LAN_GETHOSTCOUNT:
		return LAN_GetHostCount(args[1]);

	case UI_LAN_GETHOSTADDRESSSTRING:
		VM_CHECKBOUNDS(uivm, args[3], args[4]);
		LAN_GetHostAddressString(args[1], args[2], VMA(3), args[4]);
		return 0;

	case UI_LAN_GETHOSTINFO:
		VM_CHECKBOUNDS(uivm, args[3], args[4]);
		LAN_GetHostInfo(args[1], args[2], VMA(3), args[4]);
		return 0;

	case UI_LAN_GETHOSTPING:
		return LAN_GetHostPing(args[1], args[2]);

	case UI_LAN_MARKHOSTVISIBLE:
		LAN_MarkHostVisible(args[1], args[2], args[3]);
		return 0;

	case UI_LAN_HOSTISVISIBLE:
		return LAN_HostIsVisible(args[1], args[2]);

	case UI_LAN_UPDATEVISIBLEPINGS:
		return LAN_UpdateVisiblePings(args[1]);

	case UI_LAN_RESETPINGS:
		LAN_ResetPings(args[1]);
		return 0;

	case UI_LAN_HOSTSTATUS:
		VM_CHECKBOUNDS(uivm, args[2], args[3]);
		return LAN_GetHostStatus(VMA(1), VMA(2), args[3]);

	case UI_LAN_COMPAREHOSTS:
		return LAN_CompareHosts(args[1], args[2], args[3], args[4], args[5]);

	case UI_MEMORY_REMAINING:
		return Hunk_MemoryRemaining();

	case UI_GET_CDKEY:
		VM_CHECKBOUNDS(uivm, args[1], args[2]);
		CLUI_GetCDKey(VMA(1), args[2]);
		return 0;

	case UI_SET_CDKEY:
#ifndef STANDALONE
		CLUI_SetCDKey(VMA(1));
#endif
		return 0;

	case UI_SET_PBCLSTATUS:
		return 0;

	case UI_R_REGISTERFONT:
		re.RegisterFont(VMA(1), args[2], VMA(3));
		return 0;

	// shared syscalls

	case TRAP_MEMSET:
		VM_CHECKBOUNDS(uivm, args[1], args[3]);
		Com_Memset(VMA(1), args[2], args[3]);
		return args[1];

	case TRAP_MEMCPY:
		VM_CHECKBOUNDS2(uivm, args[1], args[2], args[3]);
		Com_Memcpy(VMA(1), VMA(2), args[3]);
		return args[1];

	case TRAP_STRNCPY:
		VM_CHECKBOUNDS(uivm, args[1], args[3]);
		strncpy(VMA(1), VMA(2), args[3]);
		return args[1];

	case TRAP_SIN:
		return FloatAsInt(sin(VMF(1)));

	case TRAP_COS:
		return FloatAsInt(cos(VMF(1)));

	case TRAP_ATAN2:
		return FloatAsInt(atan2(VMF(1), VMF(2)));

	case TRAP_SQRT:
		return FloatAsInt(sqrt(VMF(1)));

	case UI_FLOOR:
		return FloatAsInt(floor(VMF(1)));

	case UI_CEIL:
		return FloatAsInt(ceil(VMF(1)));

	case UI_PC_ADD_GLOBAL_DEFINE:
		return botlib_export->PC_AddGlobalDefine(VMA(1));
	case UI_PC_LOAD_SOURCE:
		return botlib_export->PC_LoadSourceHandle(VMA(1));
	case UI_PC_FREE_SOURCE:
		return botlib_export->PC_FreeSourceHandle(args[1]);
	case UI_PC_READ_TOKEN:
		return botlib_export->PC_ReadTokenHandle(args[1], VMA(2));
	case UI_PC_SOURCE_FILE_AND_LINE:
		return botlib_export->PC_SourceFileAndLine(args[1], VMA(2), VMA(3));

	case UI_S_STOPBACKGROUNDTRACK:
		S_StopBackgroundTrack();
		return 0;
	case UI_S_STARTBACKGROUNDTRACK:
		S_StartBackgroundTrack(VMA(1), VMA(2));
		return 0;

	case UI_REAL_TIME:
		return Com_RealTime(VMA(1));

	case UI_CIN_PLAYCINEMATIC:
		Com_DPrintf("UI_CIN_PlayCinematic\n");
		return CIN_PlayCinematic(VMA(1), args[2], args[3], args[4], args[5], args[6]);

	case UI_CIN_STOPCINEMATIC:
		return CIN_StopCinematic(args[1]);

	case UI_CIN_RUNCINEMATIC:
		return CIN_RunCinematic(args[1]);

	case UI_CIN_DRAWCINEMATIC:
		CIN_DrawCinematic(args[1]);
		return 0;

	case UI_CIN_SETEXTENTS:
		CIN_SetExtents(args[1], args[2], args[3], args[4], args[5]);
		return 0;

	case UI_R_REMAP_SHADER:
		re.RemapShader(VMA(1), VMA(2), VMA(3));
		return 0;

	case UI_VERIFY_CDKEY:
		return Com_CDKeyValidate(VMA(1), VMA(2));

	// engine extensions
	case UI_R_ADDREFENTITYTOSCENE2:
		re.AddRefEntityToScene(VMA(1), qtrue);
		return 0;

	// engine extensions
	case UI_R_ADDLINEARLIGHTTOSCENE:
		re.AddLinearLightToScene(VMA(1), VMA(2), VMF(3), VMF(4), VMF(5), VMF(6));
		return 0;

	case UI_TRAP_GETVALUE:
		VM_CHECKBOUNDS(uivm, args[1], args[2]);
		return UI_GetValue(VMA(1), args[2], VMA(3));

	default:
		Com_Error(ERR_DROP, "Bad UI system trap: %ld",(long int) args[0]);

	}

	return 0;
}


/*
====================
UI_DllSyscall
====================
*/
static intptr_t QDECL UI_DllSyscall(intptr_t arg, ...) {
#if !id386 || defined __clang__
	intptr_t	args[10]; // max.count for UI
	va_list	ap;
	int i;

	args[0] = arg;
	va_start(ap, arg);
	for(i = 1; i < ARRAY_LEN(args); i++)
		args[ i ] = va_arg(ap, intptr_t);
	va_end(ap);

	return CL_UISystemCalls(args);
#else
	return CL_UISystemCalls(&arg);
#endif
}


/*
====================
CL_ShutdownUI
====================
*/
void CL_ShutdownUI(void) {
	Key_SetCatcher(Key_GetCatcher() & ~KEYCATCH_UI);
	cls.uiStarted = qfalse;
	if(!uivm) {
		return;
	}
	VM_Call(uivm, 0, UI_SHUTDOWN);
	VM_Free(uivm);
	uivm = NULL;
	FS_VM_CloseFiles(H_Q3UI);
}


/*
====================
CL_InitUI
====================
*/
#define UI_OLD_API_VERSION	4

void CL_InitUI(void) {
	int		v;
	vmInterpret_t		interpret;

	// disallow vl.collapse for UI elements
	re.VertexLighting(qfalse);

	// load the dll or bytecode
	interpret = Cvar_VariableIntegerValue("vm_ui");
	if(cl_connectedToPureHost)
	{
		// if sv_pure is set we only allow qvms to be loaded
		if(interpret != VMI_COMPILED && interpret != VMI_BYTECODE)
			interpret = VMI_COMPILED;
	}

	uivm = VM_Create(VM_UI, CL_UISystemCalls, UI_DllSyscall, interpret);
	if(!uivm) {
		if(cl_connectedToPureHost && CL_GameSwitch()) {
			// host-side modification may require and reference only single custom ui.qvm
			// so allow referencing everything until we download all files
			// new gamestate will be requested after downloads complete
			// which will correct filesystem permissions
			fs_reordered = qfalse;
			FS_PureHostSetLoadedPaks("", "");
			uivm = VM_Create(VM_UI, CL_UISystemCalls, UI_DllSyscall, interpret);
			if(!uivm) {
				Com_Error(ERR_DROP, "VM_Create on UI failed");
			}
		} else {
			Com_Error(ERR_DROP, "VM_Create on UI failed");
		}
	}

	// sanity check
	v = VM_Call(uivm, 0, UI_GETAPIVERSION);
	if(v == UI_OLD_API_VERSION) {
//		Com_Printf(S_COLOR_YELLOW "WARNING: loading old Quake III Arena User Interface version %d\n", v);
		// init for this gamestate
		VM_Call(uivm, 1, UI_INIT,(cls.state >= CA_AUTHORIZING && cls.state < CA_ACTIVE));
	}
	else if(v != UI_API_VERSION) {
		// Free uivm now, so UI_SHUTDOWN doesn't get called later.
		VM_Free(uivm);
		uivm = NULL;

		Com_Error(ERR_DROP, "User Interface is version %d, expected %d", v, UI_API_VERSION);
		cls.uiStarted = qfalse;
	}
	else {
		// init for this gamestate
		VM_Call(uivm, 1, UI_INIT,(cls.state >= CA_AUTHORIZING && cls.state < CA_ACTIVE));
	}
}


#ifndef STANDALONE
qboolean UI_usesUniqueCDKey(void) {
	if(uivm) {
		return(VM_Call(uivm, 0, UI_HASUNIQUECDKEY) != 0);
	} else {
		return qfalse;
	}
}
#endif


/*
====================
UI_GameCommand

See if the current console command is claimed by the ui
====================
*/
qboolean UI_GameCommand(void) {
	if(!uivm) {
		return qfalse;
	}

	return VM_Call(uivm, 1, UI_CONSOLE_COMMAND, cls.realtime);
}
