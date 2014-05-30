// ====================================================================================
// Scripts made by Phantactical Mod Development Team for tge Prevailing Winds Addon
// We can be found here: www.phantactical.com
// Last Edited: 4:19 PM 28/1/2014
// No derivative works allowed without permission. Just ask, we will see your request.
// ====================================================================================
//Backward reference: initializer.sqf
_myBird = (_this select 0);
_windFactor = (_this select 1);
while {true} do {
	_pos = getPosATL _myBird;
	while {(_pos select 2) > .1} do {
		_pos = getPosATL _myBird;
		_windNow = wind;
		_velocityNow = velocity _myBird;
		_myBird setVelocity [
		(_velocityNow select 0) + (_windNow select 0) / _windFactor,
		(_velocityNow select 1) + (_windNow select 1) / _windFactor,
		(_velocityNow select 2) + (_windNow select 2) / _windFactor
		];
		sleep .1;
	};
	sleep .1;
};