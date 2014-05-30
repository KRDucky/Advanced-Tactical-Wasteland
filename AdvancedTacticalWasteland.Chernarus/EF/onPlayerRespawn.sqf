_unit = _this select 0;
_corpse = _this select 1;
_corpse removeaction EngiMenu;
EngiMenu = _unit addaction [("<t color=""#0101DF"">" + ("Engineer Menu") +"</t>"),"EF\EngiMenu.sqf", "", 1, false, false, "", "_target == _this"];