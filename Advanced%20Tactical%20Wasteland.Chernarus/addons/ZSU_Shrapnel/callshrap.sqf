/*
//Called by
// nul = [Shrapnel start point (Array or (getPos OBJECT) ), Concentration (bits per person), 99.9% Lethal range (prior to large dispersion), Maximum range (targets outside this range will never get shrapnel fired at them), Rate of falloff after lethal range (1 is linear, 3 is normal - drops off rapidly after that range, 5 is extreme - drops off very rapidly after that range)] execVM "ZSU_Shrapnel\callshrap.sqf"
//
//
*/


_destroypos = _this select 0; //Position for shrapnel to originate from
_conc = _this select 5; //Concentration of shrapnel
_effrange = _this select 3; //Effective range of the shrapnel
_maxrange = _this select 4; //Max range of shrapnel
_falloff = _this select 4; //Rate shrapnel falls off 1 - linear, 3 standard, 5 - big drop

if (_falloff < 1) then {_falloff = 1;};
if (_falloff > 5) then {_falloff = 5;};

_temp = "HeliHEmpty" createVehicle [0,0,0];
_temp setPos _destroypos;

_listnear = _destroypos nearEntities _maxrange; //160

{
for [{_i = 0}, {_i < (_conc)}, {_i = _i + 1}] do{
	nul = [_x, _temp, _effrange, _falloff] execVM "ZSU_Shrapnel\shrapfmobj.sqf";
	}
}foreach _listnear;