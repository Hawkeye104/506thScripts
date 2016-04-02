/*
Version 5
By Ryan [506th IR]
Simple script to transfer ownership of AI to a Headless Client.
Name the Virtual Headless Client HC in the mission editor.
Place the following:

[] execVM "scripts\simpleHC.sqf";

in init.sqf
*/

if (!isServer) exitWith {};

waitUntil {sleep 30; !isNil "HC"};

while {true} do
{
	_HCid = owner HC;
	_ARESid = owner aresmod;
	_AIGroups = [];
	
	if(_HCid != 2) then
	{
		{if ((side _x == east) or (side _x == resistance)) then {_AIGroups pushBack _x;};} forEach allGroups;
		{if !((groupOwner _x) isEqualTo _HCid) then {_x setGroupOwner _HCid;};} forEach _AIGroups;
		sleep 30;
	};
	if(_HCid isEqualTo 2) then
	{
		{if ((side _x == east) or (side _x == resistance)) then {_AIGroups pushBack _x;};} forEach allGroups;
		{if !((groupOwner _x) isEqualTo _ARESid) then {_x setGroupOwner _ARESid;};} forEach _AIGroups;
		sleep 30;
	};
		
};