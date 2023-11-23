-- This translation was provided by Neriak.

function Ace_Locals_zhCN()
ACE_NAME					= "Ace"
ACE_DESCRIPTION				= "AddOn开发和管理工具包。"
ACE_VERSION_MISMATCH		= "|cffff6060[Ace 不匹配]|r"

-- Various text strings
ACE_TEXT_COMMANDS			= "命令"
ACE_TEXT_ALL				= "全部"
ACE_TEXT_OF					= "的"
ACE_TEXT_AUTHOR				= "作者"
ACE_TEXT_EMAIL				= "Email"
ACE_TEXT_RELEASED			= "已发布"
ACE_TEXT_WEBSITE			= "网站"
ACE_TEXT_MEM_USAGE			= "内存使用情况(MB)"
ACE_TEXT_TOTAL_ADDONS		= "全部插件"
ACE_TEXT_TOTAL_LOADED		= "当前加载的插件"
ACE_TEXT_ACE_ADDONS_LOADED	= "Ace插件加载项"
ACE_TEXT_ACE_REGISTERED		= "已注册的Ace插件"
ACE_TEXT_OTHERS_LOADED		= "其他插件加载项"
ACE_TEXT_NOT_LOADED			= "未加载的插件"
ACE_TEXT_LOADMSG			= "启动加载消息类型"
ACE_TEXT_NOW_SET_TO 		= "现在设置为"
ACE_TEXT_DEFAULT	 		= "默认"

ACE_MAP_STANDBY				= {[0]="现在激活", [1]="待命"}
ACE_MAP_LOADMSG				= {[0]="概要", addon="插件", none="无"}

ACE_DISPLAY_OPTION			= "[|cfff5f530%s|r]"

-- Load message locals
ACE_LOAD_MSG_SUMMARY		= "|cffffff78Ace初始化完成|r\n"..
							  "|cffffff78"..ACE_TEXT_ACE_REGISTERED..":|r %s\n"..
							  "|cffffff78已加载配置文件:|r %s\n"..
							  "|cffffff78类型|r |cffd8c7ff/ace|r |cffffff78了解更多信息|r"

-- Addon locals
ACE_ADDON_LOADED			= "|cffffff78%s v%s|r |cffffffffby|r |cffd8c7ff%s|r |cffffffff现在已加载|r"
ACE_ADDON_CHAT_COMMAND		= "|cffffff78(%s)"
ACE_ADDON_STANDBY			= "|cffff5050(standby)|r"

-- Addon Categories
ACE_CATEGORY_AUDIO			= "音频"
ACE_CATEGORY_BARS			= "界面栏"
ACE_CATEGORY_BATTLEGROUNDS	= "战场"
ACE_CATEGORY_CHAT			= "聊天/通信"
ACE_CATEGORY_CLASS			= "类增强功能"
ACE_CATEGORY_COMBAT			= "战斗/施法"
ACE_CATEGORY_COMPILATIONS	= "汇编"
ACE_CATEGORY_DEVELOPMENT	= "开发工具"
ACE_CATEGORY_GUILD			= "公会"
ACE_CATEGORY_INTERFACE		= "界面增强功能"
ACE_CATEGORY_INVENTORY		= "包裹/物品增强"
ACE_CATEGORY_MAP			= "地图增强功能"
ACE_CATEGORY_OTHERS			= "其他"
ACE_CATEGORY_PROFESSIONS	= "专业"
ACE_CATEGORY_QUESTS			= "任务增强"
ACE_CATEGORY_RAID			= "团队助手"

-- Profile locals
ACE_PROFILE_DEFAULT			= "默认"
ACE_PROFILE_LOADED_CHAR		= "已为加载单个配置文件 %s."
ACE_PROFILE_LOADED_CLASS	= "The %s class profile has been loaded for %s."
ACE_PROFILE_LOADED_DEFAULT	= "The default profile has been loaded for %s."

-- Information locals
ACE_INFO_HEADER				= "|cffffff78Ace信息|r"
ACE_INFO_NUM_ADDONS			= "插件加载项"
ACE_INFO_PROFILE_LOADED		= "已加载配置文件"

-- Chat handler locals
ACE_COMMANDS				= {"/ace"}

ACE_CMD_OPT_HELP			= "?"
ACE_CMD_OPT_HELP_DESC		= "显示有关此插件的其他信息。"
ACE_CMD_OPT_STANDBY			= "standby"
ACE_CMD_OPT_STANDBY_DESC	= "Toggle the addon's standby mode."
ACE_CMD_OPT_REPORT			= "report"
ACE_CMD_OPT_REPORT_DESC		= "Display the status of all settings."
ACE_CMD_OPT_INVALID			= "Invalid option '%s' entered."
ACE_CMD_OPT_LIST_ADDONS		= "Addon List"
ACE_CMD_OPT_LOAD_IS_LOADED	= "%s is already loaded."
ACE_CMD_OPT_LOAD_ERROR		= "%s could not be loaded because it is %s."
ACE_CMD_OPT_LOAD_LOADED		= "%s is now loaded."
ACE_CMD_OPT_AUTO_OFF_MSG	= "%s will no longer be loaded on demand at game start."
ACE_CMD_ERROR 				= "|cffff6060[error]|r"

