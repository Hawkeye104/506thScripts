/*
CHANGELOG

06JAN15
- Added Laser designator batteries (10)
*/

_crate = _this select 0;
 
clearMagazineCargoGlobal _crate;  
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;    
clearItemCargoGlobal _crate;
 
_crate addItemCargoGlobal ["AGM_Vector",50];
_crate addItemCargoGlobal ["Laserdesignator",5];
_crate addItemCargoGlobal ["Rangefinder", 50];
_crate addItemCargoGlobal ["ItemRadio",100];

_crate addMagazineCargoGlobal["Laserbatteries", 10];

_crate addBackpackCargoGlobal ["tf_rt1523g_rhs",15];
_crate addBackpackCargoGlobal ["tf_rt1523g_big_rhs",15];
