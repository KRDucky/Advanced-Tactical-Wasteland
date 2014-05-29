if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	AASpot = "Stinger_Pod_US_EP1" createvehiclelocal (_pos);
	AASpot setdir (getdir player);
	AASpot attachto [player,[0,2,1.6]];
	AAYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\AAYes.sqf", "", 1, false, false, "", "_target == _this"];
	AANo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\AANo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};