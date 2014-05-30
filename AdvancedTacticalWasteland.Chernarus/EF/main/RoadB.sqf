_pos = getpos player;
_dir = getdir player;
_object = "Roadbarrier_Long" createvehicle (_pos);
_object setdir (getdir player);
_object setpos (player modelToWorld [0,2, ((position player) select 2)]);
hint "Roadblock established.";
sleep 2;
hint "";