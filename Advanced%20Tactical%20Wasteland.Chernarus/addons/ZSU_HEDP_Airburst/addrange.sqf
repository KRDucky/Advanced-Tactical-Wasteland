_target = _this select 0;
_player = _this select 1;
_actid = _this select 2;

_rng = _player getVariable "heimpact";
_rng = _rng + 50;
if (_rng > 1500) then {_rng = 1500};
_player setVariable ["heimpact", _rng];

hintsilent format ["Current range - %1", _player getVariable "heimpact"];