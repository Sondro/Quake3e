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

/*****************************************************************************
 * name:		be_ea.c
 *
 * desc:		elementary actions
 *
 * $Archive: /MissionPack/code/botlib/be_ea.c $
 *
 *****************************************************************************/

#include "../co/q_shared.h"
#include "l_memory.h"
#include "l_script.h"
#include "l_precomp.h"
#include "l_struct.h"
#include "botlib.h"
#include "be_interface.h"
#include "be_ea.h"

#define MAX_USERMOVE				400
#define MAX_COMMANDARGUMENTS		10

bot_input_t *botinputs;

//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_Say( int user, const char *str )
{
	botimport.BotUserCommand( user, va( "say %s", str ) );
} //end of the function EA_Say
//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_SayTeam( int user, const char *str )
{
	botimport.BotUserCommand( user, va( "say_team %s", str ) );
} //end of the function EA_SayTeam
//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_Tell( int user, int userto, const char *str )
{
	botimport.BotUserCommand( user, va( "tell %d, %s", userto, str ) );
} //end of the function EA_SayTeam
//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_UseItem( int user, const char *it )
{
	botimport.BotUserCommand( user, va( "use %s", it ) );
} //end of the function EA_UseItem
//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_DropItem( int user, const char *it )
{
	botimport.BotUserCommand( user, va( "drop %s", it ) );
} //end of the function EA_DropItem
//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_UseInv( int user, const char *inv )
{
	botimport.BotUserCommand( user, va( "invuse %s", inv ) );
} //end of the function EA_UseInv
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_DropInv( int user, const char *inv )
{
	botimport.BotUserCommand( user, va( "invdrop %s", inv ) );
} //end of the function EA_DropInv
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Gesture(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_GESTURE;
} //end of the function EA_Gesture
//===========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//===========================================================================
void EA_Command( int user, const char *command )
{
	botimport.BotUserCommand( user, command );
} //end of the function EA_Command
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_SelectWeapon(int user, int weapon)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->weapon = weapon;
} //end of the function EA_SelectWeapon
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Attack(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_ATTACK;
} //end of the function EA_Attack
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Talk(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_TALK;
} //end of the function EA_Talk
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Use(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_USE;
} //end of the function EA_Use
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Respawn(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_RESPAWN;
} //end of the function EA_Respawn
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Jump(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	if(bi->actionflags & ACTION_JUMPEDLASTFRAME)
	{
		bi->actionflags &= ~ACTION_JUMP;
	} //end if
	else
	{
		bi->actionflags |= ACTION_JUMP;
	} //end if
} //end of the function EA_Jump
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_DelayedJump(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	if(bi->actionflags & ACTION_JUMPEDLASTFRAME)
	{
		bi->actionflags &= ~ACTION_DELAYEDJUMP;
	} //end if
	else
	{
		bi->actionflags |= ACTION_DELAYEDJUMP;
	} //end if
} //end of the function EA_DelayedJump
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Crouch(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_CROUCH;
} //end of the function EA_Crouch
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Walk(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_WALK;
} //end of the function EA_Walk
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Action(int user, int action)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= action;
} //end of function EA_Action
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_MoveUp(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_MOVEUP;
} //end of the function EA_MoveUp
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_MoveDown(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_MOVEDOWN;
} //end of the function EA_MoveDown
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_MoveForward(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_MOVEFORWARD;
} //end of the function EA_MoveForward
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_MoveBack(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_MOVEBACK;
} //end of the function EA_MoveBack
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_MoveLeft(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_MOVELEFT;
} //end of the function EA_MoveLeft
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_MoveRight(int user)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	bi->actionflags |= ACTION_MOVERIGHT;
} //end of the function EA_MoveRight
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Move(int user, vec3_t dir, float speed)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	VectorCopy(dir, bi->dir);
	//cap speed
	if(speed > MAX_USERMOVE) speed = MAX_USERMOVE;
	else if(speed < -MAX_USERMOVE) speed = -MAX_USERMOVE;
	bi->speed = speed;
} //end of the function EA_Move
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_View(int user, vec3_t viewangles)
{
	bot_input_t *bi;

	bi = &botinputs[user];

	VectorCopy(viewangles, bi->viewangles);
} //end of the function EA_View
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_EndRegular(int user, float thinktime)
{
} //end of the function EA_EndRegular
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_GetInput(int user, float thinktime, bot_input_t *input)
{
	bot_input_t *bi;

	bi = &botinputs[user];
	bi->thinktime = thinktime;
	Com_Memcpy(input, bi, sizeof(bot_input_t));
} //end of the function EA_GetInput
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_ResetInput(int user)
{
	bot_input_t *bi;
	int jumped;

	bi = &botinputs[user];

	bi->thinktime = 0;
	VectorClear(bi->dir);
	bi->speed = 0;
	jumped = bi->actionflags & ACTION_JUMP;
	bi->actionflags = 0;
	if(jumped) bi->actionflags |= ACTION_JUMPEDLASTFRAME;
} //end of the function EA_ResetInput
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
int EA_Setup(void)
{
	//initialize the bot inputs
	botinputs =(bot_input_t *) GetClearedHunkMemory(
									botlibglobals.maxusers * sizeof(bot_input_t));
	return BLERR_NOERROR;
} //end of the function EA_Setup
//===========================================================================
//
// Parameter:			-
// Returns:				-
// Changes Globals:		-
//===========================================================================
void EA_Shutdown(void)
{
	FreeMemory(botinputs);
	botinputs = NULL;
} //end of the function EA_Shutdown
