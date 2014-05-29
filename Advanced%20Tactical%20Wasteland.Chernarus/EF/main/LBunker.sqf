if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	LBunkerSpot = "WarfareBCamp" createvehiclelocal (_pos);
	LBunkerSpot setdir (getdir player);
	LBunkerSpot attachto [player,[0,8,0.8]];
	LBunkerYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\LBunkerYes.sqf", "", 1, false, false, "", "_target == _this"];
	LBunkerNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\LBunkerNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};