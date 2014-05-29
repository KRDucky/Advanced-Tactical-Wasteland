_pos      = getPosATL ShopSpawn;
_all_objs = _pos nearObjects 100;
_objs     = [];
{
	_obj_pos = getPosATL _x;
	_0z_pos  = [ _obj_pos select 0, _obj_pos select 1, 0];
	
	_real_distance = _pos distance _0z_pos;
	
	if ( _real_distance <= 10 ) then {
		_objs set [count _objs, _x];
	};
} forEach _all_objs;

{
	_r3f_disabled = _x getVariable ['R3F_LOG_disabled', false];
	if ( !_r3f_disabled ) then {
		deleteVehicle _x;
	};
} forEach _objs;