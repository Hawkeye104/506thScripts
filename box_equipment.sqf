/*
CHANGELOG
06AUG15
- Added "ACE_MX2A"
15JUL15
- Added "rhsusf_opscore_04_ocp"
24JUN15
- Added "rhsusf_acc_harris_bipod"
07MAy15
- Replaced "AGM_Vector" with "ACE_Vector"
- Added lerca_1200_black
- Added lerca_1200_tan
- Added meu_MX2A_tan

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
	_crate addItemCargoGlobal ["ACE_MX2A",50];
	_crate addItemCargoGlobal ["rhsusf_acc_harris_bipod",1];
	_crate addItemCargoGlobal ["rhsusf_opscore_04_ocp",1];
	_crate addItemCargoGlobal ["lerca_1200_black",50];
	_crate addItemCargoGlobal ["lerca_1200_tan",50];
	_crate addItemCargoGlobal ["Laserdesignator",5];
	_crate addItemCargoGlobal ["Rangefinder", 50];
	_crate addItemCargoGlobal ["ItemRadio",100];
	_crate addItemCargoGlobal ["ItemSMGR", 10];
	_crate addItemCargoGlobal ["meu_MX2A_tan",50];
	_crate addMagazineCargoGlobal["Laserbatteries", 10];
};
