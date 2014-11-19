// LVCC - Lightweight Vehicle Color Changer
// by Eli Junior A.K.A. Zero or YetiMarrom

/*
 * ----------------------------------------------------------------------------
 * "THE I DONT CARE LICENSE" (Revision -1):
 * A brown yeti wrote this file.  As long as you retain this notice you
 * can do whatever you want with this, and anybody caught using this without
 * my permission will become a good friend of mine. Or not. I don't care.
 * Just have fun :)
 * ----------------------------------------------------------------------------
 */

#include <a_samp>

public OnFilterScriptInit(){
	print("\n--------------------------------------");
	print(" Lightweight Vehicle Color Changer V1.0");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit(){
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]){
	//Help command
	if (strcmp("/vcchelp", cmdtext, true, 10) == 0){
		SendClientMessage(playerid, 0xFFFFFF00,
			"Commands: /vcolor color1 color2, /vcolor color, /vpaint paintjob");
		return 1;
	}
	
	//Vehicle color command
	if (strcmp("/vcolor", cmdtext, true, 10) == 0){
	    if(IsPlayerInAnyVehicle(playerid)){
		    new color1, color2, tmp[24], index;

		    tmp = strtok(cmdtext, index);
		    if(!strlen(tmp))
				SendClientMessage(playerid, 0xF60000AA,
					"USAGE: /vcolor color OR /vcolor color1 color2");
			color1 = strval(tmp);

		    tmp = strtok(cmdtext, index);
		    if(!strlen(tmp)){
		        color2 = color1;
			}else{
			    color2 = strval(tmp);
		    }
		    
		    ChangeVehicleColor(GetPlayerVehicleID(playerid), color1, color2);
	    }else{
		    SendClientMessage(playerid, 0xF60000AA,
				"ERROR: You need to be on a vehicle");
	    }

		return 1;
	}
	
	//Vehicle paintjob command
	if (strcmp("/vpaintjob", cmdtext, true, 10) == 0){
	    if(IsPlayerInAnyVehicle(playerid)){
		    new paintjobid, tmp[24], index;

		    tmp = strtok(cmdtext, index);
		    if(!strlen(tmp))
				SendClientMessage(playerid, 0xF60000AA,
					"USAGE: /vpaint paintjob");
			paintjobid = strval(tmp);

            ChangeVehiclePaintjob(GetPlayerVehicleID(playerid), paintjobid);
	    }else{
		    SendClientMessage(playerid, 0xF60000AA,
				"ERROR: You need to be on a vehicle");
	    }

		return 1;
	}
	
	return 0;
}

stock strtok(const string[], &index)
{
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' '))
    {
        index++;
    }
    new offset = index;
    new result[20];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
    {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}
