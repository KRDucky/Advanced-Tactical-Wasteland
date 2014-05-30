BIS_fnc_setPitchBank = compile preprocessFileLineNumbers "ca\modules\functions\objects\fn_setPitchBank.sqf";
Sandbag = compile (preprocessFileLineNumbers "EF\main\Sandbag.sqf");
FieldH = compile (preprocessFileLineNumbers "EF\main\FieldH.sqf");
Wall = compile (preprocessFileLineNumbers "EF\main\Wall.sqf");
CW = compile (preprocessFileLineNumbers "EF\main\CW.sqf");
TankT = compile (preprocessFileLineNumbers "EF\main\TankT.sqf");
SearchL = compile (preprocessFileLineNumbers "EF\main\SearchL.sqf");
SBunker = compile (preprocessFileLineNumbers "EF\main\SBunker.sqf");
Repair = compile (preprocessFileLineNumbers "EF\main\Repair.sqf");
Remove = compile (preprocessFileLineNumbers "EF\main\Remove.sqf");
Flip = compile (preprocessFileLineNumbers "EF\main\Flip.sqf");
MGNest = compile (preprocessFileLineNumbers "EF\main\MGNest.sqf");
AA = compile (preprocessFileLineNumbers "EF\main\AA.sqf");
Barracks = compile (preprocessFileLineNumbers "EF\main\Barracks.sqf");
Camo = compile (preprocessFileLineNumbers "EF\main\Camo.sqf");
LBunker = compile (preprocessFileLineNumbers "EF\main\LBunker.sqf");
RoadB = compile (preprocessFileLineNumbers "EF\main\RoadB.sqf");
Tent = compile (preprocessFileLineNumbers "EF\main\Tent.sqf");
Tower = compile (preprocessFileLineNumbers "EF\main\Tower.sqf");

if ((player isKindOf "S_US_Soldier_Engineer_EP1") OR (player isKindOf "US_Soldier_Engineer_EP1") OR (player isKindOf "BAF_Soldier_EN_MTP") OR (player isKindOf "ACE_USMC_SoldierS_Engineer_D") OR (player isKindOf "USMC_SoldierS_Engineer")) then {
	EngiMenu = player addaction [("<t color=""#0101DF"">" + ("Engineer Menu") +"</t>"),"EF\EngiMenu.sqf", "", 1, false, false, "", "_target == _this"];
	player addMPEventHandler ["MPRespawn", {_this execVM "EF\onPlayerRespawn.sqf"}];
};