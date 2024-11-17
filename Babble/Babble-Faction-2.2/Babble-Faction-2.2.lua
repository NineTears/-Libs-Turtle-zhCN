--[[
Name: Babble-Faction-2.2
Revision: $Rev: 1000 $
Author(s): Lichery
Description: A library to provide localizations for factions.
Dependencies: AceLibrary, AceLocale-2.2
]]

-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
-- https://github.com/NineTears/Libs-Turtle-zhCN
-- Last update: 2024-02-29

local MAJOR_VERSION = "Babble-Faction-2.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 1000 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleFaction = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleFaction:EnableDebugging()

BabbleFaction:RegisterTranslations("enUS", function()
	return {
	--Player Factions
	["Alliance"] = true,
	["Horde"] = true,

	-- Classic Factions
	["Argent Dawn"] = true,
	["Bloodsail Buccaneers"] = true,
	["Booty Bay"] = true,
	["Brood of Nozdormu"] = true,
	["Cenarion Circle"] = true,
	["Darkmoon Faire"] = true,
	["Darkspear Trolls"] = true,
	["Darnassus"] = true,
	["The Defilers"] = true,
	["Everlook"] = true,
	["Frostwolf Clan"] = true,
	["Gadgetzan"] = true,
	["Gelkis Clan Centaur"] = true,
	["Gnomeregan Exiles"] = true,
	["Hydraxian Waterlords"] = true,
	["Ironforge"] = true,
	["The League of Arathor"] = true,
	["Magram Clan Centaur"] = true,
	["Orgrimmar"] = true,
	["Ratchet"] = true,
	["Ravenholdt"] = true,
	["Silverwing Sentinels"] = true,
	["Shen'dralar"] = true,
	["Stormpike Guard"] = true,
	["Stormwind"] = true,
	["Syndicate"] = true,
	["Thorium Brotherhood"] = true,
	["Thunder Bluff"] = true,
	["Timbermaw Hold"] = true,
	["Undercity"] = true,
	["Warsong Outriders"] = true,
	["Wildhammer Clan"] = true,
	["Wintersaber Trainers"] = true,
	["Zandalar Tribe"] = true,

	--Rep Levels
	["Neutral"] = true,
	["Friendly"] = true,
	["Honored"] = true,
	["Revered"] = true,
	["Exalted"] = true,
	}
end)

BabbleFaction:RegisterTranslations("zhCN", function()
	return {

	-- Player Factions
	["Alliance"]  = "联盟",
	["Horde"]  = "部落",

	-- Classic Factions
	["Argent Dawn"]  = "银色黎明",
	["Bloodsail Buccaneers"]  = "血帆海盗",
	["Booty Bay"]  = "藏宝海湾",
	["Brood of Nozdormu"]  = "诺兹多姆的子嗣",
	["Cenarion Circle"]  = "塞纳里奥议会",
	["Darkmoon Faire"]  = "暗月马戏团",
	["Darkspear Trolls"]  = "暗矛巨魔",
	["Darnassus"]  = "达纳苏斯",
	["The Defilers"]  = "污染者",
	["Everlook"]  = "永望镇",
	["Frostwolf Clan"]  = "霜狼氏族",
	["Gadgetzan"]  = "加基森",
	["Gelkis Clan Centaur"]  = "吉尔吉斯半人马",
	["Gnomeregan Exiles"]  = "诺莫瑞根流亡者",
	["Hydraxian Waterlords"]  = "海达希亚水元素",
	["Ironforge"]  = "铁炉堡",
	["The League of Arathor"]  = "阿拉索联军",
	["Magram Clan Centaur"]  = "玛格拉姆半人马",
	["Orgrimmar"]  = "奥格瑞玛",
	["Ratchet"]  = "棘齿城",
	["Ravenholdt"]  = "拉文霍德",
	["Silverwing Sentinels"]  = "银翼哨兵",
	["Shen'dralar"]  = "辛德拉",
	["Stormpike Guard"]  = "雷矛卫队",
	["Stormwind"]  = "暴风城",
	["Syndicate"]  = "辛迪加",
	["Thorium Brotherhood"]  = "瑟银兄弟会",
	["Thunder Bluff"]  = "雷霆崖",
	["Timbermaw Hold"]  = "木喉要塞",
	["Undercity"]  = "幽暗城",
	["Warsong Outriders"]  = "战歌侦察骑兵",
	["Wildhammer Clan"]  = "蛮锤部族",
	["Wintersaber Trainers"]  = "冬刃豹训练师",
	["Zandalar Tribe"]  = "赞达拉部族",

	-- Reputation Levels
	["Neutral"]  = "中立",
	["Friendly"]  = "友善",
	["Honored"]  = "尊敬",
	["Revered"]  = "崇敬",
	["Exalted"]  = "崇拜",
        
	}
end)

