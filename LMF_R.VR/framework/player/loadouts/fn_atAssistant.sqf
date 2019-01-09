// PLAYER GEAR SCRIPT /////////////////////////////////////////////////////////////////////////////
/*
	- This file is a player gear loadout file.
*/
// INIT ///////////////////////////////////////////////////////////////////////////////////////////
params [["_unit",objNull]];
if !(local _unit) exitWith {};

#include "..\..\..\settings\cfg_Player.sqf"


// APPLY NEW ROLE SPECIFIC LOADOUT ////////////////////////////////////////////////////////////////
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit addWeapon _Carbine;
_unit addPrimaryWeaponItem _Carbine_Attach1;
_unit addPrimaryWeaponItem _Carbine_Attach2;
_unit addPrimaryWeaponItem _Carbine_Optic;
_unit addPrimaryWeaponItem _Carbine_Bipod;

_unit forceAddUniform selectRandom _Uniform;

_unit addVest selectRandom _Vest;
for "_i" from 1 to 4 do {_unit addItemToVest _Carbine_Ammo;};
for "_i" from 1 to 2 do {_unit addItemToVest _Carbine_Ammo_T;};
for "_i" from 1 to 2 do {_unit addItemToVest _Grenade;};
_unit addItemToVest _Grenade_Smoke;

_unit addBackpack selectRandom _Backpack_MAT;
for "_i" from 1 to 2 do {_unit addItemToBackpack _MAT_Ammo;};

_unit addHeadgear selectRandom _Headgear;
_unit addGoggles selectRandom _Goggles;

_unit addWeapon _Binocular;

_unit linkItem "ItemWatch";
_unit linkItem "ItemRadioAcreFlagged";

//RADIO
if (var_personalRadio) then {_unit addItem _ACRE_PRR};

//MAP
if (var_playerMaps == 0) then {
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit addItem "ACE_Flashlight_XL50";
};

//REST
for "_i" from 1 to 2 do {_unit addItem "FirstAidKit"};

//NVG
if (var_playerNVG == 0) then {_unit linkItem _NVG};

//PISTOL
if (var_pistolAll) then {
	_unit addWeapon _Pistol;
	_unit addHandgunItem _Pistol_Attach1;
	_unit addHandgunItem _Pistol_Attach2;
	for "_i" from 1 to 3 do {_unit addItem _Pistol_Ammo};
};

//TRAITS
_unit setUnitTrait ["medic",false];
_unit setUnitTrait ["engineer",false];

//RANK
_unit setRank "PRIVATE";