// LVCC - Lightweight Vehicle Color Changer
// by Eli Junior A.K.A. Zero or YetiMarrom

/*
 * ----------------------------------------------------------------------------
 * "THE I DONT CARE LICENSE" (Revision -1):
 * A brown yeti wrote this file.  As long as you retain this notice you
 * can do whatever you want with this, I don't care.
 * Just have fun :)
 * ----------------------------------------------------------------------------
 */

#define FILTERSCRIPT

//Colors
#define COLOR_BLACK 000
#define COLOR_WHITE 001

#define COLOR_DARKGREY 101
#define COLOR_GREY 011
#define COLOR_LIGHTGREY 032

#define COLOR_DARKGREEN 044
#define COLOR_GREEN 016
#define COLOR_LIGHTGREEN 086
#define COLOR_LIME 128

#define COLOR_LIGHTRED 003
#define COLOR_RED 017
#define COLOR_DARKRED 124
#define COLOR_PINK 126

#define COLOR_LIGHTBLUE 007
#define COLOR_BLUE 079
#define COLOR_DARKBLUE 125
#define COLOR_CYAN 002

#define COLOR_LIGHTYELLOW 006
#define COLOR_YELLOW 065
#define COLOR_DARKYELLOW 061

#define COLOR_BROWN 030
#define COLOR_LIGHTBROWN 119

#define COLOR_PURPLE 005
#define COLOR_DARKPURPLE 085

#define COLOR_ORANGE 158
#define COLOR_TEAL 093

#include <a_samp>
#include <zcmd>

public OnFilterScriptInit(){
	print("\n--------------------------------------");
	print(" Lightweight Vehicle Color Changer V1.0");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit(){
	return 1;
}

//Help cmd
CMD:vcchelp(playerid, params[]){
	SendClientMessage(playerid, 0xFFFFFF00, "Commands: /vcolor /vpaint");
	return 1;
}

//Vehicle color command
CMD:vcolor(playerid, params[]){
	//Warning if player isn't on a vehicle
    if(GetPlayerState(playerid) != 2)
		return SendClientMessage(playerid, 0xFF0000FF,
			"You need to be on a vehicle!");
			
    new color[2];
    if(sscanf(params, "iI(-1)", color[0], color[1])){
        return SendClientMessage(playerid, 0xFF0000FF, "USAGE: /vcolor [color1] <color2>");
    }
    
    //Color2 use the same color as color1 if color2 is empty
    if(color[1] == -1) color[1] = color[0];
    
    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, 0x00FF00FF, "Vehicle colors succefully changed!");
    ChangeVehicleColor(GetPlayerVehicleID(playerid), color[0], color[1]);
    
    return 1;
}

//Vehicle paintjob command
CMD:vpaint(playerid, params[]){
	//Warning if player isn't on a vehicle
    if(GetPlayerState(playerid) != 2)
		return SendClientMessage(playerid, 0xFF0000FF,
			"You need to be on a vehicle!");
			
	new paintjob[1];
	if(sscanf(params, "iI(-1)", paintjob[0])){
        return SendClientMessage(playerid, 0xFF0000FF, "USAGE: /vpaint [paintjob]");
    }
    
    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, 0x00FF00FF, "Vehicle paintjob succefully changed!");
    ChangeVehiclePaintjob(GetPlayerVehicleID(playerid), paintjob[0]);
    
	return 1;
}

int CompareColorText(text){

}
