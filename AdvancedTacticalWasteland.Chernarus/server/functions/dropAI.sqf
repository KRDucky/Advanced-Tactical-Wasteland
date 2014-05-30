private [
	"_dropItems",
	"_boxTypes",
	"_CIV_ARRAY",
	"_name",
	"_pos",
	"_grpDead",
	"_hint",
	"_leader",
	"_group",
	"_chute",
	"_unitsAlive",
	"_weapon",
	"_mag"
];


_name = _this select 0;
_pos = _this select 1;
_grpDead = true;
_CIV_ARRAY = [
		"CIV_EuroMan01_EP1",
		"CIV_EuroMan02_EP1",
		"Citizen2_EP1",
		"Citizen3_EP1",
		"Dr_Hladik_EP1",
		"Haris_Press_EP1",
		"Pilot_EP1"
	];
_boxTypes = [
		"basicUS1",
		"basicUS2",
		"specialUS1",
		"specialUS2",
		"basicRU1",
		"basicRU2",
		"specialRU1",
		"specialX1",
		"launcherUS",
		"launcherRU",
		"basicGUE",
		"basicBAF",
		"basicUN",
		"basicPMC",
		"basicGER",
		"basicTK"
	];
_dropItems = [
		"EvMoney",
		"CZ_VestPouch_EP1",
		"Suitcase",
		"box",
		"Barrels"
	];

while {true} do {
	if(_grpDead) then {
		_hint = parseText format ["<t align='center' color='#e76e24' shadow='2' size='1.75'>Mercenaries</t><br/><t align='center' color='#e76e24'>------------------------------</t><br/><t align='center' color='#FFFFFF'> A group of mercenaries have been spotted airdropping into <t color='#e76e24'>%1!</t><br/><t align='center' color='#FFFFFF'>Proceed with caution!</t>", _name];
		[nil,nil,rHINT,_hint] call RE;
		sleep 1;
		
		_grpDead = false;
		_group = createGroup Civilian;
        
		_leader = _group createunit ["Priest", [-20000,-20000, 0], [], 0.5, "Form"];
		_leader addMagazine "PG7V";
		_leader addMagazine "PG7V";
		_leader addWeapon "RPG7V";
		
		for "_i" from 0 to (3+(random 7)-1) do {
			_group createunit [_CIV_ARRAY select (random (count _CIV_ARRAY - 1)), [-20000,-20000, 0], [], 0.5, "Form"];
		};
		_leader = leader _group;
        
		{
			_weapon = vehicleWeapons select (random (count vehicleWeapons - 1));
			_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
			for "_j" from 0 to (2+(random 3)-1) do {_x addMagazine _mag};
			_x addWeapon _weapon;
			_x setPos [(_pos select 0) + (random 10) - (random 20), (_pos select 1) + (random 10) - (random 20), 100];
			_x setvelocity [0,0,0];
			[_x, 100] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
			sleep 3;
		}foreach units _group;
		
		_group enableAttack true;
		[_group, _pos] call defendArea;
	};
    
	_unitsAlive = ({alive _x} count units _group);
	if(_unitsAlive == 0) then {
		_grpDead = true;
		
		
		_hint = parseText format ["<t align='center' color='#e76e24' shadow='2' size='1.75'>Mercenaries</t><br/><t align='center' color='#e76e24'>------------------------------</t><br/><t align='center' color='#FFFFFF'> The mercenaries have lost control of <t color='#e76e24'>%1!</t></t>", _name];
		[nil,nil,rHINT,_hint] call RE;
		
		sleep ((random 1800) + 1800);
	};
	sleep 60;
};