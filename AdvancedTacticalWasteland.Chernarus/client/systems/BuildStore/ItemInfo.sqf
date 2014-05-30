#include "dialog\buildstoreDefines.sqf";


disableSerialization;

_build_type = "";

_price = 0;
_dialog = findDisplay buildshop_DIALOG;

_itemlist = _dialog displayCtrl buildshop_item_list;

_itemlisttext = _dialog displayCtrl buildshop_money;

_selectedItem = lbCurSel _itemlist;

_itemText = _itemlist lbText _selectedItem;

_itempicture ctrlSettext _picture;

_itemlisttext ctrlSetText format ["Price: 0$"];	
{if(_itemText == _x select 0) then{ 
	_type = _x select 2;

	_price = _x select 1;
	_item = (configFile >> "CfgVehicles" >> _type);
	
_itemlisttext ctrlSetText format ["Price: %1$", _price];
}}forEach BuildStore;
