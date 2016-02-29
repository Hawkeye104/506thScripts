
	/*
	50 - smoothest, less lag
	25 - default in multiplayer
	12.5 - default in singleplayer
	6.25
	3.125 - bumpiest, higher lag
	*/

 if (!local _unit) exitWith {};
	
	player removeAction view;
	view1 = player addAction ["Grass Off", {
	setTerrainGrid 50;
	player removeAction view;
	player removeAction view1;
	player removeAction view2;
	player removeAction view3;
	player removeAction view4;
	player removeAction view5;
	player removeAction view6;
	player removeAction view7;
	view = player addAction ["Settings", "scripts\Viewdistance.sqf", [],-99,false,false];
	}, [],-93,false,false,"","alive player"];
	
	view2 = player addAction ["Low", {
	setTerrainGrid 25; 
	player removeAction view;
	player removeAction view1;
	player removeAction view2;
	player removeAction view3;
	player removeAction view4;
	player removeAction view5;
	player removeAction view6;
	player removeAction view7;
	view = player addAction ["Settings", "scripts\Viewdistance.sqf", [],-99,false,false];
	}, [],-94,false,false,"","alive player"];
	
	view3 = player addAction ["Normal", {
	setTerrainGrid 12.5; 
	player removeAction view;
	player removeAction view1;
	player removeAction view2;
	player removeAction view3;
	player removeAction view4;
	player removeAction view5;
	player removeAction view6;
	player removeAction view7;
	view = player addAction ["Settings", "scripts\Viewdistance.sqf", [],-99,false,false];
	}, [],-95,false,false,"","alive player"];
	
	view4 = player addAction ["High", {
	setTerrainGrid 6.25; 
	player removeAction view;
	player removeAction view1;
	player removeAction view2;
	player removeAction view3;
	player removeAction view4;
	player removeAction view5;
	player removeAction view6;
	player removeAction view7;
	view = player addAction ["Settings", "scripts\Viewdistance.sqf", [],-99,false,false];
	}, [],-96,false,false,"","alive player"];
	
	view5 = player addAction ["Ultra", {
	setTerrainGrid 3.125; 
	player removeAction view;
	player removeAction view1;
	player removeAction view2;
	player removeAction view3;
	player removeAction view4;
	player removeAction view5;
	player removeAction view6;
	player removeAction view7;
	view = player addAction ["Settings", "scripts\Viewdistance.sqf", [],-99,false,false];
	}, [],-97,false,false,"","alive player"];
	
	view6 = player addAction ["", {}, [],-98,false,false,"","alive player"];
	
	view7 = player addAction ["Disable Settings", {
	player removeAction view;
	player removeAction view1;
	player removeAction view2;
	player removeAction view3;
	player removeAction view4;
	player removeAction view5;
	player removeAction view6;
	player removeAction view7;
	}, [],-99,false,false,"","alive player"];
	
