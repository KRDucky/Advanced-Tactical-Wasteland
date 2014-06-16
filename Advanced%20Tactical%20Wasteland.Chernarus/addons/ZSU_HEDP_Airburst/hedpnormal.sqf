_target = _this select 0;
_player = _this select 1;
_actid = _this select 2;

_player removeAction _actid;
_player removeAction _actid-1;
_player removeAction _actid-2;

_a1 = _player addAction ["Switch to airburst", "ZSU_HEDP_Airburst\toair.sqf"];
_player setVariable ["heimpact", 1000];