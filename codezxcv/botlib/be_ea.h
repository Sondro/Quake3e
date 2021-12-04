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
//

/*****************************************************************************
 * name:		be_ea.h
 *
 * desc:		elementary actions
 *
 * $Archive: /source/code/botlib/be_ea.h $
 *
 *****************************************************************************/

//UserCommand elementary actions
void EA_Say(int user, const char *str);
void EA_SayTeam(int user, const char *str);
void EA_Command(int user, const char *command );

void EA_Action(int user, int action);
void EA_Crouch(int user);
void EA_Walk(int user);
void EA_MoveUp(int user);
void EA_MoveDown(int user);
void EA_MoveForward(int user);
void EA_MoveBack(int user);
void EA_MoveLeft(int user);
void EA_MoveRight(int user);
void EA_Attack(int user);
void EA_Respawn(int user);
void EA_Talk(int user);
void EA_Gesture(int user);
void EA_Use(int user);

//regular elementary actions
void EA_SelectWeapon(int user, int weapon);
void EA_Jump(int user);
void EA_DelayedJump(int user);
void EA_Move(int user, vec3_t dir, float speed);
void EA_View(int user, vec3_t viewangles);

//send regular input to the host
void EA_EndRegular(int user, float thinktime);
void EA_GetInput(int user, float thinktime, bot_input_t *input);
void EA_ResetInput(int user);
//setup and shutdown routines
int EA_Setup(void);
void EA_Shutdown(void);
