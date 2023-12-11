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

function lib:PLAYER_AURAS_CHANGED()
	for i = 0, 31, 1 do
		local Mount_Texture = GetPlayerBuffTexture(i)
		if Mount_Texture then
			for _, Mount_BuffType in pairs(Automaton_Dismount.db.profile.mounts) do
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