#define Engi_CT_STATIC	0
#define Engi_CT_BUTTON	1
#define Engi_ST_LEFT	0x00
#define Engi_ST_CENTER	0x02
#define Engi_ST_FRAME	64
#define Engi_FontM2	"TahomaB"
#define Engi_FontHTML	"TahomaB"

class Engi_RscBgFrame
{
	type=Engi_CT_STATIC;
	idc=-1;
	style=Engi_ST_FRAME;
	colorBackground[]={0, 0, 1, 1};
	colorText[]={1, 1, 1, 1};
	font=Engi_FontM2;
	SizeEX=0.025;
	text="";
};

class Engi_RscBackground
{
	colorBackground[]={0, 0, 1, 1};
	text="";
	type=Engi_CT_STATIC;
	idc=-1;
	style=Engi_ST_LEFT;
	colorText[]={1, 1, 1, 1};
	font=Engi_FontM2;
	sizeEx=0.04;
};

class Engi_RscButton
{
	type=Engi_CT_BUTTON;
	idc=-1;
	style=Engi_ST_CENTER;
	colorText[]={1, 1, 1, 1};
	font=Engi_FontHTML;
	sizeEx=0.03;
	soundPush[]={"", 0.2, 1};
	soundClick[]={"ui\ui_ok", 0.2, 1};
	soundEscape[]={"ui\ui_cc", 0.2, 1};
	default=false;
	text="";
	action="";
	colorActive[]={1, 0, 0, 1};
	colorDisabled[]={0, 0, 1, 1};
	colorBackground[]={0, 0, 1, 1};
	colorBackgroundActive[]={1,0,0,1};
	colorBackgroundDisabled[]={0, 0, 1, 1};
	colorFocused[]={0, 0, 1, 1};
	colorShadow[]={0, 0, 1, 1};
	colorBorder[]={0, 0, 1, 1};
	offsetX=0;
	offsetY=0;
	offsetPressedX=0;
	offsetPressedY=0;
	borderSize=0;
	soundEnter[]={"", 0.15, 1};
};