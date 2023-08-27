
$origin -2 10 -3 0
$surfaceprop weapon
$contents solid
$opaque

$modelname v92/weapons/bf3/m320/combo
$include c_arms_definebones.qci // include c_arms_definebones.qci in your model to ensure bones don't disappear.
$model M320 c_ref

$cdmaterials models/v92/weapons/bf3/m320
$cdmaterials models/v92/weapons/bf3/common

$ikchain rhand "ValveBiped.Bip01_R_Hand" Z 0 knee 0.707 0.707 0
$ikchain lhand "ValveBiped.Bip01_L_Hand" Z 0 knee 0.707 0.707 0
$illumposition -4 -20 -4
$hboxset "default"
$Attachment "muzzle" "muzzle" 0 0 0 rotate 0 0 0
$Attachment "eject" "shell_target" 0 0 0 rotate 0 0 0

$sequence "idle" "anim_idle_v2" {
	fps 1
	loop
	snap
	activity "ACT_VM_IDLE" 1
}

$sequence "draw" "anim_draw_v3" {
	fps 30
	snap
	activity "ACT_VM_DRAW" 1
	{ event AE_CL_PLAYSOUND 0 "BF3.Weapons.M320.Draw" }
	{ event AE_CL_PLAYSOUND 12 "BF3.Weapons.M320.ElevationUp" }
	{ event AE_CL_PLAYSOUND 20 "BF3.Weapons.M320.Safety" }
}

$sequence "holster" "anim_holster_v2" {
	fps 30
	activity "ACT_VM_HOLSTER" 1
	{ event AE_CL_PLAYSOUND 0 "BF3.Weapons.M320.Holster" }
	{ event AE_CL_PLAYSOUND 15 "BF3.Weapons.M320.Safety" }
	{ event AE_CL_PLAYSOUND 20 "BF3.Weapons.M320.ElevationDown" }
}

$sequence "Attack1" "anim_primary_1" {
	fps 10
	snap
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_CL_PLAYSOUND 0 "BF3.Weapons.M320.Foley" }
}

$sequence "Attack2" "anim_primary_2" {
	fps 10
	snap
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_CL_PLAYSOUND 0 "BF3.Weapons.M320.Foley" }
}

$sequence "Reload" "anim_reload_v6" {
	snap
	fps 30
	activity "ACT_VM_RELOAD" 1
	{ event AE_CL_PLAYSOUND 0 "BF3.Weapons.M320.Foley" }
	{ event AE_CL_PLAYSOUND 5 "BF3.Weapons.M320.OpenTube" }
	{ event AE_CL_PLAYSOUND 15 "BF3.Weapons.M320.RemoveShell" }
	{ event AE_CL_PLAYSOUND 30 "BF3.Weapons.M320.InsertShell" }
	{ event AE_CL_PLAYSOUND 33 "BF3.Weapons.M320.CloseTube" }
	{ event AE_CL_PLAYSOUND 40 "BF3.Weapons.M320.Foley" }
}

$collisionmodel	m320_phy
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave

}

