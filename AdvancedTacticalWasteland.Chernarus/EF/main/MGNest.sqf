if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	MGNestSpot = "WarfareBMGNest_M240_US_EP1" createvehiclelocal (_pos);
	MGNestSpot setdir (getdir player);
	MGNestSpot attachto [player,[0,2,1.6]];
	MGNestYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\MGNestYes.sqf", "", 1, false, false, "", "_target == _this"];
	MGNestNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\MGNestNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};