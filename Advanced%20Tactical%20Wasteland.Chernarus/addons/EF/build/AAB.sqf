_pos = getpos player;
_dir = getdir player;
player switchMove "RepairingKneel";
hint "Building (20 Seconds)";
player removeaction EngiMenu;
player allowdamage false;
sleep 20;
player allowdamage true;
EngiMenu = player addaction [("<t color=""#0101DF"">" + ("Engineer Menu") +"</t>"),"EF\EngiMenu.sqf", "", 1, false, false, "", "_target == _this"];
hint "";
player switchMove "";
detach AASpot;
deletevehicle AASpot;
sleep 0.1;
_object = "Stinger_Pod_US_EP1" createvehicle (_pos);
_object setdir (getdir player);
_object setpos (player modelToWorld [0,2, ((position player) select 2)]);
hint "AA Pod created.";
sleep 2;
hint "";
player removemagazine "ACE_DogTag";