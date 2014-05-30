if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	FieldHSpot = "MASH" createvehiclelocal (_pos);
	FieldHSpot attachto [player,[0,4,1.2]];
	FieldHSpot setdir ((getdir player) - 180);
	FieldHYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\FieldHYes.sqf", "", 1, false, false, "", "_target == _this"];
	FieldHNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\FieldHNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};