BabbleFaction:RegisterTranslations("ruRU", function()
	return {
	--Player Factions
	["Alliance"] = "Альянс",
	["Horde"] = "Орда",

	-- Classic Factions
	["Argent Dawn"] = "Серебряный Рассвет",
	["Bloodsail Buccaneers"] = "Пираты Кровавого Паруса",
	["Booty Bay"] = "Пиратская бухта",
	["Brood of Nozdormu"] = "Род Ноздорму",
	["Cenarion Circle"] = "Круг Кенария",
	["Darkmoon Faire"] = "Ярмарка Новолуния",
	["Darkspear Trolls"] = "Тролли Черного Копья",
	["Darnassus"] = "Дарнасс",
	["The Defilers"] = "Осквернители",
	["Everlook"] = "Круговзор",
	["Frostwolf Clan"] = "Клан Северного Волка",
	["Gadgetzan"] = "Прибамбасск",
	["Gelkis Clan Centaur"] = "Кентавры из племени Гелкис",
	["Gnomeregan Exiles"] = "Изгнанники Гномрегана",
	["Hydraxian Waterlords"] = "Гидраксианские Повелители Вод",
	["Ironforge"] = "Стальгорн",
	["The League of Arathor"] = "Лига Аратора",
	["Magram Clan Centaur"] = "Кентавры племени Маграм",
	["Orgrimmar"] = "Оргриммар",
	["Ratchet"] = "Кабестан",
	["Ravenholdt"] = "Черный Ворон",
	["Silverwing Sentinels"] = "Среброкрылые Часовые",
	["Shen'dralar"] = "Шен'дралар",
	["Stormpike Guard"] = "Стража Грозовой Вершины",
	["Stormwind"] = "Штормград",
	["Syndicate"] = "Синдикат",
	["Thorium Brotherhood"] = "Братство Тория",
	["Thunder Bluff"] = "Громовой Утес",
	["Timbermaw Hold"] = "Древобрюхи",
	["Undercity"] = "Подгород",
	["Warsong Outriders"] = "Всадники Песни Войны",
	["Wildhammer Clan"] = "Неистовый Молот",
	["Wintersaber Trainers"] = "Укротители ледопардов",
	["Zandalar Tribe"] = "Племя Зандалар",

	--Rep Levels
	["Neutral"] = "Равнодушие",
	["Friendly"] = "Дружелюбие",
	["Honored"] = "Уважение",
	["Revered"] = "Почтение",
	["Exalted"] = "Превознесение",
	}
end)

BabbleFaction:RegisterTranslations("esES", function()
	return {
	--Player Factions
	["Alliance"] = "Alianza",
	["Horde"] = "Horda",

	-- Classic Factions
	["Argent Dawn"] = "Alba Argenta",
	["Bloodsail Buccaneers"] = "Bucaneros Velasangre",
	["Booty Bay"] = "Bahía del Botín",
	["Brood of Nozdormu"] = "Linaje de Nozdormu",
	["Cenarion Circle"] = "Círculo Cenarion",
	["Darkmoon Faire"] = "Feria de la Luna Negra",
	["Darkspear Trolls"] = "Trols de Lanza Negra",
	["Darnassus"] = "Darnassus",
	["The Defilers"] = "Los Rapiñadores",
	["Everlook"] = "Vista Eterna",
	["Frostwolf Clan"] = "Clan Lobo Gélido",
	["Gadgetzan"] = "Gadgetzan",
	["Gelkis Clan Centaur"] = "Centauro del clan Gelkis",
	["Gnomeregan Exiles"] = "Exiliado de Gnomeregan",
	["Hydraxian Waterlords"] = "Señores del Agua de Hydraxis",
	["Ironforge"] = "Forjaz",
	["The League of Arathor"] = "Liga de Arathor",
	["Magram Clan Centaur"] = "Centauro del clan Magram",
	["Orgrimmar"] = "Orgrimmar",
	["Ratchet"] = "Trinquete",
	["Ravenholdt"] = "Ravenholdt",
	["Silverwing Sentinels"] = "Centinelas Ala de Plata",
	["Shen'dralar"] = "Shen'dralar",
	["Stormpike Guard"] = "Guardia de Pico Tormenta",
	["Stormwind"] = "Ventormenta",
	["Syndicate"] = "Sindicato",
	["Thorium Brotherhood"] = "Hermandad del torio",
	["Thunder Bluff"] = "Cima del Trueno",
	["Timbermaw Hold"] = "Bastión de los Fauces de Madera",
	["Undercity"] = "Entrañas",
	["Warsong Outriders"] = "Escolta Grito de Guerra",
	["Wildhammer Clan"] = "Clan Martillo Salvaje",
	["Wintersaber Trainers"] = "Instructoras de sableinvernales",
	["Zandalar Tribe"] = "Tribu Zandalar",

	--Rep Levels
	["Neutral"] = "Neutral",
	["Friendly"] = "Amistoso",
	["Honored"] = "Honrado",
	["Revered"] = "Reverenciado",
	["Exalted"] = "Exaltado",
	}
end)
BabbleFaction:Debug()
BabbleFaction:SetStrictness(true)

AceLibrary:Register(BabbleFaction, MAJOR_VERSION, MINOR_VERSION)
BabbleFaction = nil
