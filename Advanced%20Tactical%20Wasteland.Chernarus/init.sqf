//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Description: The main init.
//	@file Args:

if (isnil "RE") then {[] execVM "\ca\Modules\MP\data\scripts\MPframework.sqf"};

StartProgress = false;
enableSaving[false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
hitStateVar = false;
versionName = "v2.9";

if(isServer) then { X_Server = true;};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};

if(isServer) then {

// ACE Modules
	ace_sys_wounds_enabled = true;							publicVariable "ace_sys_wounds_enabled";
	ace_sys_wounds_noai = false;							publicVariable "ace_sys_wounds_noai";
	ace_sys_wounds_leftdam = 0.5;							publicVariable "ace_sys_wounds_leftdam";
	ace_sys_wounds_all_medics = true;						publicVariable "ace_sys_wounds_all_medics";
	ace_sys_wounds_no_rpunish = true;						publicVariable "ace_sys_wounds_no_rpunish";
	ace_sys_wounds_auto_assist_any = true;					publicVariable "ace_sys_wounds_auto_assist_any";
	ace_sys_wounds_ai_movement_bloodloss = true;			publicVariable "ace_sys_wounds_ai_movement_bloodloss";
	ace_sys_wounds_player_movement_bloodloss = true;		publicVariable "ace_sys_wounds_player_movement_bloodloss";
	ace_sys_wounds_auto_assist = true;						publicVariable "ace_sys_wounds_auto_assist";
	
	ace_sys_aitalk_radio_enabled = false;					publicVariable "ace_sys_aitalk_radio_enabled";
};



//init Wasteland Core
[] execVM "config.sqf";
[] execVM "briefing.sqf";

if(X_Client) then {
	waitUntil {player == player};

	//Wipe Group.
	if(count units group player > 1) then
	{  
		diag_log "Player Group Wiped";
		[player] join grpNull;    
	};

	[] execVM "client\init.sqf";
};

if(X_Server) then {
   diag_log format ["############################# %1 #############################", missionName];
	#ifdef __DEBUG__
	diag_log format ["T%1,DT%2,F%3", time, diag_tickTime, diag_frameno];
	#endif
    diag_log format["WASTELAND SERVER - Initializing Server"];
	[] execVM "server\init.sqf";
	
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "BTK\Cargo Drop\Start.sqf";
[] execVM "BTK\Gasmask\Start.sqf";
[] execVM "EF\engiaddactions.sqf";
[] execVM "EF\MinesweepC.sqf";