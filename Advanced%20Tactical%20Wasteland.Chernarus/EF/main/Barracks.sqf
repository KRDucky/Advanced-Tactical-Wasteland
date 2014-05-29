if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	BarracksSpot = "Land_Barrack2_EP1" createvehiclelocal (_pos);
	BarracksSpot setdir (getdir player);
	BarracksSpot attachto [player,[0,6,1]];
	BarracksYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\BarracksYes.sqf", "", 1, false, false, "", "_target == _this"];
	BarracksNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\BarracksNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};