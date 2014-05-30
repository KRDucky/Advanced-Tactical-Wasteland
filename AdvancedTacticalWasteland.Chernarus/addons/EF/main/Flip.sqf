if ("ACE_DogTag" in magazines player) then
{
	_Vehicles = nearestObjects [player, ["LandVehicle"], 10];
	_Present = count _Vehicles;
	if (_Present > 0) then {
		_Flip = _Vehicles select 0;
		player switchMove "RepairingKneel";
		hint "Flipping (10 Seconds)";
		player allowdamage false;
		sleep 10;
		player allowdamage true;
		player switchmove "";
		[_Flip, 0, 0] call BIS_fnc_setPitchBank;
		player removemagazine "ACE_DogTag";
		hint "Vehicle Flipped!";
	}
	else {
	hint "There is nothing to flip!"
	};
}
else
{
hint "You need materials(Dogtags) to flip!";
};