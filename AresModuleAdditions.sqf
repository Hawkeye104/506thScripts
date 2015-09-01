if (isClass (configFile >> "CfgPatches" >> "Ares")) then
{
    // Ares is loaded, register the custom module.
    ["AI Behaviours", "Turn Engine On", { _veh = _this select 1;_veh engineOn true; }] call Ares_fnc_RegisterCustomModule;
	["AI Behaviours", "Turn Engine Off", { _veh = _this select 1;_veh engineOn false; }] call Ares_fnc_RegisterCustomModule;
	["AI Behaviours", "Dismount Vehicle",{ _veh = _this select 1;(crew _veh) orderGetIn false;}] call Ares_fnc_RegisterCustomModule;
	["AI Behaviours", "Land Helicopter",{ _veh = _this select 1;if !(_veh isKindOf "Air") exitWith {[objNull, "This isn't a air unit"] call bis_fnc_showCuratorFeedbackMessage;};_veh land "LAND";}] call Ares_fnc_RegisterCustomModule;
	["Reinforcements", "Spawn Units v2",
	{
		if (isNil "Ares_Reinforcement_Unit_Pools" || typeName Ares_Reinforcement_Unit_Pools != typeName [] || count Ares_Reinforcement_Unit_Pools == 0) exitWith
		{
			[objNull, "Unable to load unit pools. Is your 'Ares_Reinforcement_Unit_Pools.sqf' file corrupt?"] call bis_fnc_showCuratorFeedbackMessage;
		};
		
		private ["_allUnitPools"];
		if (isNil "Ares_Reinforcement_Mission_Unit_Pools") 
		then
		{
			_allUnitPools = Ares_Reinforcement_Unit_Pools;
		}
		else
		{
			_allUnitPools = Ares_Reinforcement_Unit_Pools + Ares_Reinforcement_Mission_Unit_Pools;
		};

		_allLzsUnsorted = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
		if (count _allLzsUnsorted == 0) exitWith
		{
			[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_allLzs = [_allLzsUnsorted, [], { _x getVariable ["SortOrder", 0]; }, "ASCEND"] call BIS_fnc_sortBy;
		
		_allRpsUnsorted = allMissionObjects "Ares_Module_Reinforcements_Create_Rp";
		
		_allRps = [_allRpsUnsorted, [], { _x getVariable ["SortOrder", 0]; }, "ASCEND"] call BIS_fnc_sortBy;

		_poolNames = [];
		_validPools = [];
		{	
			if ((_x select 2) == "" || isClass(configFile >> "CfgPatches" >> (_x select 2))) then
			{
				_poolNames pushBack (_x select 0);
				_validPools pushBack _x;
			};
		} forEach _allUnitPools;

		_lzOptions = ["Random", "Nearest", "Farthest", "Least Used"];
		{
			_lzOptions pushBack (name _x);
		} forEach _allLzs;
		_rpOptions = ["Random", "Nearest", "Farthest", "Least Used"];
		{
			_rpOptions pushBack (name _x);
		} forEach _allRps;

		_dialogResult = ["Create Reinforcements",
			[	["Side", _poolNames, 0],
				["Vehicle Type", ["Unarmed Light Transport", "APC's & Light Transport", "Dedicated Troop Transport", "IFV's & Heavy Transports", "Unarmed Helicopters", "Armed Helicopters", "Unarmed Boats", "Armed Boats"]],
				["Vehicle Behaviour After Dropoff", ["RTB and Despawn", "Stay at LZ", "Circle Area"]],
				["Vehicle Landing Zone", _lzOptions],
				["Unit Rally Point", _rpOptions],
				["Unit Behaviour", ["Default", "Relaxed", "Cautious", "Combat"]]]
		] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult == 0) exitWith{};

		_dialogPool =             _dialogResult select 0;
		_dialogVehicleClass =     _dialogResult select 1;
		_dialogVehicleBehaviour = _dialogResult select 2;
		_dialogLzAlgorithm =      _dialogResult select 3;
		_dialogRpAlgorithm =      _dialogResult select 4;
		_dialogUnitBehaviour =    _dialogResult select 5;
		_lzSize = 20;
		_rpSize = 20;
		_spawnPosition = _this select 0;
		if (not isNil "Ares_CuratorObjectPlaces_LastPlacedObjectPosition") 
		then
		{_spawnPosition = Ares_CuratorObjectPlaces_LastPlacedObjectPosition;};
		if (_dialogVehicleClass == 4 || _dialogVehicleClass == 5) 
		then
		{_lzSize = 50;};

		_lz = objNull;
		switch (_dialogLzAlgorithm) do
		{
			case 0:{_lz = _allLzs call BIS_fnc_selectRandom;};
			case 1:{_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetNearest;};
			case 2:{_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetFarthest;};
			case 3: // Least used
			{_lz = _allLzs call BIS_fnc_selectRandom;
				{	if (_x getVariable ["Ares_Lz_Count", 0] < _lz getVariable ["Ares_Lz_Count", 0]) 
					then
					{_lz = _x;};
				} forEach _allLzs;
			};
			default{_lz = _allLzs select (_dialogLzAlgorithm - 4);};
		};

		_lz setVariable ["Ares_Lz_Count", (_lz getVariable ["Ares_Lz_Count", 0]) + 1];

		_pool = _validPools select _dialogPool;
		_side = _pool select 1;

		if (count (_pool select 11) == 0) exitWith
		{[objNull, "No infantry squads defined for side."] call bis_fnc_showCuratorFeedbackMessage;};
		_vehiclePoolIndex = (_dialogVehicleClass + 3);

		if (count (_pool select _vehiclePoolIndex) == 0) exitWith
		{[objNull, "Vehicle pool had no vehicles defined for this faction."] call bis_fnc_showCuratorFeedbackMessage;};
		
		_vehNames = [];
		_vehPool = [];
		{_vehName = getText (configFile >> "CfgVehicles" >> _x >> "displayname");_vehNames pushBack _vehName;_vehPool pushBack _x;} forEach (_pool select _vehiclePoolIndex);

		_dialog2Result = ["Choose Vehicle Type",[["Type", _vehNames],["On Station",["0","30","60","120"]],["Number of teams", ["1","2","3","4"]],["Size of teams",["3","4","5","6"]]]] call Ares_fnc_ShowChooseDialog;
		
		if (count _dialog2Result == 0) exitWith {};
		
		_dialog2TimeOut = _dialog2Result select 1;_dialog2TeamNumber = _dialog2Result select 2;_dialog2TeamSize = _dialog2Result select 3;
		
		_dialog2Type =  _dialog2Result select 0;

		_vehicleType = _vehPool select _dialog2Type;
		_vehicleGroup = ([_spawnPosition, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;

		_vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
		_vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, _lzSize];
		_vehicleUnloadWp setWaypointType "TR UNLOAD";

		_timeOut = switch (_dialog2TimeOut) do
		{	case 0: {5};
			case 1: {30};
			case 2: {60};
			case 3: {120};
			default {5};
		};
		(driver (vehicle (leader _vehicleGroup))) setSkill 1;

		if (_vehiclePoolIndex == 7 || _vehiclePoolIndex == 8) then 
		{
			{_x allowFleeing 0;} forEach (crew (vehicle (leader _vehicleGroup)));
			_vehicleUnloadWp setWaypointTimeout [_timeOut,_timeOut,_timeOut];
		}
		else
		{
			_vehicleUnloadWp setWaypointTimeout [_timeOut,_timeOut,_timeOut]; // Give the units some time to get away from truck
		};

		if (!(_vehicleType isKindOf "Air") && _dialogVehicleBehaviour == 2) then 
		{
			_dialogVehicleBehaviour = 0;
			[objNull, "Ground vehicles can't circle area, reset to: RTB & Despawn"] call bis_fnc_showCuratorFeedbackMessage;
		};

		if (_dialogVehicleBehaviour == 0) then
		{
			_vehicleReturnWp = _vehicleGroup addWaypoint [_spawnPosition, 0];
			_vehicleReturnWp setWaypointTimeout [5,5,5]; // Let the unit stop before being despawned.
			_vehicleReturnWp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} foreach thisList;"];
		};
		if (_dialogVehicleBehaviour == 1) then {};
		if (_dialogVehicleBehaviour == 2) then
		{
			private ["_dialog3Result"];
			_dialog3Result =
				["Circle Area",
					[
						["Size of Circle:", ["250m", "500m", "750m", "1000m"]],
						["Direction:", ["Clockwise", "Counter-Clockwise"]],
						["Fly Height:", ["50m", "100m", "200m", "300m"]],
						["Speed:", ["60kph","120kph","180kph"]]
					]
				] call Ares_fnc_ShowChooseDialog;

			if (count _dialog3Result < 1) exitWith
			{
				deleteVehicle (vehicle(leader _vehicleGroup));
				{deleteVehicle _x} forEach (units(leader _vehicleGroup));
				[objNull, "No input given, deleted vehicle and units"] call bis_fnc_showCuratorFeedbackMessage;
			};

			_radius = switch (_dialog3Result select 0) do
			{
				case 0: {250};
				case 1: {500};
				case 2: {750};
				case 3: {1000};
				default {250};
			};
			_speed = switch (_dialog3Result select 3) do
			{
				case 0: {60};
				case 1: {120};
				case 2: {180};
				default {120};
			};
			private ["_moveClockwise", "_delay", "_numberOfWaypoints", "_degreesPerWaypoint", "_centerPoint", "_waypoint"];
			_moveClockwise = (_dialog3Result select 1) == 0;
			
			_numberOfWaypoints = 6;
			_degreesPerWaypoint =  360 / _numberOfWaypoints;
			if (!_moveClockwise) then
			{
				_degreesPerWaypoint = _degreesPerWaypoint * -1;
			};
			_centerPoint = position _lz;
			for "_waypointNumber" from 0 to (_numberOfWaypoints - 1) do
			{
				private ["_currentDegrees"];
				_currentDegrees = _degreesPerWaypoint * _waypointNumber;
				_waypoint = _vehicleGroup addWaypoint [[_centerPoint, _radius, _currentDegrees] call BIS_fnc_relPos, 5];		
			};
			vehicle (leader _vehicleGroup) limitSpeed _speed;

			_waypoint1 = _vehicleGroup addWaypoint [[_centerPoint, _radius, 0] call BIS_fnc_relPos, 5];
			_waypoint1 setWaypointType "CYCLE";
			switch (_dialog3Result select 2) do
			{
				case 0: { _waypoint1 setWaypointStatements ["true", "(vehicle this) flyInHeight 50;"];};
				case 1: { _waypoint1 setWaypointStatements ["true", "(vehicle this) flyInHeight 100;"];};
				case 2: { _waypoint1 setWaypointStatements ["true", "(vehicle this) flyInHeight 200;"];};
				case 3: { _waypoint1 setWaypointStatements ["true", "(vehicle this) flyInHeight 300;"];};
				default { _waypoint1 setWaypointStatements ["true", "(vehicle this) flyInHeight 50;"];};
			};
		};
		[(units _vehicleGroup) + [(vehicle (leader _vehicleGroup))]] call Ares_fnc_AddUnitsToCurator;

		_vehicle = vehicle (leader _vehicleGroup);
		_emptyPos = _vehicle emptyPositions "Cargo";
		_teamNumber = _dialog2TeamNumber + 1;
		_teamSize = _dialog2TeamSize + 3;
		_num = 0;
		if ((_emptyPos/(_teamSize)) < (_teamNumber)) then 
		{
			_num = floor(_emptyPos/(_teamSize));
			if (_num < 1) then {_num = 1};
			[objNull, "Number of teams too big for vehicle, set to highest possible"] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			_num = _teamNumber;
		};

		for "_i" from 1 to _num do
		{
			private ["_squadMembers"];
			_squadMembers = (_pool select 11) call BIS_fnc_selectRandom;
			if ((count _squadMembers) >= _teamSize) then
			{
				_squadMembers resize _teamSize;
			};
			_freeSpace = _vehicle emptyPositions "Cargo";
			if (_freeSpace < count _squadMembers) then
			{
				// Trim the squad size so they will fit.
				_squadMembers resize _freeSpace;
			};
			
			_infantryGroup = [_spawnPosition, _side, _squadMembers] call BIS_fnc_spawnGroup;
			
			switch (_dialogUnitBehaviour) do
			{
				case 1: // Relaxed
				{
					_infantryGroup setBehaviour "SAFE";
					_infantryGroup setSpeedMode "LIMITED";
				};
				case 2: // Cautious
				{
					_infantryGroup setBehaviour "AWARE";
					_infantryGroup setSpeedMode "LIMITED";
				};
				case 3: // Combat
				{
					_infantryGroup setBehaviour "COMBAT";
					_infantryGroup setSpeedMode "NORMAL";
				};
			};

			if (count _allRps > 0) then
			{
				_rp = objNull;
				switch (_dialogRpAlgorithm) do
				{
					case 0: // Random
					{
						_rp = _allRps call BIS_fnc_selectRandom;
					};
					case 1: // Nearest
					{
						_rp = [position _lz, _allRps] call Ares_fnc_GetNearest;
					};
					case 2: // Furthest
					{
						_rp = [position _lz, _allRps] call Ares_fnc_GetFarthest;
					};
					case 3: // Least Used
					{
						_rp = _allRps call BIS_fnc_selectRandom; // Choose randomly to begin with.
						{
							if (_x getVariable ["Ares_Rp_Count", 0] < _rp getVariable ["Ares_Rp_Count", 0]) then
							{
								_rp = _x;
							}
						} forEach _allRps;
					};
					default
					{
						_rp = _allRps select (_dialogRpAlgorithm - 4);
					};
				};

				_rp setVariable ["Ares_Rp_Count", (_rp getVariable ["Ares_Rp_Count", 0]) + 1];
				
				_infantryRpWp = _infantryGroup addWaypoint [position _rp, _rpSize];
			}
			else {_infantryMoveOnWp = _infantryGroup addWaypoint [position _lz, _rpSize];};
			{_x moveInCargo (vehicle (leader _vehicleGroup));} foreach(units _infantryGroup);
			
			[(units _infantryGroup)] call Ares_fnc_AddUnitsToCurator;
		};

		if (count _allRps > 0) then
		{
			[objNull, "Transport dispatched to LZ. Squad will head to RP."] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			[objNull, "Transport dispatched to LZ. Squad will stay at LZ."] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
	] call Ares_fnc_RegisterCustomModule;
	["Reinforcements", "Spawn Supply Drop",
	{
		if (isNil "Ares_Reinforcement_Unit_Pools" || typeName Ares_Reinforcement_Unit_Pools != typeName [] || count Ares_Reinforcement_Unit_Pools == 0) exitWith
		{
			[objNull, "Unable to load unit pools. Is your 'Ares_Reinforcement_Unit_Pools.sqf' file corrupt?"] call bis_fnc_showCuratorFeedbackMessage;
		};
		
		private ["_allUnitPools"];
		if (isNil "Ares_Reinforcement_Mission_Unit_Pools") 
		then
		{
			_allUnitPools = Ares_Reinforcement_Unit_Pools;
		}
		else
		{
			_allUnitPools = Ares_Reinforcement_Unit_Pools + Ares_Reinforcement_Mission_Unit_Pools;
		};

		_allLzsUnsorted = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
		
		if (count _allLzsUnsorted == 0) exitWith
		{
			[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_allLzs = [_allLzsUnsorted, [], { _x getVariable ["SortOrder", 0]; }, "ASCEND"] call BIS_fnc_sortBy;

		_poolNames = [];
		_validPools = [];
		{	
			if ((_x select 2) == "" || isClass(configFile >> "CfgPatches" >> (_x select 2))) then
			{
				_poolNames pushBack (_x select 0);
				_validPools pushBack _x;
			};
		} forEach _allUnitPools;

		_lzOptions = ["Random", "Nearest", "Farthest", "Least Used"];
		{
			_lzOptions pushBack (name _x);
		} forEach _allLzs;

		_dialogResult = ["Create Supply Drop",
			[	
				["Side", _poolNames, 0],
				["Vehicle Type", ["Unarmed Helicopters", "Armed Helicopters"]],
				["Vehicle Landing Zone", _lzOptions]
			]
		] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult == 0) exitWith{};

		_dialogPool =             _dialogResult select 0;
		_dialogVehicleClass =     _dialogResult select 1;
		_dialogLzAlgorithm =      _dialogResult select 2;
		_spawnPosition = _this select 0;
		
		if (not isNil "Ares_CuratorObjectPlaces_LastPlacedObjectPosition") then
		{
			_spawnPosition = Ares_CuratorObjectPlaces_LastPlacedObjectPosition;
		};

		_lz = objNull;
		switch (_dialogLzAlgorithm) do
		{
			case 0:{_lz = _allLzs call BIS_fnc_selectRandom;};
			case 1:{_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetNearest;};
			case 2:{_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetFarthest;};
			case 3:{_lz = _allLzs call BIS_fnc_selectRandom;
				{	
					if (_x getVariable ["Ares_Lz_Count", 0] < _lz getVariable ["Ares_Lz_Count", 0]) then
					{
						_lz = _x;
					};
				} forEach _allLzs;
			};
			default{_lz = _allLzs select (_dialogLzAlgorithm - 4);};
		};

		_lz setVariable ["Ares_Lz_Count", (_lz getVariable ["Ares_Lz_Count", 0]) + 1];

		_pool = _validPools select _dialogPool;
		_side = _pool select 1;

		if (count (_pool select 11) == 0) exitWith
		{
			[objNull, "No infantry squads defined for side."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_vehiclePoolIndex = (_dialogVehicleClass + 7);

		if (count (_pool select _vehiclePoolIndex) == 0) exitWith
		{
			[objNull, "Vehicle pool had no vehicles defined for this faction."] call bis_fnc_showCuratorFeedbackMessage;
		};
		
		_vehNames = [];
		_vehPool = [];
		{
			_vehName = getText (configFile >> "CfgVehicles" >> _x >> "displayname");
			_vehNames pushBack _vehName;
			_vehPool pushBack _x;
		} forEach (_pool select _vehiclePoolIndex);

		_dialog2Result = ["Choose Vehicle & Cargo",
			[
				["Vehicle Type", _vehNames],
				["Cargo Type",["Ammo","Medical","Equipment","All"]]
			]
		] call Ares_fnc_ShowChooseDialog;
		
		if (count _dialog2Result == 0) exitWith {};
		
		_dialog2Type =  _dialog2Result select 0;
		_dialog2Cargo = _dialog2Result select 1;
		
		_vehicleType = _vehPool select _dialog2Type;
		_vehicleGroup = ([_spawnPosition, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;

		_vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
		_vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, 0];
		_vehicleUnloadWp setWaypointType "UNHOOK";
		
		(driver (vehicle (leader _vehicleGroup))) setSkill 1;

		{_x allowFleeing 0;} forEach (crew (vehicle (leader _vehicleGroup)));
			
		[(units _vehicleGroup) + [(vehicle (leader _vehicleGroup))]] call Ares_fnc_AddUnitsToCurator;
		
		//Crate spawning
		_vehicle = vehicle (leader _vehicleGroup);
		_crate = "B_supplyCrate_F" createVehicle _spawnPosition;
		
		_cargo = _dialog2Cargo;
		[_crate,_cargo] execVM "Ares additions\resupply.sqf";
		
		_vehicle setSlingLoad _crate;
		
		_vehicleReturnWp = _vehicleGroup addWaypoint [_spawnPosition, 0];
		_vehicleReturnWp setWaypointTimeout [5,5,5]; // Let the unit stop before being despawned.
		_vehicleReturnWp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} foreach thisList;"];
		[_crate] call Ares_fnc_AddUnitsToCurator;
	}
	] call Ares_fnc_RegisterCustomModule;
    ["Reinforcements", "Pick Up Cargo", 
	{
		if (isNil "Ares_Reinforcement_Unit_Pools" || typeName Ares_Reinforcement_Unit_Pools != typeName [] || count Ares_Reinforcement_Unit_Pools == 0) exitWith
		{
			[objNull, "Unable to load unit pools. Is your 'Ares_Reinforcement_Unit_Pools.sqf' file corrupt?"] call bis_fnc_showCuratorFeedbackMessage;
		};
		
		private ["_allUnitPools"];
		if (isNil "Ares_Reinforcement_Mission_Unit_Pools") 
		then
		{
			_allUnitPools = Ares_Reinforcement_Unit_Pools;
		}
		else
		{
			_allUnitPools = Ares_Reinforcement_Unit_Pools + Ares_Reinforcement_Mission_Unit_Pools;
		};

		_allLzsUnsorted = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
		
		if (count _allLzsUnsorted == 0) exitWith
		{
			[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_allLzs = [_allLzsUnsorted, [], { _x getVariable ["SortOrder", 0]; }, "ASCEND"] call BIS_fnc_sortBy;

		_poolNames = [];
		_validPools = [];
		{	
			if ((_x select 2) == "" || isClass(configFile >> "CfgPatches" >> (_x select 2))) then
			{
				_poolNames pushBack (_x select 0);
				_validPools pushBack _x;
			};
		} forEach _allUnitPools;

		_lzOptions = ["Random", "Nearest", "Farthest", "Least Used"];
		{
			_lzOptions pushBack (name _x);
		} forEach _allLzs;

		_dialogResult = ["Create Supply Drop",
			[	
				["Side", _poolNames, 0],
				["Vehicle Type", ["Unarmed Helicopters", "Armed Helicopters"]],
				["Vehicle Landing Zone", _lzOptions]
			]
		] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult == 0) exitWith{};

		_dialogPool =             _dialogResult select 0;
		_dialogVehicleClass =     _dialogResult select 1;
		_dialogLzAlgorithm =      _dialogResult select 2;
		_spawnPosition = _this select 0;
		
		if (not isNil "Ares_CuratorObjectPlaces_LastPlacedObjectPosition") then
		{
			_spawnPosition = Ares_CuratorObjectPlaces_LastPlacedObjectPosition;
		};

		_lz = objNull;
		switch (_dialogLzAlgorithm) do
		{
			case 0:{_lz = _allLzs call BIS_fnc_selectRandom;};
			case 1:{_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetNearest;};
			case 2:{_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetFarthest;};
			case 3:{_lz = _allLzs call BIS_fnc_selectRandom;
				{	
					if (_x getVariable ["Ares_Lz_Count", 0] < _lz getVariable ["Ares_Lz_Count", 0]) then
					{
						_lz = _x;
					};
				} forEach _allLzs;
			};
			default{_lz = _allLzs select (_dialogLzAlgorithm - 4);};
		};

		_lz setVariable ["Ares_Lz_Count", (_lz getVariable ["Ares_Lz_Count", 0]) + 1];
		
		_pool = _validPools select _dialogPool;
		_side = _pool select 1;

		if (count (_pool select 11) == 0) exitWith
		{
			[objNull, "No infantry squads defined for side."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_vehiclePoolIndex = (_dialogVehicleClass + 7);

		if (count (_pool select _vehiclePoolIndex) == 0) exitWith
		{
			[objNull, "Vehicle pool had no vehicles defined for this faction."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_objects = _spawnPosition nearEntities  [["Car", "Thing"], 100];
		if (count _objects < 1) exitWith
		{
			[objNull, "No objects near spawn point."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_cargoNames = [];
		_cargoPool = [];
		{
			_cargoName = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname");
			_cargoNames pushBack _cargoName;
		} forEach _objects;
		
		_vehNames = [];
		_vehPool = [];
		{
			_vehName = getText (configFile >> "CfgVehicles" >> _x >> "displayname");
			_vehNames pushBack _vehName;
			_vehPool pushBack _x;
		} forEach (_pool select _vehiclePoolIndex);

		_dialog2Result = ["Choose Vehicle & Cargo",
			[
				["Vehicle Type", _vehNames],
				["Cargo Choice", _cargoNames]
			]
		] call Ares_fnc_ShowChooseDialog;
		
		if (count _dialog2Result == 0) exitWith {};
		
		_dialog2Type =  _dialog2Result select 0;
		_dialog2Cargo = _dialog2Result select 1;
		
		_vehicleType = _vehPool select _dialog2Type;
		_vehicleGroup = ([_spawnPosition, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;
		_vehicle = vehicle (leader _vehicleGroup);
	
		_vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
		_vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, 50];
		_vehicleUnloadWp setWaypointType "UNHOOK";
		
		(driver (vehicle (leader _vehicleGroup))) setSkill 1;

		{_x allowFleeing 0;} forEach (crew (vehicle (leader _vehicleGroup)));

		if !(_vehicle canSlingLoad (_objects select _dialog2Cargo)) exitWith
			{
				deleteVehicle (vehicle(leader _vehicleGroup));
				{deleteVehicle _x} forEach (units(leader _vehicleGroup));
				[objNull, "Chosen object is too heavy for chosen vehicle"] call bis_fnc_showCuratorFeedbackMessage;
			};
		
		_vehicle setSlingLoad (_objects select _dialog2Cargo);
		
		_vehicleReturnWp = _vehicleGroup addWaypoint [_spawnPosition, 0];
		_vehicleReturnWp setWaypointTimeout [5,5,5]; // Let the unit stop before being despawned.
		_vehicleReturnWp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} foreach thisList;"];

		[(units _vehicleGroup) + [(vehicle (leader _vehicleGroup))]] call Ares_fnc_AddUnitsToCurator;	
	}] call Ares_fnc_RegisterCustomModule;
};