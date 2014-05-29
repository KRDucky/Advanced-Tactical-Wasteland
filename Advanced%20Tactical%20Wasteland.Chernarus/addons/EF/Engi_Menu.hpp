class Engi_Menu
{
	name=Engi_Menu;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={BGMenu};
	objects[]={};
	controls[]={btnWall, btnCW, btnTankT, btnSandbag, btnRepair, btnRemove, btnSBunker, btnMGNest, btnAA, btnFlip, btnSearchL, btnFieldH, btnBarracks, btnCamo, btnLBunker, btnRoadB, btnTent, btnTower, btnExit, FrameMenu};

	class btnWall:Engi_RscButton
	{
		idc=-1;
		text="Hesco";
		action="[] spawn Wall; CloseDialog 0";
		x=0.2;
		y=0;
		w=0.2;
		h=0.15;
	};

	class btnCW:Engi_RscButton
	{
		idc=-1;
		text="Wire Coil";
		action="[] spawn CW; closeDialog 0";
		x=0;
		y=0;
		w=0.2;
		h=0.15;
	};
	class btnFieldH:Engi_RscButton
	{
		idc=-1;
		text="Hospital";
		action="[] spawn FieldH; CloseDialog 0";
		x=0.6;
		y=0;
		w=0.2;
		h=0.15;
	};

	class btnTankT:Engi_RscButton
	{
		idc=-1;
		text="Tanktrap";
		action="[] spawn TankT; closeDialog 0";
		x=0.4;
		y=0;
		w=0.2;
		h=0.15;
	};
	class btnSandbag:Engi_RscButton
	{
		idc=-1;
		text="Sandbags";
		action="[] spawn Sandbag; CloseDialog 0";
		x=0.8;
		y=0;
		w=0.2;
		h=0.15;
	};

	class btnRepair:Engi_RscButton
	{
		idc=-1;
		text="Repair Vehicle";
		action="[] spawn Repair; closeDialog 0";
		x=1;
		y=0;
		w=0.2;
		h=0.15;
	};
	class btnRemove:Engi_RscButton
	{
		idc=-1;
		text="Remove Object";
		action="[] spawn Remove; CloseDialog 0";
		x=0;
		y=0.15;
		w=0.2;
		h=0.15;
	};

	class btnSBunker:Engi_RscButton
	{
		idc=-1;
		text="Small Bunker";
		action="[] spawn SBunker; closeDialog 0";
		x=0.2;
		y=0.15;
		w=0.2;
		h=0.15;
	};
	class btnSearchL:Engi_RscButton
	{
		idc=-1;
		text="Searchlight";
		action="[] spawn SearchL; CloseDialog 0";
		x=0.4;
		y=0.15;
		w=0.2;
		h=0.15;
	};

	class btnMGNest:Engi_RscButton
	{
		idc=-1;
		text="MG Nest";
		action="[] spawn MGNest; closeDialog 0";
		x=0.6;
		y=0.15;
		w=0.2;
		h=0.15;
	};
	class btnAA:Engi_RscButton
	{
		idc=-1;
		text="Stinger Pod";
		action="[] spawn AA; CloseDialog 0";
		x=0.8;
		y=0.15;
		w=0.2;
		h=0.15;
	};

	class btnFlip:Engi_RscButton
	{
		idc=-1;
		text="Flip Vehicle";
		action="[] spawn Flip; closeDialog 0";
		x=1;
		y=0.15;
		w=0.2;
		h=0.15;
	};

	class btnBarracks:Engi_RscButton
	{
		idc=-1;
		text="Barracks";
		action="[] spawn Barracks; closeDialog 0";
		x=0;
		y=0.30;
		w=0.2;
		h=0.15;
	};

	class btnCamo:Engi_RscButton
	{
		idc=-1;
		text="Camo Net";
		action="[] spawn Camo; closeDialog 0";
		x=0.2;
		y=0.30;
		w=0.2;
		h=0.15;
	};

	class btnLBunker:Engi_RscButton
	{
		idc=-1;
		text="Large Bunker";
		action="[] spawn LBunker; closeDialog 0";
		x=0.4;
		y=0.30;
		w=0.2;
		h=0.15;
	};

	class btnRoadB:Engi_RscButton
	{
		idc=-1;
		text="Roadblock";
		action="[] spawn RoadB; closeDialog 0";
		x=0.6;
		y=0.30;
		w=0.2;
		h=0.15;
	};

	class btnTent:Engi_RscButton
	{
		idc=-1;
		text="Tent";
		action="[] spawn Tent; closeDialog 0";
		x=0.8;
		y=0.30;
		w=0.2;
		h=0.15;
	};

	class btnTower:Engi_RscButton
	{
		idc=-1;
		text="Tall Bunker";
		action="[] spawn Tower; closeDialog 0";
		x=1;
		y=0.30;
		w=0.2;
		h=0.15;
	};

	class btnExit:Engi_RscButton
	{
		idc=-1;
		text="Exit Menu";
		action="closeDialog 0";
		x=0.5;
		y=0.45;
		w=0.2;
		h=0.15;
	};

	class FrameMenu:Engi_RscBgFrame
	{
		idc=-1;
		x=0;
		y=0;
		w=1.2;
		h=0.60;
	};

	class BGMenu:Engi_RscBackground
	{
		idc=-1;
		x=0;
		y=0;
		w=1.2;
		h=0.60;
	};
};