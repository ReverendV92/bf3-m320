
------------------------------------------------------
------------------------------------------------------
--	Battlefield 3
--	H&K M320 GLM
--	40x46mm US grenade launcher
------------------------------------------------------
------------------------------------------------------

AddCSLuaFile( )

SWEP.PrintName = "M320" -- (String) Printed name on menu

if not VNTCB then
	Error( "V92 Content Bases not mounted; Removing Weapon: " .. SWEP.PrintName .. "\n" )
	return false
end

SWEP.Base = VNT_BASE_WEAPON -- (String) Weapon base parent this is a child of
SWEP.Spawnable = true -- (Boolean) Can be spawned via the menu
SWEP.AdminOnly = false -- (Boolean) Admin only spawnable

------------------------------------------------------
--	Client Information								--	Info used in the client block of the weapon
------------------------------------------------------

SWEP.WeaponName = "v92_bf3_m320" -- (String) Name of the weapon script
SWEP.WeaponEntityName = SWEP.WeaponName .. "_ent" -- (String) Name of the weapon entity in Lua/Entities/Entityname.lua
SWEP.GrenadeLauncherEntity = "v92proj_40x46mm_bf3" -- (String) Name of the grenade launcher shell entity in Lua/Entities/Entityname.lua
SWEP.GrenadeLauncherForce = 1250 -- (Integer) Force of grenade launchers and shell throwers like that.
SWEP.Manufacturer = VNT_WEAPON_MANUFACTURER_HK -- (String) Gun company that makes this weapon
SWEP.CountryOfOrigin = VNT_WEAPON_COUNTRY_GERMANY -- (String) Country of origin
SWEP.MagazineName = VNTCB.Magazine.m40x46 -- (String) The name of the magazine the weapon uses - used in my Weapon Magazine System
SWEP.Category = VNT_CATEGORY_BATTLEFIELD3 -- (String) Category
SWEP.Instructions = VNTCB.instructions -- (String) Instruction
SWEP.Author = "V92" -- (String) Author
SWEP.Contact = VNTCB.contact -- (String) Contact
SWEP.Purpose = VNTCB.purpose -- (String) Purpose
SWEP.Slot = VNT_WEAPON_BUCKETPOS_LAUNCHER -- (Integer) Bucket to place weapon in, 1 to 6
SWEP.SlotPos = VNT_WEAPON_SLOTPOS_LAUNCHER -- (Integer) Bucket position
SWEP.ViewModelFOV = 60 -- (Integer) First-person field of view
SWEP.WorkshopID = "855378553" -- (Integer) Workshop ID number of the upload that contains this file.

------------------------------------------------------
--	Model Information								--
------------------------------------------------------

SWEP.ViewModelFlip = false -- (Boolean) Only used for vanilla CS:S models
SWEP.ViewModel = Model( "models/jessev92/bf3/weapons/m320_c.mdl" ) -- (String) View model - v_*
SWEP.WorldModel = Model( "models/jessev92/bf3/weapons/m320_c.mdl" ) -- (String) World model - w_*
SWEP.HoldType = "rpg" -- (String) Hold type for our weapon, refer to wiki for animation sets
SWEP.UseHands = true

------------------------------------------------------
--	Gun Types										--	Set the type of weapon - ONLY PICK ONE!
------------------------------------------------------

SWEP.IsGLM = true -- (Integer) 1=Melee, 2=Pistol, 3=Rifle, 4=Shotgun, 5=Sniper, 6=Grenade Launcher, 7=Rocket Launcher

------------------------------------------------------
--	Primary Fire Settings							--	Settings for the primary fire of the weapon
------------------------------------------------------

SWEP.Primary.ClipSize = 1 -- (Integer) Size of a magazine
SWEP.Primary.DefaultClip = 1 -- (Integer) Default number of ammo you spawn with
SWEP.Primary.Ammo = "40x46mmgrenade" -- (String) Primary ammo used by the weapon, bullets probably
SWEP.Primary.PureDmg = VNTCB.Ammo.a40x46mm[ 1 ] -- (Integer) Base damage, put one number here and the base will do the rest
SWEP.Primary.RPM = 25 -- (Integer) Go to a wikipedia page and look at the RPM of the weapon, then put that here - the base will do the math

