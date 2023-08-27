
$opaque
$modelname v92/weapons/bf3/m320/grenade
$bodygroup "M320 Grenade"
{
	studio m320_nade_full
	studio m320_nade_shell
}

$cdmaterials models/v92/weapons/bf3/m320
$cdmaterials models/v92/weapons/bf3/common
$surfaceprop weapon
$contents solid
$sequence idle m320_nade_full { fps 30 snap }

$collisionmodel	m320_nade_full
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	//$concave

}

