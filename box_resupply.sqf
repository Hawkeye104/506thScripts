
/*
null = [this] execVM "box_resupply.sqf"
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
_box addMagazineCargoGlobal ["tf47_m3maaws_HEAT", 3];

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
_box addItemCargoGlobal ["ACE_fieldDressing", 100];
_box addItemCargoGlobal ["ACE_Morphine", 20];
_box addItemCargoGlobal ["ACE_epinephrine", 20];
_box addItemCargoGlobal ["ACE_bloodIV_250", 5];
_box addItemCargoGlobal ["ACE_bodyBag", 5];
