if ("ACE_DogTag" in magazines player) then
{
	_Vehicles = nearestObjects [player, ["LandVehicle","Air"], 10];
	_Present = count _Vehicles;
	if (_Present > 0) then {
		_Repair = _Vehicles select 0;
		player switchMove "RepairingKneel";
		hint "Repairing (30 Seconds)";
		player allowdamage false;
		sleep 30;
		player allowdamage true;
		player switchmove "";
		_Repair setdamage 0;
		player removemagazine "ACE_DogTag";
		hint "Vehicle Repaired!";
	}
	else {
	hint "There is nothing to repair!"
	};
}
else
{
hint "You need materials(Dogtags) to repair!";
};