// ====================================================================================
// Scripts made by Phantactical Mod Development Team for tge Prevailing Winds Addon
// We can be found here: www.phantactical.com
// Last Edited: 4:19 PM 28/1/2014
// No derivative works allowed without permission. Just ask, we will see your request.
// ====================================================================================
//This is the root file for the mod, everything is started from here.
//if (isServer || isDedicated) then {
	missionVehiclesAndObjects = allMissionObjects "Air";
	numberOfObjects = count missionVehiclesAndObjects;
	xPartx = 0;
	xPartNewx = 0;
	while {xPartx < numberOfObjects} do {
		sleep .01;
		xVehx = (missionVehiclesAndObjects select xPartx);
			//Blackhawk
			if (((typeOf xVehx) == "MH60S") or ((typeOf xVehx) == "UH60M_EP1") or ((typeOf xVehx) == "ACE_UH60M")) then {
				[xVehx,80]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Merlin
			if ((typeOf xVehx) == "BAF_Merlin_HC3_D") then {
				[xVehx,100]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//UH-1H
			if (((typeOf xVehx) == "UH1H_TK_EP1") or ((typeOf xVehx) == "UH1H_TK_GUE_EP1")) then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Cobra
			if (((typeOf xVehx) == "ACE_AH1W_TOW_W") or ((typeOf xVehx) == "ACE_AH1W_TOW_TOW_W") or ((typeOf xVehx) == "ACE_AH1W_AGM_W") or ((typeOf xVehx) == "ACE_AH1Z_AGM_AGM_W") or ((typeOf xVehx) == "AH1Z")) then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Cobra (Desert)
			if (((typeOf xVehx) == "ACE_AH1W_TOW_D") or ((typeOf xVehx) == "ACE_AH1W_TOW_TOW_D") or ((typeOf xVehx) == "ACE_AH1W_AGM_D") or ((typeOf xVehx) == "ACE_AH1Z_AGM_AGM_D") or ((typeOf xVehx) == "ACE_AH1Z_AGM_D")) then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Apache
			if (((typeOf xVehx) == "AH64D_EP1") or ((typeOf xVehx) == "BAF_Apache_AH1_D")) then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Littlebird
			if (((typeOf xVehx) == "ACE_AH6J_DAGR_FLIR") or ((typeOf xVehx) == "AH6J_EP1") or ((typeOf xVehx) == "AH6X_EP1") or ((typeOf xVehx) == "MH6J_EP1")) then {
				[xVehx,65]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//AS-350 Skwerl
			if (((typeOf xVehx) == "ibr_as350") or ((typeOf xVehx) == "ibr_as350_armed") or ((typeOf xVehx) == "ibr_as350_civ") or ((typeOf xVehx) == "ibr_as350_jungle") or ((typeOf xVehx) == "ibr_as350_specops")) then {
				[xVehx,60]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Chinook
			if (((typeOf xVehx) == "CH_47F_EP1") or ((typeOf xVehx) == "CH_47F_BAF")) then {
				[xVehx,95]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//KA 50, 60, 52 etc.
			if (((typeOf xVehx) == "ACE_Ka50") or ((typeOf xVehx) == "Ka52Black") or ((typeOf xVehx) == "Ka52") or ((typeOf xVehx) == "Ka60_PMC") or ((typeOf xVehx) == "Ka60_GL_PMC")) then {
				[xVehx,70]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//MI-8 and MI-17
			if (((typeOf xVehx) == "Mi171Sh_rockets_CZ_EP1") or ((typeOf xVehx) == "Mi171Sh_CZ_EP1") or ((typeOf xVehx) == "Mi17_CDF") or ((typeOf xVehx) == "Mi17_UN_CDF_EP1") or ((typeOf xVehx) == "Mi17_Ru") or ((typeOf xVehx) == "Mi17_Ins") or ((typeOf xVehx) == "ACE_Mi17_RU") or ((typeOf xVehx) == "Mi17_TK_EP1") or ((typeOf xVehx) == "Mi17_rockets_RU") or ((typeOf xVehx) == "Mi17_Civilian")) then {
				[xVehx,90]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//MI-24 Hind
			if (((typeOf xVehx) == "Mi24_D") or ((typeOf xVehx) == "ACE_Mi24_D_INS") or ((typeOf xVehx) == "Mi24_D_TK_EP1") or ((typeOf xVehx) == "Mi24_P") or ((typeOf xVehx) == "ACE_Mi24_V_FAB250_CDF") or ((typeOf xVehx) == "ACE_Mi24_V_FAB250_RU") or ((typeOf xVehx) == "ACE_Mi24_V_UPK23_CDF") or ((typeOf xVehx) == "ACE_Mi24_V_UPK23_RU") or ((typeOf xVehx) == "ACE_Mi24_V_CDF") or ((typeOf xVehx) == "Mi24_V")) then {
				[xVehx,85]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//SA-342 Gazelle
			if (((typeOf xVehx) == "ibr_gazelle") or ((typeOf xVehx) == "ibr_gazelle_armed")) then {
				[xVehx,62]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//UH-1Y
			if ((typeOf xVehx) == "UH1Y") then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Wildcat
			if ((typeOf xVehx) == "AW159_Lynx_BAF") then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//Z9A and Z9G
			if (((typeOf xVehx) == "oh2_z9a") or ((typeOf xVehx) == "oh2_z9w")) then {
				[xVehx,75]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
			//KA 137
			if (((typeOf xVehx) == "Ka137_PMC") or ((typeOf xVehx) == "Ka137_MG_PMC")) then {
				[xVehx,40]execVM "addons\pmt_prevailingWinds\theWind.sqf";
			};
		xPartx = xPartx + 1;
	};
//};