------------------------------------------------------
--	Gun Mechanics									--	Various things to tweak the effects and feedback
------------------------------------------------------

--SWEP.IsEntityShooter = true -- (Boolean) Does this weapon shoot entities instead of bullets?
--SWEP.CanReloadWhenNotEmpty = false -- (Boolean) Can we reload when not empty? true=M16, false=M1 Garand
SWEP.CanChamber = false -- (Boolean) Can we load a round into the chamber?
SWEP.FireMode = { false , true , false , false } -- (Table: Boolean, Boolean, Boolean, Boolean ) Enable different fire modes on the weapon; Has modes, Has Single, Has Burst, Has Auto - in that order. You can have more than one, but the first must be true
SWEP.CurrentMode = 1 -- (Integer) Current fire mode of the weapon; used to set the default mode; corresponds to the FireMode table
SWEP.Weight = 1 -- (Integer) The weight in Kilogrammes of our weapon - used in my weapon weight mod!
SWEP.CanFireUnderwater = true -- (Boolean) Can we shoot underwater?
SWEP.StrongPenetration = VNTCB.Ammo.a40x46mm[ 2 ] -- (Integer) Max penetration
SWEP.WeakPenetration = VNTCB.Ammo.a40x46mm[ 3 ] -- (Integer) Max wood penetration
SWEP.EffectiveRange = 250 -- (Integer) Effective range of the weapon in metres.
SWEP.StoppageRate = 0 -- (Integer) Rate of stoppages in the weapon, look up the real world number estimations and just throw that in here.

------------------------------------------------------
--	Special FX										--	Muzzle flashes, shell casings, etc
------------------------------------------------------

SWEP.MuzzleAttach = 1 -- (Integer) The number of the attachment point for muzzle flashes, typically "1"
SWEP.MuzzleFlashType = 1 -- (Integer) The number of the muzzle flash to use; see Lua/Effects/fx_muzzleflash.Lua
SWEP.ShellAttach = 2 -- (String) The name of the attachment point for shell ejections, typically "2" or "eject"
SWEP.ShellType = nil -- (Integer) The shell to use, see Lua/Effects/FX_ShellEject for integers
SWEP.ShellDelay = 0 -- (Float) 	Time between shot firing and shell ejection; useful for bolt-actions and things like that that need a delay

------------------------------------------------------
--	Custom Sounds									--
--		Setup sounds here!							--
------------------------------------------------------

SWEP.UsesSuperSonicAmmo = false -- (Boolean) Is the weapon using supersonic or subsonic ammo?

SWEP.Sounds = {

	["Primary"] = Sound( "BF3.Weapons.M320.Single" ) , -- (String) Primary shoot sound
	["PrimaryDry"] = Sound( "BF3.Weapons.M320_Dry" ) , -- (String) Primary dry fire sound
	["GrenadeLauncher"] = Sound( "BF3.Weapons.M320.Single" ) , -- (String) Grenade launcher sound
	["Reload"] = Sound( "jessev92/weapons/univ/draw1.wav" ) , -- (String) Reload sound

	["Noise_Close"] = Sound( "BF3.BulletCraft.Noise.GL.Close" ) , --
	["Noise_Distant"] = Sound( "BF3.BulletCraft.Noise.GL.Distant.OpenField" ) , --
	["Noise_Far"] = Sound( "common/null.wav" ) , --
	["CoreBass_Close"] = Sound( "BF3.BulletCraft.CoreBass.Close.GL" ) , --
	["CoreBass_Distant"] = Sound( "common/null.wav" ) , --
	["HiFi"] = Sound( "BF3.BulletCraft.HiFi.Shotgun" ) , --
	["Reflection_Close"] = Sound( "common/null.wav" ) , --
	["Reflection_Far"] = Sound( "common/null.wav" ) , --

}

SWEP.SelectorSwitchSNDType = 1 -- (Integer) 1=US , 2=RU

------------------------------------------------------
--	Ironsight & Run Positions						--	Set our model transforms for running and ironsights
------------------------------------------------------

--SWEP.IronSightsPos = Vector(-2.01, -8.04, -0.48)
--SWEP.IronSightsAng = Vector(1, 0, -7.035)
SWEP.IronSightsPos = Vector(-2, -7.035, -1.491)
SWEP.IronSightsAng = Vector(1, 0, -2.814)
SWEP.RunArmOffset = Vector( 0 , 0 , 0 ) -- (Vector) Sprinting XYZ Transform
SWEP.RunArmAngle = Vector( -20 , 0 , 0 ) -- (Vector) Sprinting XYZ Rotation

