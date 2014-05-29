_list = _this select 0;
_marker_type = _this select 1;
_marker_color = _this select 2;
_marker_alpha = _this select 3;
_marker_shape = _this select 4;
_prefix = _this select 5;
_type = _this select 6;
_col_empty = _marker_color;
_col_enemy = "ColorRed";
_col_friendly = "ColorGreen";
_col_mixed = "ColorOrange";
_status = [];
_get_pos = {
	_pos = getMarkerPos _this;
	if ( (_pos select 0) == 0 ) then {
		_pos = getPosATL (missionNamespace getVariable _this);
	};
	_pos;
};
{
	_pos = (_x select 0) call _get_pos;
	_markerZone = format["%1_zone_%2",_prefix, _x select 0];
	_marker = createMarkerLocal [_markerZone, _pos];
	_marker setMarkerShapeLocal _marker_shape;
	_marker setMarkerSizeLocal [_x select 1, _x select 1];
	_marker setMarkerColorLocal _col_empty;
	_marker setMarkerBrushLocal _marker_type;
	_marker setMarkerAlphaLocal _marker_alpha;   
	_markerName = format["%1_title_%2",_prefix, _x select 0];
	_marker = createMarkerLocal [_markerName, _pos];
	_markerName setMarkerShapeLocal "ICON";
	_markerName setMarkerTypeLocal "mil_dot";
	_markerName setMarkerColorLocal _col_empty;
	_markerName setMarkerSizeLocal [0.5,0.5];
	_markerName setMarkerTextLocal "";
	_markerName setMarkerAlphaLocal 0.1;
	if ( (_type select 0) != "" ) then {   
		_markerName = format["%1_type_%2",_prefix, _x select 0];
		_marker = createMarkerLocal [_markerName, _pos];
		_markerName setMarkerShapeLocal "ICON";
		_markerName setMarkerTypeLocal "Dot";
		_markerName setMarkerColorLocal (_type select 1);
		_markerName setMarkerSizeLocal [1,1];
		_markerName setMarkerTextLocal (_type select 0);
	};
	_status set [_forEachIndex, "EMPTY"];
} forEach _list;
_setStatus = {
	_index = _this select 0;
	if(_status select _index == (_this select 1)) exitWith {};
	_pos   = (_list select _index) select 0;
	_name  = (_list select _index) select 2;
    _markerZone = format ["%1_zone_%2", _prefix, _pos];
	_markerName = format ["%1_title_%2", _prefix, _pos];
	switch(_this select 1) do {
		case "EMPTY": {
			_markerZone setmarkerColorLocal _col_empty;
			_markerName setmarkerColorLocal _col_empty;
			_markerName setMarkerTextLocal "";
		};
		case "ENEMY": {
			_markerZone setmarkerColorLocal _col_enemy;
			_markerName setmarkerColorLocal _col_enemy;
			_markerName setMarkerTextLocal format["%1 has Enemy Players", _name];
		};
		case "FRIENDLY": {
			_markerZone setmarkerColorLocal _col_friendly;
			_markerName setmarkerColorLocal _col_friendly;
			_markerName setMarkerTextLocal format["%1 has Friendly Players", _name];
		};
		case "MIXED": {
			_markerZone setmarkerColorLocal _col_mixed;
			_markerName setmarkerColorLocal _col_mixed;
			_markerName setMarkerTextLocal format["%1 has Enemy and Friendly Players", _name];
		};
	};
      if((_this select 2) && ((_this select 1) in ["ENEMY", "MIXED"])) then {
		hintSilent parseText format ["<t size='2' color='#ff0000'>%1</t><br/><br/>%2.","Warning!","Enemy player just entered the area"];
	};
     _status set [_index, _this select 1];
};
while {true} do {
    {
       _unit = (_x select 0) call _get_pos;
		_friendlyCount = 0;
		_enemyCount = 0;
		_distance = _x select 1;
		{
			if((_x distance _unit < _distance) && (player != _x)) then {
				if(playerSide in [west,east] && playerSide == side _x) then {
					_friendlyCount = _friendlyCount + 1;
				} else {
					if ( playerSide == resistance && group player == group _x ) then {
						_friendlyCount = _friendlyCount + 1;
					}
					else {
						_enemyCount = _enemyCount + 1;
					};
				};
			};
		} forEach allUnits;
        _player_in_area = player distance _unit < _distance;
		if(_enemyCount > 0) then {
			if(_friendlyCount > 0) then {
				[_forEachIndex, "MIXED", _player_in_area] call _setStatus;
			} else {
				[_forEachIndex, "ENEMY", _player_in_area] call _setStatus;
			};
		} else {
			if ( _friendlyCount > 0 || _player_in_area ) then {
				[_forEachIndex, "FRIENDLY", _player_in_area] call _setStatus;
			}
			else {
				[_forEachIndex, "EMPTY", _player_in_area] call _setStatus;
			};
		};
   } forEach _list;
	sleep 1;
};