if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	TentSpot = "CampEast_EP1" createvehiclelocal (_pos);
	TentSpot attachto [player,[0,5,1]];
	TentYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\TentYes.sqf", "", 1, false, false, "", "_target == _this"];
	TentNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\TentNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};