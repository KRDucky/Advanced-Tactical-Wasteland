//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, {RMSAG] KRDucky
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
if (isServer) then {
	"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};
};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

staticHeliWrecks = [
	"UH1Wreck",
    "UH1Wreck",
    "Mi8Wreck",
    "Mi8Wreck",
    "C130J_wreck_EP1",
    "UH60_wreck_EP1",
    "UH60_wreck_EP1"];
	
//Civilian Vehicle List - Random Spawns
civilianVehicles = ["car_hatchback",
					"car_sedan",
					"datsun1_civil_2_covered",
					"SkodaGreen",
					"Lada2",
					"Lada1",
					"ACE_Truck5tRepair",
					"ACE_Truck5tRepair_Base",
					"ACE_Truck5tReammo",
					"ACE_Truck5tReammo_Base",
					"ACE_Truck5tRefuel",
					"ACE_Truck5tRefuel_Base",
					"ACE_UralReammo_TK_EP1",
					"ACE_UralRefuel_TK_EP1",
					"ACE_M113A3_Ambul",
					"SkodaBlue",
					"Kamaz",
					"ACE_UralRepair_TK_EP1",
					"ACE_V3S_Reammo_TK_GUE_EP1",
					"ACE_V3S_Refuel_TK_GUE_EP1",
					"ACE_V3S_Repair_TK_GUE_EP1",
					"datsun1_civil_1_open",
					"hilux1_civil_1_open",
					"ACE_Ural_RU",
					"ACE_UralOpen_RU",
					"KamazReammo",
					"KamazRefuel",
					"KamazRepair",
					"Old_bike_TK_CIV_EP1",
					"hilux1_civil_3_open_EP1",
					"Volha_2_TK_CIV_EP1",
					"LandRover_TK_CIV_EP1",
					"Lada2_TK_CIV_EP1",
					"V3S_Civ",
					"UralCivil",
					"M1030",
					"VWGolf",
					"MMT_Civ",
					"Ikarus_TK_CIV_EP1",
					"Lada1_TK_CIV_EP1",
					"Old_moto_TK_Civ_EP1",
					"S1203_TK_CIV_EP1",
					"VolhaLimo_TK_CIV_EP1",
					"UAZ_Unarmed_TK_CIV_EP1",
					"BAF_Offroad_W",
					"S1203_ambulance_EP1"];

//Military Vehicle List - Random Spawns
militaryVehicles = ["UAZ_CDF",
					"SUV_PMC",
					"MTVR",
					"ACE_UralOpen_RU",
					"ACE_Ural_RU",
					"ACE_M113A3_Ambul",
					"UAZ_RU",
					"ATV_US_EP1",
					"BAF_Offroad_W",
					"HMMWV",
					"BTR40_TK_GUE_EP1",
					"HMMWV_DES_EP1",
					"HMMWV_Ambulance"];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = ["ArmoredSUV_PMC",
							"Pickup_PK_GUE",
							"BRDM2_HQ_TK_GUE_EP1",
							"Offroad_DSHKM_TK_GUE_EP1",
							"Offroad_SPG9_TK_GUE_EP1",
							"ACE_Offroad_SPG9_INS",
							"Pickup_PK_TK_GUE_EP1",
							"UAZ_AGS30_TK_EP1",
							"ACE_UAZ_SPG9_CDF",
					        "ACE_Ural_ZU23_RU",
							"ACE_UAZ_MG_RU",
				        	"ACE_Truck5tMGOpen",
							"Offroad_DSHKM_INS",
							"BRDM2_HQ_Gue",
							"UAZ_MG_TK_EP1",
							"LandRover_MG_TK_INS_EP1",
							"HMMWV_M2",
							"HMMWV_Armored",
							"HMMWV_MK19",
							"HMMWV_TOW",
							"BTR40_MG_TK_GUE_EP1",
							"GAZ_Vodnik"];

//Item Config
pickupList = ["Satelit",
				"EvMoney",
				"Suitcase",
				"Fuel_can"];

