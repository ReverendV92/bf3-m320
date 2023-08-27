
AddCSLuaFile( )

if not VNTCB then return false end

ENT.Base = VNT_BASE_WEAPON_ENTITY
ENT.Type = "anim"
ENT.PrintName = "M320"
ENT.Author = VNTCB.author
ENT.Information = "Uses 40x46mm Ammo"
ENT.Category = VNT_CATEGORY_BATTLEFIELD3
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.SWepName = "v92_bf3_m320" -- (String) Name of the weapon entity in Lua/weapons/swep_name.lua
ENT.WeaponName = ENT.SWepName .. "_ent" -- (String) Name of this entity
ENT.SEntModel = Model( "models/jessev92/bf3/weapons/m320_c.mdl" ) -- (String) Model to use
