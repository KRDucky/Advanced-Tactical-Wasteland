if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	TankTSpot = "Hedgehog" createvehiclelocal (_pos);
	TankTSpot setdir (getdir player);
	TankTSpot attachto [player,[0,2,0.4]];
	TankTYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\TankTYes.sqf", "", 1, false, false, "", "_target == _this"];
	TankTNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\TankTNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};