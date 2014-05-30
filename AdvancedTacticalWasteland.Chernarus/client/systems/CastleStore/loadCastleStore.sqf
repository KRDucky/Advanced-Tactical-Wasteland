#include "dialog\castlestoreDefines.sqf";

disableSerialization;


_castleshopDialog = createDialog "castleshopd";

castleStoreCart = 0;


_Dialog = findDisplay castleshop_DIALOG;

_playerMoney = _Dialog displayCtrl castleshop_money;

_money = player getVariable "cmoney";

_playerMoney CtrlsetText format[""];


CastleShop = str(_this select 0);


if(CastleShop == "cs1") then {ShopSpawn = csSpawn1;};
