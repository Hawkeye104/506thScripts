/*
CHANGELOG

06JAN15
- Removed weapons, optics, morphine, epi, blood bags, and vectors

07May2015
removed AGM
add ACE
*/

_veh = _this select 0;

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

_veh addweaponCargoGlobal ["rhs_weap_M136", 1];

_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 30];
_veh addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", 30];
_veh addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 20];
_veh addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 20];
_veh addMagazineCargoGlobal ["SmokeShell", 10];
_veh addMagazineCargoGlobal ["SmokeShellGreen", 10];
_veh addMagazineCargoGlobal ["HandGrenade", 10];
_veh addMagazineCargoGlobal ["rhs_m136_mag", 1];

_veh addItemCargoGlobal ["ACE_Bandage", 30];
