
$opaque
$modelname v92/weapons/bf3/m320/world
$model	"M320"	m320_base
$bodygroup Grip
{
	studio m320_Grip
	blank
}
$bodygroup Tube
{
	studio m320_tube
	blank
}
$bodygroup Stock
{
	studio m320_stock_in
	studio m320_stock_mid
	studio m320_stock_out
	blank
}
$bodygroup Sight
{
	studio m320_sight
	blank
}
$bodygroup Grenade
{
	blank
	studio m320_nade_full
	studio m320_nade_shell
}

$cdmaterials models/v92/weapons/bf3/m320
$cdmaterials models/v92/weapons/bf3/common
$surfaceprop weapon
$Attachment "muzzle" "muzzle" 0 0 0 rotate 0 0 0
$Attachment "eject" "shell" 0 0 0 rotate 0 0 0
$contents solid
$sequence idle m320_base { fps 30 snap }

$collisionmodel	m320_phy
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave

}