ACE_CMD_ADDON_NOTFOUND		= "No addon named '%s' was found."
ACE_CMD_ADDON_ENABLED		= "%s has been enabled. You must reload the game to load this addon."
ACE_CMD_ADDON_ENABLED_ALL	= "All addons have been enabled. You must reload the game to load "..
							  "previously unloaded addons."
ACE_CMD_ADDON_DISABLED		= "%s has been disabled but will remain loaded until you reload the game."
ACE_CMD_ADDON_DISABLED_ALL	= "All addons except Ace itself have been disabled but will remain loaded "..
							  "until you reload the game."

ACE_CMD_PROFILE_ADDON_ADDED = "%s has been added. Active profile: %s."
ACE_CMD_PROFILE_ALL_ADDED	= "All addons have been added. Active profile: %s."
ACE_CMD_PROFILE_ALL			= "all"
ACE_CMD_PROFILE_NO_PROFILE	= "%s has no profiling options available."

ACE_CMD_USAGE_ADDON_DESC	= "|cffffff78[%s v%s]|r : %s"
ACE_CMD_USAGE_HEADER		= "|cffffff78Usage:|r |cffd8c7ff%s|r %s"
ACE_CMD_USAGE_OPT_DESC		= " - |cffffff78%s:|r %s"
ACE_CMD_USAGE_OPT_SEP		= " | "
ACE_CMD_USAGE_OPT_OPEN		= "["
ACE_CMD_USAGE_OPT_CLOSE		= "]"
ACE_CMD_USAGE_OPTION		= "|cffd8c7ff%s %s|r %s"
ACE_CMD_USAGE_NOINFO		= "No further information"

ACE_CMD_RESULT				= "|cffffff78%s:|r %s"

ACE_CMD_REPORT_STATUS		= "Status"
ACE_CMD_REPORT_LINE			= "%s [|cfff5f530%s|r]"
ACE_CMD_REPORT_LINE_PRE		= " - "
ACE_CMD_REPORT_LINE_INDENT	= "   "

ACE_CMD_REPORT_NO_VAL		= "|cffc7c7c7no value|r"

ACE_CMD_OPTIONS				= {
	{
		option	= "enable",
		desc	= "Enable an addon.",
		method	= "EnableAddon"
	},
	{
		option	= "disable",
		desc	= "Disable an addon.",
		method	= "DisableAddon"
	},
	{
		option	= "info",
		desc	= "Display addon and current profile information.",
		method	= "DisplayInfo"
	},
	{
		option	= "list",
		desc	= "List currently loaded addons. You may optionally follow this command "..
				  "with the name of an addon to search for.",
		method	= "ListAddons",
		args	= {
			{
				option	= "ace",
				desc	= "List only currently loaded Ace addons.",
				method	= "ListAddonsAce"
			},
			{
				option	= "other",
				desc	= "List all other loaded addons.",
				method	= "ListAddonsOther"
			},
			{
				option	= "loadable",
				desc	= "List all addons that are available to be loaded.",
				method	= "ListAddonsLoadable"
			}
		}
	},
	{
		option	= "load",
		desc	= "Load an addon if it is not currently loaded and if it is set to be loaded "..
				  "on demand.",
		input	= 1,
		method	= "LoadAddon",
		args	= {
			{
				option	= "auto",
				desc	= "Load the addon and set it to be automatically loaded at game start.",
				method	= "LoadAddonAuto"
			},
			{
				option	= "off",
				desc	= "Turn off the automatic loading at game start of an on demand addon.",
				method	= "LoadAddonOff"
			}
		}
	},
	{
		option	= "loadmsg",
		desc	= "Change the displaying of load messages at game startup or reload.",
		args	= {
			{
				option	= "addon",
				desc	= "Display a load message for each addon.",
				method	= "ChangeLoadMsgAddon"
			},
			{
				option	= "none",
				desc	= "Do not display any load messages at all.",
				method	= "ChangeLoadMsgNone"
			},
			{
				option	= "sum",
				desc	= "Display a short summary message.",
				method	= "ChangeLoadMsgSum"
			}
		},
	},
	{
		option	= "profile",
		desc	= "Load one of three profiles: char, class, or default. If the profile doesn't "..
				  "exist, it will be created empty. Your character and class profiles will "..
				  "continue to use default addon settings until you populate it. Once you "..
				  "place an addon in a profile, any changes you make to that addon's settings "..
				  "will be specific to the current profile.",
		args	= {
			{
				option	= "char",
				desc	= "Load a profile specific to this character. Enter 'all' or a specific "..
						  "addon name to populate this profile.",
				method	= "UseProfileChar",
			},
			{
				option	= "class",
				desc	= "Load a profile specific to this character's class. Enter 'all' or "..
						  "a specific addon name to populate this profile.",
				method	= "UseProfileClass"
			},
			{
				option	= ACE_PROFILE_DEFAULT,
				desc	= "Load the default profile for this character. This profile is "..
						  "automatically populated with each addon.",
				method	= "UseProfileDefault"
			},
		},
	}
}
end