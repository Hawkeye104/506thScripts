// nul = [this] execVM "box_resupply.sqf"
/*
CHANGELOG

06JAN15
- Initial creation

13JAN15
- Javelin tube to Javelin missile
- Added M136 HP x2

07May2015
removed AGM
add ACE
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
_box addItemCargoGlobal ["ACE_atropine", 100];
_box addItemCargoGlobal ["ACE_Banana", 100];
_box addItemCargoGlobal ["ACE_bloodIV", 100];
_box addItemCargoGlobal ["ACE_bloodIV_250", 100];
_box addItemCargoGlobal ["ACE_bloodIV_500", 100];
_box addItemCargoGlobal ["ACE_bodybag", 100];
_box addItemCargoGlobal ["ACE_elasticBandage", 100];
_box addItemCargoGlobal ["ACE_epinephrine", 100];
_box addItemCargoGlobal ["ACE_fieldDressing", 100];
_box addItemCargoGlobal ["ACE_morphine", 100];
_box addItemCargoGlobal ["ACE_packingBandage", 100];
_box addItemCargoGlobal ["ACE_personalAidKit", 100];
_box addItemCargoGlobal ["ACE_PlasmaIV", 100];
_box addItemCargoGlobal ["ACE_PlasmaIV_250", 100];
_box addItemCargoGlobal ["ACE_PlasmaIV_500", 100];
_box addItemCargoGlobal ["ACE_quikclot", 100];
_box addItemCargoGlobal ["ACE_salineIV", 100];
_box addItemCargoGlobal ["ACE_salineIV_250", 100];
_box addItemCargoGlobal ["ACE_salineIV_500", 100];
_box addItemCargoGlobal ["ACE_surgicalKit", 100];
_box addItemCargoGlobal ["ACE_tourniquet", 100];"
