// nul = [this] execVM "box_resupply.sqf"
/*
CHANGELOG

06JAN15
- Initial creation

13JAN15
- Javelin tube to Javelin missile
- Added M136 HP x2
*/

_box = _this select 0;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

// AT
_box addWeaponCargoGlobal ["rhs_weap_M136_hp", 2];
_box addMagazineCargoGlobal ["rhs_m136_hp_mag", 2];
_box addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 2];

// Ammo
_box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 100];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 40];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 20];
_box addMagazineCargoGlobal ["rhs_mag_M433_HEDP", 12];
_box addMagazineCargoGlobal ["rhs_mag_M441_HE", 12];

// Equipment

_box addMagazineCargoGlobal ["SmokeShell", 40];
_box addMagazineCargoGlobal ["SmokeShellGreen", 20];
_box addMagazineCargoGlobal ["HandGrenade", 20];

// Medical
_box addItemCargoGlobal ["AGM_Bandage", 100];
_box addItemCargoGlobal ["AGM_Morphine", 20];
_box addItemCargoGlobal ["AGM_Epipen", 20];
_box addItemCargoGlobal ["AGM_Bloodbag", 8];
