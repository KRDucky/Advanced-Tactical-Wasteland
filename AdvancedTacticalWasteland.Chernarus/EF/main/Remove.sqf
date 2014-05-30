if ("ACE_DogTag" in magazines player) then
{
	_Objects = nearestObjects [player, ["House"], 10];
	_Present = count _Objects;
	if (_Present > 0) then {
		_Remove = _Objects select 0;
		player switchMove "RepairingKneel";
		hint "Removing (20 Seconds)";
		player allowdamage false;
		sleep 20;
		player allowdamage true;
		player switchmove "";
		deletevehicle _Remove;
		player removemagazine "ACE_DogTag";
		hint "Object Removed!";
	}
	else {
	hint "There is nothing to remove!"
	};
}
else
{
hint "You need materials(Dogtags) to remove!";
};