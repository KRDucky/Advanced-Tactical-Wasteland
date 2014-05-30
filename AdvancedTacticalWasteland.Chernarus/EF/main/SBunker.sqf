if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	SBunkerSpot = "Land_fortified_nest_small" createvehiclelocal (_pos);
	SBunkerSpot attachto [player,[0,4,1]];
	SBunkerSpot setdir ((getdir player) - 180);
	SBunkerYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\SBunkerYes.sqf", "", 1, false, false, "", "_target == _this"];
	SBunkerNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\SBunkerNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};