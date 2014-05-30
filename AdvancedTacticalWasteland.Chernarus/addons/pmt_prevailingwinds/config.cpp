class CfgPatches
{
	class pmt_prevailingWinds
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"Extended_EventHandlers"};
		author[] = {"Phantactical Development Team"};
		authorUrl = "http://phantactical.com";
	};
};

class Extended_PostInit_EventHandlers
{
  PMT_chopperstand_Post_Init = "PMT_chopperstand_Post_Init_Var = [] execVM ""\pmt_prevailingWinds\initializer.sqf""";
};