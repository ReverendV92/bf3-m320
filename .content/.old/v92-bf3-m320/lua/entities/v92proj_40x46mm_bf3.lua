AddCSLuaFile( )
ENT.Type = "anim"
-- ENT.Base = "base_gmodentity"
ENT.PrintName = "40x46mm GL Shell"
ENT.Author = "V92"
ENT.Category = VNT_CATEGORY_VNT
ENT.Spawnable = false
ENT.AdminOnly = true

---------------------------------------------------------
--	OnRemove
---------------------------------------------------------
function ENT:OnRemove( )
end

---------------------------------------------------------
--	PhysicsUpdate
---------------------------------------------------------
function ENT:PhysicsUpdate( )
end

---------------------------------------------------------
--	PhysicsCollide
---------------------------------------------------------
function ENT:PhysicsCollide( data , physobj )
	local LastSpeed = data.OurOldVelocity:Length( )
	local NewVelocity = physobj:GetVelocity( )
	local NormVel = data.OurOldVelocity:GetNormal( )
	NewVelocity:Normalize( )
	local TargetVelocity = NewVelocity * LastSpeed * 1
	physobj:SetVelocity( TargetVelocity )
	if self.Dummy == true then return false end

	if self.DummyTime and CurTime( ) < self.DummyTime then
		self.DummyTime = nil
		self.Dummy = true
		self.Removal = CurTime( ) + 20
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetGravity( 1 )
		self:GetPhysicsObject( ):SetMass( self:GetPhysicsObject( ):GetMass( ) * 0.25 )
		self:GetPhysicsObject( ):Wake( )
		self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE )
		self:SetNetworkedString( "Owner" , "World" )

		return false
	end

	self:Explosion( )
end

if CLIENT then
	---------------------------------------------------------
	--	Draw
	---------------------------------------------------------
	function ENT:Draw( )
		self:DrawModel( )
	end

	---------------------------------------------------------
	--	IsTranslucent
	---------------------------------------------------------
	function ENT:IsTranslucent( )
		return true
	end
end

if SERVER then

	ENT.Size = 0.5

	---------------------------------------------------------
	--	Initialize
	---------------------------------------------------------
	function ENT:Initialize( )
		self:SetModel( "models/jessev92/bf3/weapons/m320_grenade.mdl" )
		self:SetMoveType( MOVETYPE_FLYGRAVITY )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetCollisionBounds( Vector( -self.Size , -self.Size , -self.Size ) , Vector( self.Size , self.Size , self.Size ) )
		self:DrawShadow( true )
		self.AllowEXP = true
		self:SetGravity( 0.4 )
		self.DummyTime = CurTime( ) + 0.2
	end

	---------------------------------------------------------
	--	Think
	---------------------------------------------------------
	function ENT:Think( )
		if self:GetMoveType( ) == MOVETYPE_FLYGRAVITY then
			self:SetAngles( self:GetVelocity( ):Angle( ) )
		end

		if self.Removal and CurTime( ) >= self.Removal then
			self.Removal = nil
			self:Remove( )
		end

		self:NextThink( CurTime( ) )

		return true
	end

	---------------------------------------------------------
	--	Explosion
	---------------------------------------------------------
	function ENT:Explosion( )
		if self.Dummy == true then return false end

		if self.AllowEXP == true then
			self.AllowEXP = false
			local explo = ents.Create( "env_explosion" )
			explo:SetOwner( self:GetOwner( ) )
			explo:SetPos( self:GetPos( ) )
			explo:SetKeyValue( "iMagnitude" , "100" )
			explo:Spawn( )
			explo:Activate( )
			explo:Fire( "Explode" , "" , 0 )
			self:Remove( )
		end
	end

	function ENT:Touch( ent )
		if not ent:IsTrigger( ) then
			if self.DummyTime and CurTime( ) < self.DummyTime then
				self.DummyTime = nil
				self.Dummy = true
				self:PhysicsInit( SOLID_VPHYSICS )
				self:SetMoveType( MOVETYPE_VPHYSICS )
				self:SetSolid( SOLID_VPHYSICS )
				self:SetGravity( 1 )
				self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE )
				self:SetNetworkedString( "Owner" , "World" )
				self.Removal = CurTime( ) + 20

				return false
			end

			self:Explosion( )
		end
	end
end