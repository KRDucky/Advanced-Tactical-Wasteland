#include "dialog\castlestoreDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
_ObjectsInArea = [];
_dialog = findDisplay castleshop_DIALOG;
_cartlist = _dialog displayCtrl castleshop_cart;
_totalText = _dialog displayCtrl castleshop_total;
_playerMoneyText = _Dialog displayCtrl castleshop_money;
_size = lbSize _cartlist;
_itemlist = _dialog displayCtrl castleshop_item_list;
hintsilent "Checking Purchase";
closeDialog objshop_DIALOG;
_complete_purchase = {
	_success = false;
	
	_price = (_this select 0) select 1;
	_name  = (_this select 0) select 2;
	
	if(_price <= (player getVariable "cmoney")) then {
	// if(true) then {
		player setVariable["cmoney",_playerMoney - _price,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
		_success = true;
	};
	
	_success
};
_spawn_object = {
	_name = _this select 0;
	
	R3F_createVehicleResponseObj = objNull;
	R3F_createVehicleRequest = [player, _name, getPos ShopSpawn, (getDir ShopSpawn) + 180];
	publicVariableServer "R3F_createVehicleRequest";
	
	waitUntil { !isNull R3F_createVehicleResponseObj};
	
	R3F_createVehicleResponseObj
};
_find_capacity = {
	_transporteur = _this select 0;
	_chargement_maxi = 0;
	for [{_i = 0}, {_i < count R3F_LOG_CFG_transporteurs}, {_i = _i + 1}] do
	{
		if (_transporteur isKindOf (R3F_LOG_CFG_transporteurs select _i select 0)) exitWith
		{
			_chargement_maxi = (R3F_LOG_CFG_transporteurs select _i select 1);
		};
	};
 
	_chargement_maxi
};
_find_used_space = {
	_transporteur = _this select 0;
	_objets_charges = _transporteur getVariable "R3F_LOG_objets_charges";
	_chargement_actuel = 0;
	{
		for [{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do
		{
			if (_x isKindOf (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith
			{
				_chargement_actuel = _chargement_actuel + (R3F_LOG_CFG_objets_transportables select _i select 1);
			};
		};
	} forEach _objets_charges;
	
	_chargement_actuel
};
_available_space = {
	_obj = _this select 0;
	
	_capacity = [ _obj ] call _find_capacity;
	_used     = [ _obj ] call _find_used_space;
	
	_capacity - _used
};
_object_size = {
	_objet = _this select 0;
	_cout_capacite_objet = 5;
	for [{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do
	{
		if (_objet == (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith
		{
			_cout_capacite_objet = (R3F_LOG_CFG_objets_transportables select _i select 1);
		};
	};
	
	_cout_capacite_objet
};
_will_fit = {
	_container = _this select 0;
	_to_buy = _this select 1;
	
	_space = [ _container ] call _available_space;
	_size = [ _to_buy ] call _object_size;
	
	_space >= _size
};
_selectedItem = lbCurSel _itemlist;
_itemText = _itemlist lbText _selectedItem;
{if(_itemText == _x select 0) then{
	sleep 1;
	_ObjectsInArea = [(getPos ShopSpawn) select 0, (getPos ShopSpawn) select 1] nearObjects 2;
	_ignore = [];
	{
		if ( _x isKindOf 'HoneyBee' || _x isKindOf 'DragonFly' || _x isKindOf 'HouseFly' || _x isKindOf 'FxWindPollen1' ) then {
			_ignore = _ignore + [ _x ];
		};
		
	} forEach _ObjectsInArea;
	
	_ObjectsInArea = _ObjectsInArea - _ignore;
	_ObjectsInArea = _ObjectsInArea + ( [(getPos ShopSpawn) select 0, (getPos ShopSpawn) select 1] nearObjects ['Car', 10] );
	
	if(count _ObjectsInArea <= 1) then {
		if ( [ _x ] call _complete_purchase ) then {
			_purchase = [ _x select 2 ] call _spawn_object;
			hintsilent "Building bought - Check the spawn area.";
		}
		else {
			hintsilent "You do not have enough money";
		}
	} else {
		_obj = nil;
		{
			if ( ! isNil { _x getVariable "R3F_LOG_objets_charges" } ) exitwith {
				_obj = _x;
			}
		} forEach _ObjectsInArea;
		
		if ( ! isNil { _obj getVariable "R3F_LOG_objets_charges" } ) then {
			if ( [ _obj, _x select 2 ] call _will_fit ) then {
				if ( [ _x ] call _complete_purchase ) then {
					_purchase = [ _x select 2 ] call _spawn_object;
					
					_objets_charges = _obj getVariable "R3F_LOG_objets_charges";
					_objets_charges = _objets_charges + [_purchase];
					_obj setVariable ["R3F_LOG_objets_charges", _objets_charges, true];
					private ["_nb_tirage_pos", "_position_attache"];
					_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
					_nb_tirage_pos = 1;
					
					while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do
					{
						_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
						_nb_tirage_pos = _nb_tirage_pos + 1;
					};
					
					_purchase attachTo [R3F_LOG_PUBVAR_point_attache, _position_attache];
					
					_obj_name = getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");
					hintsilent format["Building bought - Check in %1", _obj_name];
				}
				else {
					hintsilent "You do not have enough money";
				};
			}
			else {
				hintsilent "There is another object blocking the spawn point and it does not have room!";
			};
		}
		else {
			hintsilent "There is another Building or player blocking the spawn point!";
		};
	};
}} forEach CastleStore;

ctrlEnable [1001, true];