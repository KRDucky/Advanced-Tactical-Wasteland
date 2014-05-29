if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	CamoSpot = "Land_CamoNetB_NATO_EP1" createvehiclelocal (_pos);
	CamoSpot setdir (getdir player);
	CamoSpot attachto [player,[0,6,1.2]];
	CamoYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\CamoYes.sqf", "", 1, false, false, "", "_target == _this"];
	CamoNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\CamoNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};