_box = _this select 0;
_cargo = _this select 1;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

switch (_cargo) do 
{

	//AMMO
	case 0: 
	{
		_box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 50];
		_box addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 20];
		_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 10];
		_box addMagazineCargoGlobal ["rhs_mag_M441_HE", 20];
		_box addMagazineCargoGlobal ["SmokeShell", 40];
		_box addMagazineCargoGlobal ["SmokeShellGreen", 5];
		_box addMagazineCargoGlobal ["HandGrenade", 20];
		_box addWeaponCargoGlobal ["rhs_weap_M136", 4];
		_box addMagazineCargoGlobal ["rhs_m136_mag", 4];
		_box addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 2];
	};
	
	//MEDICAL
	case 1: 
	{
		_box addItemCargoGlobal ["ACE_fieldDressing", 100];
		_box addItemCargoGlobal ["ACE_Morphine", 20];
		_box addItemCargoGlobal ["ACE_epinephrine", 20];
		_box addItemCargoGlobal ["ACE_bloodIV_250", 5];
		_box addItemCargoGlobal ["ACE_bodyBag", 5];
	};
		
	//EQUIPMENT
	case 2: 
	{
		_box addItemCargoGlobal ["ACE_Vector",5];
		_box addItemCargoGlobal ["lerca_1200_black",2];
		_box addItemCargoGlobal ["Laserdesignator",2];
		_box addItemCargoGlobal ["ItemRadio",20];
		_box addItemCargoGlobal ["meu_MX2A_tan",2];
		_box addItemCargoGlobal ["tf_microdagr",2];
		_box addItemCargoGlobal ["ItemGPS",2];
		_box addItemCargoGlobal ["rhsusf_ANPVS_15_full",2];
		_box addItemCargoGlobal ["ItemcTab",1];
		_box addItemCargoGlobal ["ACE_Clacker",1];
		_box addItemCargoGlobal ["ACE_DefusalKit",1];
		_box addItemCargoGlobal ["ACE_wirecutter",1];
		_box addItemCargoGlobal ["ACE_EarPlugs",20];
		_box addItemCargoGlobal ["ACE_CableTie",10];
		_box addMagazineCargoGlobal["Laserbatteries",5];
	};
	
	//EVERYTHING
	case 3: 
	{
		_box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 50];
		_box addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 20];
		_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 10];
		_box addMagazineCargoGlobal ["rhs_mag_M441_HE", 20];
		_box addMagazineCargoGlobal ["SmokeShell", 40];
		_box addMagazineCargoGlobal ["SmokeShellGreen", 5];
		_box addMagazineCargoGlobal ["HandGrenade", 20];
		_box addWeaponCargoGlobal ["rhs_weap_M136", 4];
		_box addMagazineCargoGlobal ["rhs_m136_mag", 4];
		_box addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 2];
		_box addItemCargoGlobal ["ACE_fieldDressing", 100];
		_box addItemCargoGlobal ["ACE_Morphine", 20];
		_box addItemCargoGlobal ["ACE_epinephrine", 20];
		_box addItemCargoGlobal ["ACE_bloodIV_250", 5];
		_box addItemCargoGlobal ["ACE_bodyBag", 5];
		_box addItemCargoGlobal ["ACE_Vector",5];
		_box addItemCargoGlobal ["lerca_1200_black",2];
		_box addItemCargoGlobal ["Laserdesignator",2];
		_box addItemCargoGlobal ["ItemRadio",20];
		_box addItemCargoGlobal ["meu_MX2A_tan",2];
		_box addItemCargoGlobal ["tf_microdagr",2];
		_box addItemCargoGlobal ["ItemGPS",2];
		_box addItemCargoGlobal ["rhsusf_ANPVS_15_full",2];
		_box addItemCargoGlobal ["ItemcTab",1];
		_box addItemCargoGlobal ["ACE_Clacker",1];
		_box addItemCargoGlobal ["ACE_DefusalKit",1];
		_box addItemCargoGlobal ["ACE_wirecutter",1];
		_box addItemCargoGlobal ["ACE_EarPlugs",20];
		_box addItemCargoGlobal ["ACE_CableTie",10];
		_box addMagazineCargoGlobal["Laserbatteries",5];
	};
};