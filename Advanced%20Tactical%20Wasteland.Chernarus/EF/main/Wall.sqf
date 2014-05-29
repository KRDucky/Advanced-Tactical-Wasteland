if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	WallSpot = "Land_HBarrier_large" createvehiclelocal (_pos);
	WallSpot setdir (getdir player);
	WallSpot attachto [player,[0,3,1.1]];
	WallYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\WallYes.sqf", "", 1, false, false, "", "_target == _this"];
	WallNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\WallNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};