AddCSLuaFile()

simple_weapons.Include("Convars")

SWEP.Base = "simple_base"

SWEP.PrintName = "M320"
SWEP.Category = "Simple Weapons: Other"

SWEP.Slot = 4

SWEP.Spawnable = true

SWEP.UseHands = true

SWEP.ViewModelTargetFOV = 72

SWEP.ViewModel = Model("models/v92/weapons/bf3/m320/combo.mdl")
SWEP.WorldModel = Model("models/v92/weapons/bf3/m320/combo.mdl")

SWEP.HoldType = "shotgun"
SWEP.LowerHoldType = "passive"

SWEP.Firemode = 0

SWEP.Primary = {
	["Ammo"] = "SMG1_Grenade" , -- The ammo type used when reloading
	["Cost"] = 1 , -- The amount of ammo used per shot

	["ClipSize"] = 1 , -- The amount of ammo per magazine, -1/infinite is not supported at the moment
	["DefaultClip"] = 10 , -- How many rounds the player gets when picking up the weapon for the first time, excess ammo will be added to the player's reserves

	["Delay"] = 60 / 60 , -- Delay between shots, use 60 / x for RPM (Rounds per minute) values

	["Count"] = 1 , -- Optional: Shots fired per shot

	["Class"] = "simple_ent_hl2_40mm" ,
	["Sound"] = Sound( "BF3.Weapons.M320.Single" ) , -- Firing sound
}

SWEP.ViewOffset = Vector( 0 , 0 , -1 ) -- Optional: Applies an offset to the viewmodel's position

SWEP.NPCData = {
	["Delay"] = SWEP.Primary.Delay ,
	["Rest"] = { 
		SWEP.Primary.Delay * 3 ,
		SWEP.Primary.Delay * 5
	}
}

list.Add( "NPCUsableWeapons" , { 
	["class"] = "simple_bf3_m320" , 
	["title"] = "Simple Weapons: " .. SWEP.PrintName
} )

function SWEP:FireWeapon()

	local ply = self:GetOwner()
	local primary = self.Primary

	self:EmitFireSound()

	self:SendTranslatedWeaponAnim(ACT_VM_PRIMARYATTACK)

	ply:SetAnimation(PLAYER_ATTACK1)

	if SERVER then

		local ent = ents.Create( primary.Class )

		local dir = self:GetShootDir()
		local ang = dir:Angle()

		ent:SetPos(ply:GetShootPos())
		ent:SetAngles(ang)

		ent:SetOwner(ply)

		ent:SetVelocity(dir * 3000)

		ent:Spawn()
		ent:Activate()

	end

end

sound.Add( {
	["name"] = "BF3.Weapons.M320.Single" ,
	["channel"] = CHAN_WEAPON ,
	["volume"] = 1.0 ,
	["level"] = 75 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/single_1.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.Dry" ,
	["channel"] = CHAN_WEAPON ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/dry.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.Safety" ,
	["channel"] = CHAN_BODY ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/click.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.ElevationUp" ,
	["channel"] = CHAN_BODY ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/elevation_up.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.ElevationDown" ,
	["channel"] = CHAN_BODY ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/elevation_down.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.Holster" ,
	["channel"] = CHAN_BODY ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/holster.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.Draw" ,
	["channel"] = CHAN_BODY ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/draw.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.Foley" ,
	["channel"] = CHAN_BODY ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/aim.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.RemoveShell" ,
	["channel"] = CHAN_ITEM ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/shell_extract1.wav", "^)v92/weapons/bf3/m320/shell_extract2.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.InsertShell" ,
	["channel"] = CHAN_ITEM ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/shell_insert1.wav", "^)v92/weapons/bf3/m320/shell_insert2.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.OpenTube" ,
	["channel"] = CHAN_ITEM ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/tube_open1.wav", "^)v92/weapons/bf3/m320/tube_open2.wav" }
} )

sound.Add( {
	["name"] = "BF3.Weapons.M320.CloseTube" ,
	["channel"] = CHAN_ITEM ,
	["volume"] = 1.0 ,
	["level"] = 60 ,
	["pitch"] = { 95 , 105 } ,
	["sound"] = { "^)v92/weapons/bf3/m320/tube_close1.wav", "^)v92/weapons/bf3/m320/tube_close2.wav" }
} )

if CLIENT then

	SWEP.BounceWeaponIcon = false
	SWEP.WepSelectIcon = surface.GetTextureID( "vgui/hud/simple_bf3_m320" )
	SWEP.RenderGroup = RENDERGROUP_BOTH
	language.Add( "simple_bf3_m320" , SWEP.PrintName )
	killicon.Add( SWEP.PrintName , "vgui/entities/simple_bf3_m320" , Color( 255 , 255 , 255 ) )

end
