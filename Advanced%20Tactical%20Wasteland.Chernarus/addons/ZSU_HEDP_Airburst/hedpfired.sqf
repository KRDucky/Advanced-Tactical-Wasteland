_unitfired = _this select 0;
_ammo = _this select 4;
_projectile = _this select 6;

_valid = ["R_SMAW_HEDP", "R_MEEWS_HEDP", "R_OG7_AT", "S60_300Rnd_Static_57mm_AP", "S60_300Rnd_Static_57mm_HE", "1200_zpu4_14_5mm", "pam_60Rnd_Static_20mm_AP", "pam_60Rnd_Static_20mm_HE", "flak_Static_20mm_AP", "Bof_3Rnd_Static_37mm_AP", "Bof_3Rnd_Static_37mm_HE", "Bof_8Rnd_Static_37mm_AP", "Bof_8Rnd_Static_37mm_HE", "m80_Static_20mm_AP", "m80_Static_20mm_AP"];

_boomdist = _unitfired getVariable "heimpact";

if (_ammo in _valid) then {
_fireloc = (getPos _unitfired);
_dist = 0;
while {(_dist < _boomdist)} do{
	_dist = ((getPos _projectile) distance _fireloc);
	sleep 0.01;
};

if (!(isNull _projectile)) then {
	_destroyASL = (getPosASL _projectile) select 2;
	_destroypos = getPos _projectile;
	_destroyx = _destroypos select 0;
	_destroyy = _destroypos select 1;
	_destroyz = _destroypos select 2;
	_boomht = _destroypos select 2;
	sleep 0.01;
	deleteVehicle _projectile;
	nul = [_destroypos, 5, 60, 160, 3] execVM "ZSU_Shrapnel\callshrap.sqf";
	_expl = "HelicopterExploSmall" createVehicle (_destroypos);
	};
}