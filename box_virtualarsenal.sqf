/* 
CHANGELOG

05JAN15
- Added chemlights to _availableMagazines

06JAN15
- Added patchless OCP uniform
- Added new M4 variants (except bipod)
- Added new PEQ-15 Laser/Light combos
- Added AN/PVS-14 and 15

07JAN15
- Vanilla IR strobe 

10JAN15
- Added other AT4 variants and ammo

15FEB15
- Added M14, 20 rnd 7.62, Leupold optic

26FEB15
- Removed 1Cav uniforms and vanilla NVG's

02MAR15
- Added thermal optics

03MAR15
- New RHS equipment
- Separated out hand grenades, weapon accessories
*/

_crate = _this select 0;
["AmmoboxInit",[_crate,false,{true}]] spawn BIS_fnc_arsenal;
 
//Lists of items to include
_availableHeadgear = [
	"rhsusf_ach_helmet_headset_ess_ocp",
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ESS_ocp",
	"rhsusf_ach_helmet_headset_ocp",
	"rhsusf_hgu56p",
	"rhsusf_hgu56p_mask",
	"H_CrewHelmetHeli_B",
	"rhsusf_cvc_green_helmet",
	"rhsusf_cvc_green_ess",
	"RHS_jetpilot_usaf"
];
 
_availableGoggles = [
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_Spectacles_Tinted",
	"G_Lowprofile"
];
 
_availableUniforms = [
	"rhs_uniform_cu_ocp_patchless",
	"rhs_uniform_cu_ocp_101st",
	"U_B_PilotCoveralls",
	"U_B_HeliPilotCoveralls"
];
 
_availableVests = [
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_iotv_ocp_Teamleader",
	"V_TacVest_oli"
];
 
_availableBackpacks = [
	"rhsusf_assault_eagleaiii_ocp",
	"B_Carryall_cbr",
	"B_Carryall_mcamo",
	"B_Kitbag_mcamo",
	"B_Kitbag_cbr",
	"B_rhsusf_B_BACKPACK"
];
 
_availableItems = [
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"ItemAndroid",
	"ItemMicroDAGR",
	"ItemSMGR",
	"ToolKit",
	"ItemcTabHCam",
	"ItemcTab",
	"tf_microdagr",
	"AGM_M26_Clacker",
	"AGM_Clacker",
	"AGM_DefusalKit",
	"AGM_EarBuds",
	"AGM_CableTie",
	"AGM_MapTools",
	"AGM_ItemKestrel",
	"AGM_Altimeter",
	"AGM_Morphine",
	"AGM_Epipen",
	"AGM_Bandage",
	"AGM_Bloodbag"
];

_availableAccessories = [
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_compm4",
	"rhsusf_acc_ELCAN",
	"FHQ_optic_AimM_BLK",
	"FHQ_optic_HWS_G33",
	"FHQ_optic_HWS",
	"FHQ_optic_AC11704",
	"rhsusf_acc_LEUPOLDMK4",
	"optic_tws",
	"optic_tws_mg",
	"FHQ_optic_TWS3050",
	"rhsusf_acc_SF3P556"
];
 
_availableMagazines = [
	"30Rnd_556x45_Stanag",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_5Rnd_00Buck",
	"rhsusf_8Rnd_00Buck",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhsusf_100Rnd_762x51",
	"RH_15Rnd_9x19_M9",
	"rhs_mag_M433_HEDP",
	"rhs_mag_M441_HE",
	"rhs_mag_M4009",
	"rhs_mag_m576",
	"rhs_mag_M585_white",
	"rhs_mag_M661_green",
	"rhs_mag_M662_red",
	"rhs_mag_M713_red",
	"rhs_mag_M714_white",
	"rhs_mag_M715_green",
	"rhs_mag_M716_yellow",
	"rhs_m136_mag",
	"rhs_m136_hp_mag",
	"rhs_m136_hedp_mag",
	"rhs_fgm148_magazine_AT"
];

_availableGrenades = [ 
	"DemoCharge_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SmokeShell",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellYellow",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange",
	"AGM_HandFlare_Green",
	"AGM_HandFlare_Red",
	"AGM_HandFlare_White",
	"AGM_HandFlare_Yellow",
	"AGM_M84",
	"HandGrenade",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_blue",
	"Chemlight_yellow",
	"B_IR_Grenade"
];

_availableWeapons = [
	"rhs_weap_m4",
	"rhs_weap_m4_grip",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	"rhs_m4_m320",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_grip",
	"rhs_weap_m4a1_grip2",
	"rhs_weap_m4a1_m320",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_grip",
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle_pmag",
	"rhs_weap_M320",
	"rhs_weap_m14ebrri",
	"rhs_weap_m249_pip",
	"rhs_weap_m240B",
	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_fgm148",
	"RH_m9",
	"meu_MX2A_tan",
	"Binocular"
];
 
// Populate with predefined items and whatever is already in the crate
[_crate,((backpackCargo _crate) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableItems + _availableAccessories)] call BIS_fnc_addVirtualItemCargo;
[_crate,((magazineCargo _crate) + _availableMagazines + _availableGrenades)] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) + _availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;


