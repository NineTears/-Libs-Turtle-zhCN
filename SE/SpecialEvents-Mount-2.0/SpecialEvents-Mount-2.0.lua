--[[
	Name: SpecialEvents-Mount-2.0
	Revision: $Rev: 15360 $
	Author: Tekkub Stoutwrithe (tekkub@gmail.com)
	Website: http://www.wowace.com/
	Description: Special events for mounting
	Dependencies: AceLibrary, AceEvent-2.0, Gratuity-2.0
]]


local vmajor, vminor = "SpecialEvents-Mount-2.0", "$Revision: 15360 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)

-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars = oldLib.vars
		oldLib:UnregisterAllEvents()
	else
		self.vars = {}
	end
	self:RegisterEvent("PLAYER_AURAS_CHANGED")
	
	if oldDeactivate then oldDeactivate(oldLib) end
end

local Mount_List = {
	"_mount_",						--常规坐骑
	"spell_nature_swiftness",		--骸骨军马、机械陆行鸟、科多兽、地狱战马、迅猛龙等
	"_qirajicrystal_",				--其拉共鸣水晶
	
	--------特殊坐骑请玩家前往小地图 Automaton-下马-增加坐骑 功能中添加--------
	"hunter_pet_turtle", 			--乌龟坐骑 
	"warstomp", 					--斑马坐骑 
	"bullrush", 					--幽灵狮鹫
	"_branch_", 					--驯鹿
	"ability_racial_bearform",
	"ability_druid_catform",
	"ability_druid_travelform",
	"ability_druid_aquaticform",
	"ability_hunter_pet_turtle",
	"spell_shadow_shadowform",
	"spell_nature_spiritwolf",
	"spell_nature_forceofnature",
	"inv_pet_speedy",
	"zuoqi",
	"inv_misc_head_dragon_black",
	"ability_bullrush",
}

function lib:PLAYER_AURAS_CHANGED()
	for i = 0, 31, 1 do
		Mount_Texture = GetPlayerBuffTexture(i)
		if Mount_Texture then
			for _, Mount_BuffType in pairs(Mount_List) do
				if string.find(string.lower(Mount_Texture), Mount_BuffType) then
					self.vars.mounted, self.vars.buffid = true, i
					break
				else
					self.vars.mounted, self.vars.buffid = false, nil
				end
			end
		end
	end
	if Automaton_Dismount ~= nil and Automaton_Dismount.db ~= nil then
		for k = 1, table.getn(Automaton_Dismount.db.profile.mounts), 1 do
			local _, i = UnitHasAura("player", Automaton_Dismount.db.profile.mounts[k])
			if i then
				self.vars.mounted, self.vars.buffid = true, i - 1
				break
			else
				self.vars.mounted, self.vars.buffid = false, nil
			end
		end
	end
end

--返回玩家是否在坐骑上
function lib:PlayerOnMount()
	return self.vars.mounted, self.vars.buffid
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)