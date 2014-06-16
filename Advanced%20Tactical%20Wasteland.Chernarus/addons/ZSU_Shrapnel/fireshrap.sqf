// called by nul = [TARGET(OBJECT), Origin of shrapnelXCOORD(INT), Origin of shrapnelYCOORD (INT), Origin of shrapnelZCOORD AGL (INT), 
// Origin of shrapnelZCOORD ASL (INT), LUCK (INT - deviation from target in m)] execVM "fireshrap.sqf"; 

_target = _this select 0;
_boomx = _this select 1;
_boomy = _this select 2;
_boomz = (_this select 3);//+0.5;
_boomasl = _this select 4;
_effrange = _this select 5;
_falloff = _this select 6;


_tgtx = (getPos _target) select 0;
_tgty = (getPos _target) select 1;
_tgtz = ((getPos _target) select 2)+1;
_tgtasl = ((getPosASL _target) select 2)+1;


_disx = _tgtx - _boomx;
_disy = _tgty - _boomy;
_ldist = (sqrt(_disx^2 + _disy^2));
_luck = (_ldist / _effrange)^_falloff;

_shrap = "B_127x107_Ball";

_aimhgt = 1;
_velocity = 1000;	

_luckx = (random _luck) - (_luck / 2);
_lucky = (random _luck) - (_luck / 2);
_luckz = 0;

_diffx = (_tgtx + _luckx) - (_boomx);
_diffy = (_tgty + _lucky) - (_boomy);
_diffz = (_tgtasl + _luckz) - (_boomasl);

_crowdist = sqrt(_diffx^2 + _diffy^2);
_actdist = sqrt(_diffz^2 + _crowdist^2);
_bearing = _diffx atan2 _diffy;

_elev = (atan (_diffz/_crowdist) mod 360);

_bearingvelocity = [(_velocity * (sin _bearing)), (_velocity * (cos _bearing)), _velocity * (sin _elev)];

_shrapnelfired = _shrap createVehicle[0,0,0];
_shrapnelfired setPos [_boomx, _boomy, _boomz];
_shrapnelfired setVelocity _bearingvelocity;