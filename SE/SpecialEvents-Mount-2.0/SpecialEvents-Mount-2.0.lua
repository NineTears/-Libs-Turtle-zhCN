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

	if IsAddOnLoaded("Automaton") then
		self.Mount_List = Automaton_Dismount.db.profile.mounts
	else
		self.Mount_List = {
			"_mount_",						--常规坐骑
			"spell_nature_swiftness",		--骸骨军马、机械陆行鸟、科多兽、地狱战马、迅猛龙等
			"_qirajicrystal_",				--其拉共鸣水晶		
			
			--------特殊坐骑请玩家前往小地图 Automaton-下马-增加坐骑 功能中添加--------
			"hunter_pet_turtle", 				-- 乌龟坐骑
			"boar",								-- 长牙野猪
			"warstomp", 						-- 斑马坐骑
			"bullrush", 						-- 幽灵狮鹫
			"_branch_", 						-- 驯鹿
			"zuoqi",							-- 通用坐骑1
			"ability_racial_bearform",
			"ability_druid_catform",
			"ability_druid_travelform",
			"ability_druid_aquaticform",
			"ability_hunter_pet_turtle",
			"spell_shadow_shadowform",
			"spell_nature_spiritwolf",
			"spell_nature_forceofnature",
			"inv_pet_speedy",
			"inv_misc_head_dragon_black",
			"ability_bullrush",
			"Spell_Nature_WispSplode",
			"inv_misc_branch_01",
			"Spell_Nature_Swiftness",  			-- 粉色羊
			"INV_ValentinesBoxOfChocolates02",  -- 粉色马
			"INV_ValentinesCard01",   			-- 粉色虎
			"ability_hunter_pet_dragonhawk",  	-- 龙鹰
			"Ability_Hunter_Pet_TallStrider",
			"INV_Misc_Horn_01",
			"hunter_pet_bear",					-- 熊
			"hunter_pet_hippogryph",			-- 角鹰兽
			"hunter_pet_stag1",					-- 暗角雄鹿
			"hunter_pet_tallstrider",			-- 爱情鸟
			"inv_misc_key_06",					-- 工程坐骑
			"inv_misc_key_12",					-- 工程坐骑
			"spell_nature_sentinal",			-- 乌鸦
			"spell_magic_polymorphchicken",		-- 魔法公鸡
		}
	end
	
	if oldDeactivate then oldDeactivate(oldLib) end
end

function lib:PLAYER_AURAS_CHANGED()
	for i = 0, 31, 1 do
		local Mount_Texture = GetPlayerBuffTexture(i)
		if Mount_Texture then
			for _, Mount_BuffType in pairs(self.Mount_List) do
				if string.find(string.lower(Mount_Texture), string.lower(Mount_BuffType)) then
					self.vars.mounted = true
					break
				else
					self.vars.mounted = false
					break
				end
			end
		end
	end
end

--返回玩家是否在坐骑上
function lib:PlayerOnMount()
	return self.vars.mounted
end

--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)