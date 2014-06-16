_target = _this select 0;
_orig = _this select 1;
_effrange = _this select 2;
_falloff = _this select 3;

_ox = (getPos _orig) select 0;
_oy = (getPos _orig) select 1;
_oz = (getPos _orig) select 2;
_ozasl = (getPosASL _orig) select 2;


nul = [_target, _ox, _oy, _oz, _ozasl, _effrange, _falloff] execVM "ZSU_Shrapnel\fireshrap.sqf"; 