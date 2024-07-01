--[[
Name: SpecialEvents-LearnSpell-2.0
Revision: $Rev: 14863 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Special events for mail (received, auction notices, etc)
Dependencies: AceLibrary, AceEvent-2.0
]]


local vmajor, vminor = "SpecialEvents-LearnSpell-2.0", "$Revision: 14863 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)

local closedelay = 5


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then self.vars = oldLib.vars
	else self.vars = {} end
	if not self.vars.allspells then
		self.vars.allspells = {}
		self.vars.spells = self:GetSpellList()
	end

	self:RegisterEvent("SPELLS_CHANGED")

	if oldDeactivate then oldDeactivate(oldLib) end
end


--------------------------------
--      Tracking methods      --
--------------------------------

function lib:SPELLS_CHANGED()
	local newsp, oldsp = self:GetSpellList(), self.vars.spells

	for spell,rank in pairs(newsp) do
		if oldsp[spell] ~= rank then
			self:TriggerEvent("SpecialEvents_LearnedSpell", spell, rank)
		end
	end

	for i in pairs(oldsp) do oldsp[i] = nil end
	self.vars.empty = oldsp
	self.vars.spells = newsp
end


function lib:GetSpellList()
	local rt = self.vars.empty or {}
	self.vars.empty = nil

	for i = 1, GetNumSpellTabs() do
		local _, _, offset, num = GetSpellTabInfo(i)
		local bookType = BOOKTYPE_SPELL
		for id = offset + 1, offset + num do
			local sname, srank = GetSpellName(id, bookType)
			if sname then rt[sname] = srank end
			if sname then self.vars.allspells[sname..srank] = true end
		end
	end

	return rt
end


-----------------------------
--      Query methods      --
-----------------------------

function lib:GetSpells()
	return self.vars.spells
end


function lib:SpellKnown(spell, rank)
	if not rank then return self.vars.spells[spell] end
	return self.vars.allspells[spell.. rank]
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)





