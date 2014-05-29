//	@file Version: 1.0
//	@file Name: randomWeapon.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: Element 0 = Vehicle.

if(!X_Server) exitWith {};

private ["_car","_mags","_rnd","_weapon","_mag"];

//Grabs carname from array in execVM
_car = _this select 0;
_num = floor (random 3);
//Items
_car addWeaponCargoGlobal ([
	["Binocular",1],
	["ItemMap",0],
	["ACE_Earplugs",1],
	["NVgoggles",1],
	["ACE_GlassesBalaklava",1],
	["ACE_GlassesBalaklavaGray",1],
	["ACE_GlassesBlueSun",1],
	["ACE_SpareBarrel",1],
	["ACE_WireCutter",1],
	["ACE_ALICE_Backpack",1],
	["ACE_BackPack_ACR",1],
	["ACE_Backpack_CivAssault",1],
	["ACE_GlassesGreenSun",1],
	["ACE_GlassesTactical",1],
	["ACE_WireCutter",1],
	["ItemMap",0],
	["ItemGPS",1],
	["ACE_Coyote_Pack",1],
	["ACE_MugLite",1]
	] call BIS_fnc_selectRandom);
	
	
//Ammunition
_car addMagazineCargoGlobal ([

//medical
	["ACE_Knicklicht_B",_num],
	["ACE_Knicklicht_R",_num],
	["ACE_Knicklicht_W",_num],
	["ACE_Bandage",_num],
	["ACE_Medkit",1],
	["ACE_Morphine",_num],
	["ACE_Epinephrine",_num]
	] call BIS_fnc_selectRandom);


//Ammunition
_car addMagazineCargoGlobal ([
	
//ammunition
	["30Rnd_556x45_Stanag",_num],
	["30Rnd_556x45_StanagSD",_num],
	["ACE_30Rnd_556x45_S_G36",_num],
	["30Rnd_545x39_AK",_num],
	["30Rnd_762x39_AK47",_num],

//Explosives
	["ACE_Flashbang",_num],	
	["ACE_RDGM",_num],
	["PipeBomb",_num],
	["ACE_Flashbang",_num],
	["ACE_ANM14",_num],
	["ACE_BBETTY_M",_num],
	["ACE_TRIPFLARE_M",_num],
	["ACE_M86PDM",_num],
	["ACE_M7A3",_num],
	["ACE_M2SLAM_M",_num],
	["ACE_M4SLAM_M",_num],
	["ACE_M7A3",_num],
	["ACE_TRIPFLARE_M",_num],
	["SmokeShell",_num],
	["SmokeShellBlue",_num],
	["SmokeShellRed",_num],
	["ACE_TORCH_C",_num],
	["HandGrenade_West",_num],
	["ACE_1Rnd_HE_GP25P",_num],
	["ACE_SSWhite_GP25",_num],
	["ACE_1Rnd_HE_M203",_num],
	["BAF_L109A1_HE",_num],
	
//Different items
	["IRStrobe",_num],
	["ACE_Rope_M_120",_num],
	["IR_Strobe_Marker",_num],
	["ACE_Rope_M5",_num],
	["ACE_Rope_TOW_M_5",_num],
	["ACE_Battery_Rangefinder",1]
	] call BIS_fnc_selectRandom);



//Get Random Gun From randomWeapons Array.
_weapon = vehicleWeapons select (random (count vehicleWeapons - 1));
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;

//Add guns and magazines, note the Global at the end..
_car addMagazineCargoGlobal [_mag,1];
_car addMagazineCargoGlobal [_mag,(random 4)];
_car addWeaponCargoGlobal [_weapon,1];