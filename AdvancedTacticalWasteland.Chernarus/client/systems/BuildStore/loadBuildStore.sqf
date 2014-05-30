#include "dialog\buildstoreDefines.sqf";

disableSerialization;


_buildshopDialog = createDialog "buildshopd";

buildStoreCart = 0;


_Dialog = findDisplay buildshop_DIALOG;

_playerMoney = _Dialog displayCtrl buildshop_money;

_money = player getVariable "cmoney";

_playerMoney CtrlsetText format[""];


BuildShop = str(_this select 0);


if(BuildShop == "bs1") then {ShopSpawn = bsSpawn1;};

if(BuildShop == "bs2") then {ShopSpawn = bsSpawn2;};
if(BuildShop == "bs3") then {ShopSpawn = bsSpawn3;};
if(BuildShop == "bs3_1") then {ShopSpawn = bsSpawn3_1;};
if(BuildShop == "bs3_2") then {ShopSpawn = bsSpawn3_2;};