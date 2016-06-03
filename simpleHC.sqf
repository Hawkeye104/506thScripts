/*
Version 7
By Ryan [506th IR]
Simple script to transfer ownership of AI to a Headless Client.
Name the Virtual Headless Client HC_1, HC_2 in the mission editor.
Place the following:

// Curator Event Handler to add Zeus placed Groups to HC
{
    simpleHC = _x addEventHandler ["CuratorGroupPlaced", {
        _entity = _this select 1;
		_HC1id = if (isNil "HC_1") then {2} else {owner HC_1;};
		if (_HC1id != 2) then {
			[[_entity],"scripts\simpleHC.sqf"] remoteExec ["execVM",2];
        };
    }];
} forEach allCurators;

in the S_exec.sqf file.
*/

if (!isServer) exitWith {};

_transferGroup = _this select 0;
_HC1id = if (isNil "HC_1") then {2} else {owner HC_1;};
_HC2id = if (isNil "HC_2") then {2} else {owner HC_2;};

//If HC is connected, then run.
if (_HC1id != 2) then
{
	_AIgrps = [];
	_HC1grps = [];
	_HC2grps = [];
	if (_HC2id != 2) then
	{
		// Get all non-player groups.
		{
			if (({isPlayer _x} count units _x == 0) and (count (units _x)>0)) then 
			{
				_AIgrps pushBack _x;
			};
		} forEach allGroups;

		// Split all groups, those that are already assigned to the 2 HC's.
		{
			if ((groupOwner _x) isEqualTo _HC1id) then 
			{
				_HC1grps pushBack _x;
			};
			if ((groupOwner _x) isEqualTo _HC2id) then 
			{
				_HC2grps pushBack _x;
			};
		} forEach _AIgrps;

		// Divide the remaining groups to the 2x HC
		if ((count _HC1grps) <= (count _HC2grps)) then 
		{
			_transferGroup setGroupOwner _HC1id;
		};
		if ((count _HC2grps) < (count _HC1grps)) then 
		{
			_transferGroup setGroupOwner _HC2id;
		};
	};
	if (_HC2id == 2) then
	{
		_transferGroup setGroupOwner _HC1id;
	};
};