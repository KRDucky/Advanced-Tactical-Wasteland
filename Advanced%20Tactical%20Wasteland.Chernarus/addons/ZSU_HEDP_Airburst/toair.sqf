_target = _this select 0;
_player = _this select 1;
_actid = _this select 2;

_player removeAction _actid;
_player setVariable ["heimpact", 300];

_a0 = _player addAction ["Add 50m to range", "ZSU_HEDP_Airburst\addrange.sqf"];
_a1 = _player addAction ["Subtract 50m from range", "ZSU_HEDP_Airburst\droprange.sqf"];
_a2 = _player addAction ["Switch to impact", "ZSU_HEDP_Airburst\hedpnormal.sqf"];


hintsilent format ["Current range - %1", _player getVariable "heimpact"];