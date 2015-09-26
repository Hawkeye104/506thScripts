/*
CHANGELOG
26SEP15
- Added 6 x "rhsusf_100Rnd_556x45_soft_pouch"
- Added 3 x "rhsusf_100Rnd_762x51"
- Added 3 x "rhsusf_100Rnd_762x51_m993"
- Added 1 x "rhs_fgm148_magazine_AT"
- Added 2 x "tf47_m3maaws_HEAT"
01SEP15
- Removed "Rangefinder"
- Removed "meu_MX2A_tan"
06AUG15
- Added "ACE_MX2A"
15JUL15
- Added "rhsusf_opscore_03_ocp"
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
	_crate addItemCargoGlobal ["rhsusf_opscore_03_ocp",1];
	_crate addItemCargoGlobal ["lerca_1200_black",50];
	_crate addItemCargoGlobal ["lerca_1200_tan",50];
	_crate addItemCargoGlobal ["Laserdesignator",5];
	_crate addItemCargoGlobal ["ItemRadio",100];
	_crate addItemCargoGlobal ["ItemSMGR", 10];
	_crate addMagazineCargoGlobal["rhsusf_100Rnd_556x45_soft_pouch", 6];
	_crate addMagazineCargoGlobal["rhsusf_100Rnd_762x51", 3];
	_crate addMagazineCargoGlobal["rhsusf_100Rnd_762x51_m993", 3];
	_crate addMagazineCargoGlobal["rhs_fgm148_magazine_AT", 1];
	_crate addMagazineCargoGlobal["tf47_m3maaws_HEAT", 2];
	_crate addMagazineCargoGlobal["Laserbatteries", 10];
};