//Object List - Random Spawns.
objectList = ["Land_Barrel_water",
				"Land_prebehlavka",
				"Land_leseni2x",
                "Fort_Crate_wood",
                "Land_CamoNet_NATO",
				"Land_Barrel_water",
				"Land_stand_small_EP1",
                "Land_stand_small_EP1",
				"Base_WarfareBBarrier10xTall",
				"Base_WarfareBBarrier10x",
				"Base_WarfareBBarrier5x",
                "Base_WarfareBBarrier10xTall",
                "Base_WarfareBBarrier10x",
                "Base_WarfareBBarrier5x",
				"Land_Misc_deerstand",
				"Fort_Barricade",
				"Concrete_Wall_EP1",
                "Concrete_Wall_EP1",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_round",
                "Land_fort_bagfence_corner",
                "Land_BagFenceLong",
                "Land_BagFenceLong",
                "Land_fort_artillery_nest",
				"Land_fortified_nest_small_EP1",
				"Land_Misc_deerstand",
                "Land_fort_rampart",
                "Land_fort_rampart_EP1",
				"Land_HBarrier_large",
                "Land_HBarrier_large",
				"Land_Misc_Scaffolding",
				"Land_Fort_Watchtower_EP1",
                "Land_Fort_Watchtower",
				"Land_fortified_nest_big",
				"RampConcrete",
				"WarfareBDepot",
				"WarfareBCamp",
                "Hedgehog",
                "Land_ConcreteRamp",
                "Land_CncBlock_Stripes",
                "Land_Campfire_burning",
                "Land_GuardShed",
                "Land_tent_east",
				"Land_ConcreteBlock"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["M2StaticMG_US_EP1",
				"DSHKM_TK_INS_EP1",
                "BAF_L2A1_Tripod_D",
				"MK19_TriPod",
				"KORD_high"];

//Object List - Random Helis.
staticHeliList = ["UH1H_TK_GUE_EP1",
				"Mi17_Civilian",
                "MV22",
				"ACE_AH6J_DAGR_FLIR",
                "CH_47F_EP1",
                "MH6J_EP1",
				"AH6J_EP1",
				"AH6X_EP1",
				"BAF_Merlin_HC3_D",
				"Ka137_MG_PMC",
                "UH60M_MEV_EP1",
                "AH6X_EP1"];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = ["ACE_M1014_Eotech",
				"ACE_M3A1",
				"ACE_MP7",
				"ACE_SKS",
				"ACE_UMP45_AIM",
                "ACE_SPAS12",
				"ACE_MP5A4",
				"ACE_G36A1_AG36_UP_F",
				"ACE_G36A2_D_F",
				"ACE_G36A2_Bipod_D",
				"ACE_MP5A5",
				"ACE_G3A3_RSAS_F",
				"ACE_UMP45_AIM_SD",
				"ACE_AKMS_SD",
				"ACE_MP5SD",
				"AA12_PMC",
				"ACE_M14_ACOG",
				"ACE_AK74M_SD",
				"ACE_M249_AIM",
				"Sa58V_CCO_EP1",
				"ACE_HK416_D10_AIM",
				"ACE_oc14sdsp",
				"ACE_AK74M_SD_1P78",
				"Sa58P_EP1",
				"AK_47_M",
				"AK_47_S",
				"AK_74",
				"bizon",
				"bizon_silenced",
				"FN_FAL",
				"G36a",
				"LeeEnfield",
				"M1014",
				"M16A2",
				"m16a4",
				"M4A1_Aim",
				"M4A3_CCO_EP1",
				"m8_carbine",
				"MP5A5",
				"Sa58V_EP1",
				"Sa58V_CCO_EP1",
				"Saiga12K",
				"AKS_74_U",
				"ACE_AK74M_SD_1P78_F",
				"G36C_camo",
				"SCAR_L_CQC",
				"ACE_Rucksack_MOLLE_WMARPAT",
				"ACE_GMV_M249_1",
				"ACE_Rucksack_MOLLE_Wood",
				"ACE_M136_CSRS",
				"ACE_M4",
				"ACE_m16a2_scope",
				"ACE_SSVZ",
				"ACE_M249_PIP_ACOG",
				"ACE_HK416_D10_COMPM3",
				"ACE_KAC_PDW",
				"ACE_M27_IAR_ACOG",
				"ACE_SCAR_H_STD_Spect",
				"ACE_SOC_M4A1_Aim",
				"ACE_SOC_M4A1_AIM_SD",
				"ACE_SOC_M4A1_EOT_SD",
				"ACE_M4_ACOG_F",
				"ACE_SOC_M4A1_EOT_SD_F",
				"ACE_SOC_M4A1_Eotech_4x_F",
				"ACE_SOC_M4A1_SD_9",
				"ACE_SOC_M4A1_SHORTDOT_SD",
				"ACE_M4_Aim_F",
				"ACE_M4_Eotech_F",
				"ACE_M4A1_ACOG_F",
				"ACE_RPG22",
				"ACE_M4A1_Aim_SD_F",
				"ACE_M4A1_EOT_SD",
				"ACE_M4A1_EOT_SD_F",
				"ACE_M4A1_Aim_F",
				"ACE_HK416_D10",
				"ACE_M4A1_ACOG_SD_F",
				"ACE_HK417_micro",
				"ACE_M16A4_EOT",
				"ACE_SVD_Bipod",
				"ACE_HK416_D10_Holo",
				"ACE_HK416_D10_COMPM3_SD",
				"ACE_HK416_D14_ACOG_PVS14",
                "ACE_G3A3",
				"ACE_MP7_RSAS",
				"ACE_AK105",
				"ACE_M4",
				"ACE_AEK_971",
				"ACE_USP",
				"ACE_P226",
				"ACE_GlassesGasMask2_US",
				"ACE_RPG7V_PGO7",
				"SCAR_H_LNG_Sniper",
                "ACE_M60"];
                
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false],
            ["Mission_20",false],
            ["Mission_21",false],
            ["Mission_22",false],
            ["Mission_23",false],
            ["Mission_24",false],
            ["Mission_25",false],
            ["Mission_26",false],
            ["Mission_27",false],
            ["Mission_28",false],
            ["Mission_29",false],
            ["Mission_30",false],
            ["Mission_31",false],
            ["Mission_32",false],
            ["Mission_33",false],
            ["Mission_34",false],
            ["Mission_35",false],
            ["Mission_36",false],
            ["Mission_37",false],
            ["Mission_38",false],
            ["Mission_39",false],
            ["Mission_40",false],
            ["Mission_41",false],
            ["Mission_42",false],
            ["Mission_43",false],
            ["Mission_44",false],
            ["Mission_45",false],
            ["Mission_46",false],
            ["Mission_47",false],
            ["Mission_48",false],
            ["Mission_49",false],
            ["Mission_50",false]
];