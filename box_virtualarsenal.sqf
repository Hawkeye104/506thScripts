/* 
null = [this] execVM "scripts\box_virtualarsenal.sqf";
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
	"G_Lowprofile",
	"rhs_googles_clear",
	"rhs_googles_orange",
	"rhs_googles_yellow",
	"rhs_googles_black",
	"rhs_ess_black"
];
 
_availableUniforms = [
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
	"B_Mortar_01_support_F",
	"B_Mortar_01_weapon_F",
	"B_Carryall_cbr",
	"B_Carryall_mcamo",
	"B_Kitbag_mcamo",
	"B_Kitbag_cbr",
	"B_Parachute",
	"tf_rt1523g_rhs",
	"tf_rt1523g_big_rhs",
	"506th_assault_eagleaiii_coy_Medic",
	"rhs_M225_Gun_Bag",
	"rhs_M170_Bipod_Bag",
	"B_AssaultPack_cbr"
];
 
_availableItems = [
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"rhsusf_ANPVS_15_ng",
	"rhsusf_ANPVS_14_full",
	"rhsusf_ANPVS_15_full",
	"rhsusf_ANPVS_14_oval",
	"rhsusf_ANPVS_14_full_ng",
	"rhsusf_ANPVS_15_full_ng",
	"rhsusf_ANPVS_14_oval_ng",
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"ToolKit",
	"MineDetector",
	"ItemcTabHCam", // ctab, helmet cam
	"ItemAndroid", // ctab, android bft
	"ItemcTab", // ctab, commander tablet
	"ItemMicroDAGR", // ctab, microdagr gps
	"B_UavTerminal",
	"ACE_HuntIR_monitor",
	"ACE_M26_Clacker",
	"ACE_Clacker",
	"ACE_DefusalKit",
	"ACE_wirecutter",
	"ACE_EarPlugs",
	"ACE_CableTie",
	"ACE_MapTools",
	"ACE_Kestrel4500",
	"ACE_Altimeter",	
	"ACE_fieldDressing",
	"ACE_Morphine",
	"ACE_epinephrine",
	"ACE_bloodIV_250",
	"ACE_UAVBattery",
	"ACE_TacticalLadder_Item",
	"ACE_bodyBag",
	"ACE_Tripod",
	"ACE_Flashlight_MX991",
	"TIAD_506th_UAV_Item"
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
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_LEUPOLDMK4",
	"tf47_optic_m3maaws",
	"FHQ_optic_ACOG",
	"FHQ_optic_AimM_BLK",
	"FHQ_optic_HWS_G33",
	"FHQ_optic_HWS",
	"FHQ_optic_AC11704",
	"FHQ_optic_TWS3050",
	"optic_tws",
	"optic_tws_mg"	
];
 
_availableMagazines = [
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"ACE_HuntIR_M203",
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_8Rnd_00Buck",
	"rhsusf_8Rnd_Slug",
	"rhsusf_5Rnd_00Buck",
	"rhsusf_5Rnd_Slug",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhsusf_100Rnd_762x51",
	"rhsusf_100Rnd_762x51_m993",
	"RH_15Rnd_9x19_M9",
	"rhsusf_mag_15Rnd_9x19_FMJ",
	"rhsusf_mag_15Rnd_9x19_JHP",
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
	"tf47_m3maaws_HEAT",
	"rhs_fgm148_magazine_AT"
];

_availableGrenades = [ 
	"DemoCharge_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"ATMine_Range_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"APERSBoundingMine_Range_Mag",
	"SmokeShell",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellYellow",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Yellow",
	"rhs_mag_mk84",
	"HandGrenade",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_blue",
	"Chemlight_yellow",
	"B_IR_Grenade"
];

_availableWeapons = [
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
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m240B_CAP",
	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_fgm148",
	"tf47_m3maaws",
	"RH_m9",
	"rhsusf_weap_m9",
	"Binocular"
];
 
// Populate with predefined items and whatever is already in the crate
[_crate,((backpackCargo _crate) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableItems + _availableAccessories)] call BIS_fnc_addVirtualItemCargo;
[_crate,((magazineCargo _crate) + _availableMagazines + _availableGrenades)] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) + _availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;