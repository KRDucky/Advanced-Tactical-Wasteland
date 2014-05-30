hint "";
waitUntil {currentWeapon player == "ACE_Minedetector_US"};
	while {currentWeapon player == "ACE_Minedetector_US" && alive player && vehicle player == player} do
	{
		_dSnd = "Sign_sphere10cm_EP1" createVehicleLocal [0,0,0];
		_sweep = nearestObjects [player, ["ACE_Explosive_Object", "ACE_Explosive_Helper", "Land_IED_v1_PMC", "Land_IED_v4_PMC"], 10];
		if (count _sweep > 0) then 
		{
			hint "Explosive detected!";
			_dSnd attachto [player,[0,0,-1],""]; // aproximated: _height = -(_distance^2.5)*2250;
			[_dSnd, player] say3D "ace_buzz_2";
			if (currentWeapon player != "ACE_Minedetector_US") then
			{
				[] execVM "EF\MinesweepC.sqf";
				detach _dSnd;
				deletevehicle _dSnd;
			};
		} 
		else 
		{
			hint "";
			detach _dSnd;
			deletevehicle _dSnd;
			if (currentWeapon player != "ACE_Minedetector_US") then
			{
				[] execVM "EF\MinesweepC.sqf";
				detach _dSnd;
				deletevehicle _dSnd;
			};
		}
	};
