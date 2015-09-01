// Prevent stomping on any other existing mission definitions
if (isNil "Ares_Reinforcement_Mission_Unit_Pools") then
{
    Ares_Reinforcement_Mission_Unit_Pools = [];
};

Ares_Reinforcement_Mission_Unit_Pools pushBack
[
	"RUSSIAN", // Name of the faction
	east, // The side of the faction
	"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
	[
		"rhs_uaz_vdv", 
		"rhs_uaz_open_vdv", 
		"rhs_tigr_vdv",
		"rhs_tigr_3camo_vdv"
	], // Scouts and unarmed light vehicles
	[
		"rhs_btr60_vdv",
		"rhs_btr70_vdv",
		"rhs_btr80_vdv",
		"rhs_btr80a_vdv"
	], // Armed light vehicles
	[
		"RHS_Ural_VDV_01", 
		"RHS_Ural_Open_VDV_01", 
		"rhs_gaz66_vdv", 
		"rhs_gaz66o_vdv"
	], // Dedicated troop trucks
	[
		"rhs_bmd1",
		"rhs_bmd2", 
		"rhs_bmd4_vdv",
		"rhs_bmp1_vdv",
		"rhs_bmp2_vdv"
	], // Armed + Armored Troop Transports
	[
		"RHS_Mi8mt_Cargo_vdv", 
		"RHS_Mi8AMT_vdv"
	], // Unarmed helicopters
	[
		"RHS_Mi24P_AT_vdv",
		"RHS_Mi24P_CAS_vdv",
		"RHS_Mi8mt_vdv",
		"RHS_Mi8MTV3_vdv"
	], // Armed helicopters
	[
		"O_Boat_Transport_01_F", 
		"O_G_Boat_Transport_01_F"
	], // Unarmed boats
	[
		"O_Boat_Armed_01_hmg_F"
	], // Armed boats
	[
		// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
		[
			"rhs_vdv_sergeant", 
			"rhs_vdv_machinegunner", 
			"rhs_vdv_RShG2", 
			"rhs_vdv_rifleman", 
			"rhs_vdv_machinegunner_assistant",
			"rhs_vdv_rifleman"
		],
		[
			"rhs_vdv_sergeant", 
			"rhs_vdv_RShG2", 
			"rhs_vdv_grenadier", 
			"rhs_vdv_medic", 
			"rhs_vdv_engineer",
			"rhs_vdv_rifleman"
		]
	]
];
Ares_Reinforcement_Mission_Unit_Pools pushBack
[
	"US ARMY", // Name of the faction
	west, // The side of the faction
	"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
	[	
		"rhsusf_m1025_d",
		"rhsusf_m1025_w",
		"rhsusf_m998_d_2dr_fulltop", 
		"rhsusf_m998_w_2dr_fulltop", 
		"rhsusf_m998_d_4dr_fulltop",
		"rhsusf_m998_w_4dr_fulltop",
		"rhsusf_rg33_d",
		"rhsusf_rg33_wd"
	],// Scouts and unarmed light vehicles
	[	
		"rhsusf_m1025_d_m2", 
		"rhsusf_m1025_w_m2", 
		"rhsusf_m1025_d_Mk19", 
		"rhsusf_m1025_w_Mk19", 
		"DAR_MaxxPro", 
		"DAR_MaxxPro_MK19",
		"DAR_MaxxProDeploy",
		"DAR_MaxxProDXM",
		"DAR_MaxxProPlus",
		"rhsusf_m113d_usarmy", 
		"rhsusf_m113_usarmy"
	],// Armed light vehicles
	[
		"rhsusf_M1083A1P2_B_d_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_wd_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_d_open_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
	], // Dedicated troop trucks
	[
		"RHS_M2A3", 
		"RHS_M2A3_wd", 
		"RHS_M2A3_BUSKI", 
		"RHS_M2A3_BUSKI_wd", 
		"RHS_M2A3_BUSKIII", 
		"RHS_M2A3_BUSKIII_wd"
	], // Armed + Armored Troop Transports
	[
		"RHS_UH60M_MEV",
		"RHS_UH60M_MEV2", 
		"RHS_UH1Y_UNARMED_d",
		"B_Heli_Light_01_F"
	],// Unarmed helicopters
	[
		"RHS_UH60M", 
		"RHS_CH_47F"
	], // Armed helicopters
	[
		"B_Boat_Transport_01_F", 
		"B_G_Boat_Transport_01_F"
	],// Unarmed boats
	[
		"B_Boat_Armed_01_minigun_F"
	], // Armed boats
	[
		// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
		[
			"rhsusf_army_ocp_squadleader",
			"rhsusf_army_ocp_teamleader", 
			"rhsusf_army_ocp_autorifleman", 
			"rhsusf_army_ocp_riflemanat", 
			"rhsusf_army_ocp_medic",
			"rhsusf_army_ocp_rifleman_m4"
		],
		[
			"rhsusf_army_ocp_teamleader", 
			"rhsusf_army_ocp_autorifleman", 
			"rhsusf_army_ocp_rifleman_m4", 
			"rhsusf_army_ocp_grenadier",
			"rhsusf_army_ocp_rifleman_m4",
			"rhsusf_army_ocp_riflemanat"
		]
	]
];
Ares_Reinforcement_Mission_Unit_Pools pushBack
[
	"EASTERN EUROPEAN REBELS", // Name of the faction
	resistance, // The side of the faction
	"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
	[
		"506th_eereb_UAZ", 
		"506th_eereb_gaz"
	], // Scouts and unarmed light vehicles
	[
		"506th_BTR_60",
		"506th_eereb_btr80",
		"506th_eereb_technical"
	], // Armed light vehicles
	[
		"506th_eereb_ural_closed", 
		"506th_eereb_URAL_OPEN"
	], // Dedicated troop trucks
	[
		"506th_eereb_bmp2"
	], // Armed + Armored Troop Transports
	[
		"506th_mi8_amt"
	], // Unarmed helicopters
	[
		"506th_mi8_mtv", 
		"506th_mi24"
	], // Armed helicopters
	[
		"I_Boat_Transport_01_F", 
		"I_G_Boat_Transport_01_F"
	], // Unarmed boats
	[
		"I_Boat_Armed_01_hmg_F"
	], // Armed boats
	[
		// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
		[
			"506th_eereb_squadleader",
			"506th_eereb_teamleader",
			"506th_eereb_machinegunner",
			"506th_eereb_riflemanrpg",
			"506th_eereb_rifleman",
			"506th_eereb_grenadier"
		],
		[
			"506th_eereb_teamleader",
			"506th_eereb_machinegunner",
			"506th_eereb_grenadier",
			"506th_eereb_riflemanrpg7",
			"506th_eereb_medic",
			"506th_eereb_rifleman"
		]
	]
];
