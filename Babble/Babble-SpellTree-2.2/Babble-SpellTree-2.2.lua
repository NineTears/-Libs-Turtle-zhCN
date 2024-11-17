--[[
Name: Babble-SpellTree-2.2
Revision: $Rev: 14410 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Documentation: http://wiki.wowace.com/index.php/Babble-SpellTree-2.2
SVN: http://svn.wowace.com/root/trunk/Babble-2.2/Babble-SpellTree-2.2
Description: 技能、天赋树本地库
Dependencies: AceLibrary, AceLocale-2.2
]]

-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
-- https://github.com/NineTears/Libs-Turtle-zhCN
-- Last update: 2024-02-29

local MAJOR_VERSION = "Babble-SpellTree-2.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 14420 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleSpellTree = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleSpellTree:EnableDebugging()

BabbleSpellTree:RegisterTranslations("enUS", function()
	return {
		-- Druid
		["Balance"] = true,
		["Feral Combat"] = true,
		["Restoration"] = true,
		["Nature"] = true,
		-- Hunter
		["Beast Mastery"] = true,
		["Marksmanship"] = true,
		["Survival"] = true,
		-- Mage
		["Arcane"] = true,
		["Fire"] = true,
		["Frost"] = true,
		-- Paladin
		["Holy"] = true,
		["Protection"] = true,
		["Retribution"] = true,
		-- Priest
		["Discipline"] = true,
		-- ["Holy"] = true, -- same as Paladin
		["Shadow"] = true,
		-- Rogue
		["Assassination"] = true,
		["Combat"] = true,
		["Subtlety"] = true,
		-- Shaman
		["Elemental"] = true,
		["Enhancement"] = true,
		-- ["Restoration"] = true, -- same as Druid
		-- Warrior
		["Arms"] = true,
		["Fury"] = true,
		-- ["Protection"] = true, -- same as Paladin
		-- Warlock
		["Affliction"] = true,
		["Demonology"] = true,
		["Destruction"] = true,
	}
end)

BabbleSpellTree:RegisterTranslations("zhCN", function()
	return {
		-- Druid
		["Balance"] = "平衡",
		["Feral Combat"] = "野性战斗",
		["Restoration"] = "恢复",
		["Nature"] = "自然",
		-- Hunter
		["Beast Mastery"] = "野兽掌握",
		["Marksmanship"] = "射击",
		["Survival"] = "生存",
		-- Mage
		["Arcane"] = "奥术",
		["Fire"] = "火焰",
		["Frost"] = "冰霜",
		-- Paladin
		["Holy"] = "神圣",
		["Protection"] = "防护",
		["Retribution"] = "惩戒",
		-- Priest
		["Discipline"] = "戒律",
		-- ["Holy"] = "神圣", -- same as Paladin
		["Shadow"] = "暗影",
		-- Rogue
		["Assassination"] = "刺杀",
		["Combat"] = "战斗",
		["Subtlety"] = "敏锐",
		-- Shaman
		["Elemental"] = "元素战斗",
		["Enhancement"] = "增强",
		-- ["Restoration"] = "恢复", -- same as Druid
		-- Warrior
		["Arms"] = "武器",
		["Fury"] = "狂怒",
		-- ["Protection"] = "防护", -- same as Paladin
		-- Warlock
		["Affliction"] = "痛苦",
		["Demonology"] = "恶魔学识",
		["Destruction"] = "毁灭",
	}
end)

BabbleSpellTree:Debug()
BabbleSpellTree:SetStrictness(true)

AceLibrary:Register(BabbleSpellTree, MAJOR_VERSION, MINOR_VERSION)
BabbleSpellTree = nil
