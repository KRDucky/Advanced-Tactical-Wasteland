if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	SandbagSpot = "Land_fort_bagfence_long" createvehiclelocal (_pos);
	SandbagSpot setdir (getdir player);
	SandbagSpot attachto [player,[0,2,0.4]];
	SandbagYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\SandbagYes.sqf", "", 1, false, false, "", "_target == _this"];
	SandbagNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\SandbagNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};