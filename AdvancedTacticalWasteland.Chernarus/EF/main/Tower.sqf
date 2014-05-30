if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	TowerSpot = "Land_Fort_Watchtower_EP1" createvehiclelocal (_pos);
	TowerSpot attachto [player,[0,6,2]];
	TowerSpot setdir ((getdir player) - 270);
	TowerYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\TowerYes.sqf", "", 1, false, false, "", "_target == _this"];
	TowerNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\TowerNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};