------------------------------------------------------
-- Sequence Settings
------------------------------------------------------

SWEP.SeqPrimary = { "Attack1" }
SWEP.SeqIdle = { "idle" }
SWEP.SeqHolster = { "holster" }
SWEP.SeqReload = { "reload" }
SWEP.SeqDraw = { "draw" }

------------------------------------------------------
--	Setup Clientside Info							--	This block must be in every weapon!
------------------------------------------------------

if CLIENT then

	SWEP.WepSelectIcon = surface.GetTextureID( "vgui/hud/" .. SWEP.WeaponName )
	SWEP.RenderGroup = RENDERGROUP_BOTH
	language.Add( SWEP.WeaponName , SWEP.PrintName )
	killicon.Add( SWEP.WeaponName , "vgui/entities/" .. SWEP.WeaponName , Color( 255 , 255 , 255 ) )

elseif SERVER then

	resource.AddWorkshop( SWEP.WorkshopID )

end

------------------------------------------------------
--	SWEP:Initialize() 							--	Called when the weapon is first loaded
------------------------------------------------------

function SWEP:Initialize( )
	self.HoldMeRight = VNTCB.HoldType.GLauncherForeGrip -- (String) Hold type table for our weapon, Lua/autorun/sh_v92_base_swep.Lua
	--self:SetHoldType(self.HoldType)
end

---------------------------------------------
--	Sounds
---------------------------------------------

sound.Add( {
	name = "BF3.Weapons.M320.Single" ,
	channel = CHAN_WEAPON ,
	volume = 1.0 ,
	level = 75 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/single_1.wav" }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/single_1.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.Dry" ,
	channel = CHAN_WEAPON ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/weapons/univ/empty6.wav" }
} )
util.PrecacheSound( "jessev92/weapons/univ/empty6.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.Safety" ,
	channel = CHAN_BODY ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 } ,
	sound = { "^)jessev92/weapons/univ/auto_semiauto_switch.wav" }
} )
util.PrecacheSound("jessev92/weapons/univ/auto_semiauto_switch.wav")

sound.Add( {
	name = "BF3.Weapons.M320.Holster" ,
	channel = CHAN_BODY ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/weapons/univ/holster1.wav" }
} )
util.PrecacheSound( "jessev92/weapons/univ/holster1.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.Draw" ,
	channel = CHAN_BODY ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/draw.wav" }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/draw.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.Foley" ,
	channel = CHAN_BODY ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/aim.wav" , "^)jessev92/weapons/univ/draw1.wav" , "^)jessev92/weapons/univ/draw2.wav"  }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/aim.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.RemoveShell" ,
	channel = CHAN_ITEM ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/shell_extract1.wav", "^)jessev92/bf3/weapons/m320/shell_extract2.wav" }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/shell_extract1.wav" )
util.PrecacheSound( "jessev92/bf3/weapons/m320/shell_extract2.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.InsertShell" ,
	channel = CHAN_ITEM ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/shell_insert1.wav", "^)jessev92/bf3/weapons/m320/shell_insert2.wav" }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/shell_insert1.wav" )
util.PrecacheSound( "jessev92/bf3/weapons/m320/shell_insert2.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.OpenTube" ,
	channel = CHAN_ITEM ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/tube_open1.wav", "^)jessev92/bf3/weapons/m320/tube_open2.wav" }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/tube_open1.wav" )
util.PrecacheSound( "jessev92/bf3/weapons/m320/tube_open2.wav" )

sound.Add( {
	name = "BF3.Weapons.M320.CloseTube" ,
	channel = CHAN_ITEM ,
	volume = 1.0 ,
	level = 60 ,
	pitch = { 95 , 105 } ,
	sound = { "^)jessev92/bf3/weapons/m320/tube_close1.wav", "^)jessev92/bf3/weapons/m320/tube_close2.wav" }
} )
util.PrecacheSound( "jessev92/bf3/weapons/m320/tube_close1.wav" )
util.PrecacheSound( "jessev92/bf3/weapons/m320/tube_close2.wav" )

