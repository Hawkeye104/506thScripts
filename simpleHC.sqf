/*
Version 4
By Ryan [506th IR]
Simple script to transfer ownership of AI to a Headless Client.
Name the Virtual Headless Client HC in the mission editor.
Place the following:

[] execVM "scripts\simpleHC.sqf";

in init.sqf
*/

if ((hasInterface) and (!isServer)) exitWith {};

waitUntil {sleep 15; !isNil "HC"};

_cycleCountHC = 0;
_cycleCountServer = 0;
_HCConnected = 0;
_AIGroups = [];

while {true} do
{
	if (isServer) then
	{
		_HCid = owner HC;
		
		if(_HCid != 2) then
		{
			{if ({isPlayer _x} count units _x == 0) then {_AIGroups pushBack _x;}; sleep 3} forEach allGroups;
			{if !((groupOwner _x) isEqualTo _HCid) then {_x setGroupOwner _HCid;}; sleep 3} forEach _AIGroups;
			_HCConnected = 1;
		};
		if(_HCid isEqualTo 2) then
		{	
			if(_HCConnected isEqualTo 1) then
			{
				{if ({isPlayer _x} count units _x == 0) then {_AIGroups pushBack _x;}; sleep 3} forEach allGroups;
				{if !((groupOwner _x) isEqualTo _HCid) then {_x setGroupOwner _HCid;}; sleep 3} forEach _AIGroups;
			};
			if (count _AIGroups > 0) then
			{
				if (_cycleCountServer < 5) then {_cycleCountServer = _cycleCountServer + 1; sleep 5;};
				if (_cycleCountServer isEqualTo 5) then {{if (count (units _x)==0) then {deleteGroup _x;}; sleep 3} forEach _AIGroups; 
				_cycleCountServer = _cycleCountServer - 5; sleep 5;};
			};
			if (count _AIGroups isEqualTo 0) then
			{
				sleep 30;
			};
			_HCConnected = 0;
		};
	};
	if((!hasInterface) and (!isDedicated)) then
	{
		if (count _AIGroups > 0) then
		{
			if (_cycleCountHC < 5) then {_cycleCountHC = _cycleCountHC + 1; sleep 5;};
			if (_cycleCountHC isEqualTo 5) then {{if (count (units _x)==0) then {deleteGroup _x;}; sleep 3} forEach _AIGroups; 
			_cycleCountHC = _cycleCountHC - 5; sleep 5;};
		};
		if (count _AIGroups isEqualTo 0) then
		{
			sleep 30;
		};
	};
};