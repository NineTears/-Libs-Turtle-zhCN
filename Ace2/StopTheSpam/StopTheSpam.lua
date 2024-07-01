StopTheSpam = AceLibrary("AceAddon-2.0"):new("AceHook-2.1", "AceEvent-2.0", "AceDebug-2.0")

--[[ ------------------------------------------------------------------------ ]]

local ALLOW = 1
local DENY  = 0
local DELAY = 5.0

--[[ ------------------------------------------------------------------------ ]]

function StopTheSpam:Initialize()
	-- Setup debugging.
	self.debugFrame = ChatFrame3
	self:SetDebugLevel(1)
	self:SetDebugging(false)
	
	-- Hook the default chat frame's AddMessage method.
	self:Hook(ChatFrame1, "AddMessage")
	
	-- Hook the combat log frame's AddMessage method to catch Gatherer.
	self:Hook(ChatFrame2, "AddMessage")
	
	-- Schedule an event to disable the filters.
	self:ScheduleEvent(self.Release, DELAY, self)
end

function StopTheSpam:AddMessage(obj, msg, r, g, b, id)
	if self:IsMessageSpam(msg, id, this) then
		-- Discard the message.
		self:LevelDebug(1, "Message FAILS.")
	else
		-- Let the message pass through.
		self:LevelDebug(1, "Message PASSES.")
		self.hooks[obj].AddMessage(obj, msg, r, g, b, id)
	end
end

StopTheSpam.ruleset = {}

StopTheSpam.ruleset.order = {
	-- Allowed addons.
	"warmup",
	"buggrabber",
	-- Global deny.
	"msgid",
	-- Denied addons.
	-- Late loading denied addons.
	"ace",
	"dkptable",
	-- Uncommon denies.
	"timeplayed",
	-- Default fallthrough.
	"default"
}

-- The order of the rules here does not matter.
StopTheSpam.ruleset.rules = {
	["warmup"] = {
		test = function (msg, id, frame) return WarmupFrame and frame == WarmupFrame end,
		invalidate = true,
		action = ALLOW
	},
	["buggrabber"] = {
		test = function (msg, id, frame) return BugGrabber and frame == BugGrabber end,
		invalidate = true,
		action = ALLOW
	},
	["msgid"] = {
		test = function (msg, id, frame) return not id or id > ChatTypeInfo.CHANNEL10.id end,
		action = DENY
	},
	["ace"] = {
		test = function (msg, id, frame) return AceEventFrame and frame == AceEventFrame end,
		invalidate = true,
		action = DENY
	},
	["dkptable"] = {
		test = function (msg, id, frame) return DKPT_Main_Frame and frame == DKPT_Main_Frame end,
		expire = 1,
		action = DENY
	},
	["timeplayed"] = {
		test = function (msg, id, frame) return string.find(string.lower(msg), string.lower(TIME_PLAYED_MSG)) end,
		action = DENY
	},
	["default"] = {
		action = ALLOW
	}
}

function StopTheSpam:IsMessageSpam(msg, id, frame)
	local ruleset = self.ruleset
	
	self:LevelDebug(1, "IsMessageSpam(%s, %s, %s)", string.gsub(tostring(msg), "|", "||"), tostring(id), frame and (frame.GetName and frame:GetName() or "(no name)") or "(no frame)")
	
	if msg then
		for i, name in ipairs(ruleset.order) do
			local rule = ruleset.rules[name]
			
			-- Disabled rules should be ignored.
			if not rule.disabled then
				-- If the rule tests true then there is a match. The absence of a test implies a positive match.
				local match = not rule.test or rule.test(msg, id, frame)
				
				-- The rule matches but it may not actually be spam.
				if match then
					self:LevelDebug(2, "  Rule %d '%s' MATCHES. Result '%s' Action '%s'", i, name, tostring(match), rule.action == ALLOW and "ALLOW" or "DENY")
					
					-- Update the expiration count and handle expired rules if necessary.
					if rule.expire then
						if rule.expire <= 1 then
							self:LevelDebug(2, "    Rule has EXPIRED.")
							table.remove(ruleset.order, i)
						else
							rule.expire = rule.expire - 1
							self:LevelDebug(3, "    Rule will expire. Expire '%d'", rule.expire)
						end
					end
					
					-- If this is a deny rule, then this message is spam.
					return rule.action == DENY
				-- If the rule returned nil, then it is invalid.
				elseif match == nil then -- Must explicitly test for nil!
					self:LevelDebug(2, "  Rule %d '%s' is INVALID.", i, name)
					-- If the rule is set to invalidate then it should be removed from further tests.
					if rule.invalidate then
						table.remove(ruleset.order, i)
						i = i - 1
						self:LevelDebug(2, "    Rule has been REMOVED.")
					end
				else
					-- If the rule returned false, then there is no match and the message is not spam.
					self:LevelDebug(2, "  Rule %d '%s' does not match. Result '%s'", i, name, tostring(match))
				end
			else
				self:LevelDebug(2, "  Rule %d '%s' is DISABLED.", i, name)
			end
		end
	end
end

function StopTheSpam:Release()
	self:LevelDebug(1, "Unhooking the filters")
	self:Unhook(ChatFrame1, "AddMessage")
	self:Unhook(ChatFrame2, "AddMessage")
	-- Discard anything that is no longer needed.
	self.ruleset = nil
	self.Initialize = nil
	self.AddMessage = nil
	self.IsMessageSpam = nil
	self.OnInitialize = nil
	self.Release = nil
end

function StopTheSpam:OnInitialize()
	-- Spam the user with another addon loaded message.
	DEFAULT_CHAT_FRAME:AddMessage("Malreth's StopTheSpam Loaded!")
end

--[[ ------------------------------------------------------------------------ ]]

StopTheSpam:Initialize()

--[[ ------------------------------------------------------------------------ ]]