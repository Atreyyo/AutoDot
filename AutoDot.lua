-- AutoDot by Atreyyo
-- GitHub.com/Atreyyo

AutoDot = CreateFrame("Frame",nil,UIParent); -- Event Frame

AutoDot.Default = {
	["Curse of Agony"] = 0,
	["Corruption"] = 0,
	["Siphon Life"] = 0,
}

AutoDot:RegisterEvent("ADDON_LOADED")
AutoDot:RegisterEvent("PLAYER_TARGET_CHANGED")

function AutoDot:OnEvent()
	if event == "ADDON_LOADED" and arg1 == "AutoDot" then
		DEFAULT_CHAT_FRAME:AddMessage("AutoDot: loaded")
		DEFAULT_CHAT_FRAME:AddMessage("AutoDot: /autodot")
		AutoDot:UnregisterEvent("ADDON_LOADED")
		if AutoDot.Settings == nil then
			AutoDot.Settings = AutoDot.Default
			AutoDot.Settings["Curse of Agony"] = 0
			AutoDot.Settings["Corruption"] = 0
			AutoDot.Settings["Siphon Life"] = 0
		end
		SLASH_AUTODOT1 = "/autodot";
		SlashCmdList["AUTODOT"] = AutoDot.Cast;
	elseif event == "PLAYER_TARGET_CHANGED" then
		AutoDot.Settings["Curse of Agony"] = 0
		AutoDot.Settings["Corruption"] = 0
		AutoDot.Settings["Siphon Life"] = 0
end

function AutoDot:Cast()
	if AutoDot.Settings["Curse of Agony"] == 0 or (GetTime()-AutoDot.Settings["Curse of Agony"] > 24) then
		CastSpellByName("Curse of Agony")
		AutoDot.Settings["Curse of Agony"] = GetTime()
		return
	end
	if AutoDot.Settings["Corruption"] == 0 or (GetTime()-AutoDot.Settings["Corruption"] > 18) then
		CastSpellByName("Corruption")
		AutoDot.Settings["Corruption"] = GetTime()
		return
	end
	if AutoDot.Settings["Siphon Life"] == 0 or (GetTime()-AutoDot.Settings["Siphon Life"] > 30) then
		CastSpellByName("Siphon Life")
		AutoDot.Settings["Siphon Life"] = GetTime()
		return
	end
end

AutoDot:SetScript("OnEvent", AutoDot.OnEvent)