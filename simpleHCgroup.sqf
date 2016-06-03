/*
Version 1
By Ryan [506th IR]
Simple script to delete emptyGroup's on the Headless Client.
Name the Virtual Headless Client HC_1, HC_2 in the mission editor.
Place the following:

emptyGroup = execVM "scripts\simpleHCgroup.sqf";

in init of the HC's
*/

while {true} do
{
	{if (count (units _x)==0) then {deleteGroup _x;};} forEach allGroups;
	sleep 300;
};