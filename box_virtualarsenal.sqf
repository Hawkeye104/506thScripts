/* 
CHANGELOG
15AUG15
- Added "ACE_TacticalLadder_Item"
- Added "TIAD_506th_UAV_Item"
- Added "O_Mortar_01_support_F"
- Added "O_Mortar_01_weapon_F"

06AUG15
- Added "ACE_TacticalLadder_Pack"
- Added "ACE_HuntIR_monitor"
- Added "ACE_HuntIR_M203"

15JUL15
- Added "rhsusf_100Rnd_762x51_m993"
24JUN15
- Removed "rhsusf_acc_harris_bipod"
- Removed "bipod_01_F_blk"
- Removed "ItemMicroDAGR"
- Removed "tf_microdagr"

07JUN15
- Removed "B_rhsusf_B_BACKPACK"
- Added "B_UAV_01_backpack_F"
- Added "B_UavTerminal"
- Added "ACE_UAVBattery"

16MAY15
-Added rhsusf_ANPVS_14_full
-Added rhsusf_ANPVS_15_full
-Added rhsusf_ANPVS_14_oval

08MAY15
- Added rhs_googles_orange
- Added rhs_googles_yellow
- Added rhsusf_assault_eagleaiii_coyM
- Added ACE_M26_Clacker
- Added ACE_Clacker
- Added ACE_DefusalKit
- Added ACE_wirecutter
- Added ACE_EarPlugs
- Added ACE_CableTie
- Added ACE_MapTools
- Added ACE_Kestrel4500
- Added ACE_Altimeter
- Added ACE_fieldDressing
- Added ACE_Morphine
- Added ACE_epinephrine
- Added ACE_bloodIV_250
- Added ACE_bodyBag
- Added bipod_01_F_blk
- Added B_IR_Grenade
- Added rhsusf_acc_harris_bipod
- Added ACE_HandFlare_Green
- Added ACE_HandFlare_Red
- Added ACE_HandFlare_White
- Added ACE_HandFlare_Yellow
- Added ACE_M84
- Removed meu_MX2A_tan (added it to box_equipment.sqf)

07MAY15
- Removed AGM Items

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

09MAR15
- Removed all M4s

24MAR15
- Removed patchless OCP uniform
- Added parachute

06APR15
- Moved backpack radios from equipment box to VA
- Added RHS ballistic goggles
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
	"rhs_googles_black"
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
	"ACE_TacticalLadder_Pack",
	"O_Mortar_01_weapon_F",
	"O_Mortar_01_support_F",
	"B_Carryall_cbr",
	"B_Carryall_mcamo",
	"B_Kitbag_mcamo",
	"B_Kitbag_cbr",
	"B_UAV_01_backpack_F",
	"B_Parachute",
	"tf_rt1523g_rhs",
	"tf_rt1523g_big_rhs",
	"rhsusf_assault_eagleaiii_coyM",
	"B_AssaultPack_cbr"
];
 
_availableItems = [
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"rhsusf_ANPVS_14_full",
	"rhsusf_ANPVS_15_full",
	"rhsusf_ANPVS_14_oval",
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"ItemAndroid",
	"ToolKit",
	"ItemcTabHCam",
	"ItemcTab",
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
	"TIAD_506th_UAV_Item",
	"ACE_bodyBag"
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
	"ACE_HuntIR_M203",
	"rhsusf_100Rnd_762x51_m993",
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
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Yellow",
	"ACE_M84",
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
	"rhs_weap_m249_pip",
	"rhs_weap_m240B",
	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_fgm148",
	"RH_m9",
	"Binocular"
];
 
// Populate with predefined items and whatever is already in the crate
[_crate,((backpackCargo _crate) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableItems + _availableAccessories)] call BIS_fnc_addVirtualItemCargo;
[_crate,((magazineCargo _crate) + _availableMagazines + _availableGrenades)] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) + _availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;
