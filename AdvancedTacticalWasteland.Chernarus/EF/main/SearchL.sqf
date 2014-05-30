if ("ACE_DogTag" in magazines player) then
{
	_pos = getpos player;
	_dir = getdir player;
	SearchLSpot = "SearchLight" createvehiclelocal (_pos);
	SearchLSpot setdir (getdir player);
	SearchLSpot attachto [player,[0,2,0]];
	SearchLYes = player addaction [("<t color=""#01DF01"">" + ("Confirm Placement") +"</t>"),"EF\query\SearchLYes.sqf", "", 1, false, false, "", "_target == _this"];
	SearchLNo = player addaction [("<t color=""#DF0101"">" + ("Cancel Placement") +"</t>"),"EF\query\SearchLNo.sqf", "", 1, false, false, "", "_target == _this"];
}
else
{
	hint "You need materials(Dogtags) to build!";
	sleep 3;
	hint "";
};