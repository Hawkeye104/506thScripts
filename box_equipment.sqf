/*
CHANGELOG

06JAN15
- Added Laser designator batteries (10)

05MAR15
- Added SMGR

06APR15
- Added if(isServer)
- Moved backpack radios to VA
*/
if (isServer) then {
	_crate = _this select 0;
	 
	clearMagazineCargoGlobal _crate;  
	clearBackpackCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;    
	clearItemCargoGlobal _crate;
	 
	_crate addItemCargoGlobal ["ACE_Vector",50];
	_crate addItemCargoGlobal ["Laserdesignator",5];
	_crate addItemCargoGlobal ["Rangefinder", 50];
	_crate addItemCargoGlobal ["ItemRadio",100];
	_crate addItemCargoGlobal ["ItemSMGR", 10];

	_crate addMagazineCargoGlobal["Laserbatteries", 10];
};
