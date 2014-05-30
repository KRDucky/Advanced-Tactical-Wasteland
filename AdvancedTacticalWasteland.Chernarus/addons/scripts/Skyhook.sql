//INF_Mike64's Skyhook system.
//
//Directions:linelength is the length of line x -1, hitz is the radius of the hit zone for a successful pick up.
// the aircraft selected for pick up must be named catcher.
//ls = player addAction ["Launch Skyhook", "Skyhook.sql"]; must be put into the unit wished to have the Skyhook ability. 
//IF your using ACE change ParachuteMediumWest_EP1 to ACE_B61_Parachute for a more accurate representation
//
//You can choose between three IR-Targets:
//"NVG_TargetC": Independent AI will attack this.
//"NVG_TargetW": West AI will attack this.
//"NVG_TargetE": East AI will attack this.

//       OPTIONS
_linelength = -130
_hitz = 60
_n2 = 0
_balloon = "ACE_B61_Parachute"
_IRBeacon = "NVG_TargetC"
// CODE 
stop = false
player removeaction ls;
para = _balloon  createVehicle (position player);
para attachto [player,[0,0,-_linelength]];
light = "#lightpoint" createVehicle (position para);
light Attachto [para,[0,0,-20]];
light setLightAmbient[1.0,0.0,0.0];
light setLightColor[1.0,0.0,0.0];
light setLightBrightness 0.5;
lightNV = _IRBeacon createVehicle (position para);
lightNV Attachto [para,[0,0,0]];
lightNV1 = _IRBeacon createVehicle (position para);
lightNV1 Attachto [para,[0,0,-20]];
lightNV2 = _IRBeacon createVehicle (position para);
lightNV2 Attachto [para,[0,0,-40]];
lightNV3 = _IRBeacon createVehicle (position para);
lightNV3 Attachto [para,[0,0,-60]];
dt = player addaction ["Dismantle Skyhook","addons\scripts\skyhookend.sql"];
~5
#loop3
light setLightBrightness 0.0;
? para distance catcher <= _hitz: goto "loop"
? stop = true: goto "end"
~0.5
light setLightBrightness 0.5;
? para distance catcher <= _hitz: goto "loop"
? stop = true: goto "end"
~0.5
? para distance catcher <= _hitz: goto "loop"
? stop = true: goto "end"
goto "loop3"
#loop 
deleteVehicle para 
deleteVehicle light
deleteVehicle lightNV
deleteVehicle lightNV1
deleteVehicle lightNV2
deleteVehicle lightNV3
_linelenght = getPosATL catcher - 5
_linelenght = _linelenght * -1
#loop1
player attachto [catcher,[0,_n2,_linelength]];
_linelength = _linelength + 0.5;
_n2 = _n2 - 0.1;
~0.01
? _linelength >= -5 : goto "loop2";
goto "loop1"

#loop2
player attachto [catcher,[0,_n2,-5]];
_n2 = _n2 + 0.2
~0.01
?_n2 >= 0 : goto "fin";
goto "loop2"

#fin
detach player
player moveincargo catcher;
~0.5
player moveincargo catcher;
#end