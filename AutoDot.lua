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

-- test

AutoDot:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_PARTY_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_PARTY_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_PET_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_PET_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_SELF_HITS")
AutoDot:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE")
AutoDot:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")

--

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
		
	-- test
	
--[[
	elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES" then
	DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES")
	elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS" then
	DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS")
	elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS")
	elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")
	elseif event == "CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS")
	elseif event == "CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES")
	elseif event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS")
	elseif event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES")
	elseif event == "CHAT_MSG_COMBAT_PARTY_HITS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_PARTY_HITS")
	elseif event == "CHAT_MSG_COMBAT_PARTY_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_PARTY_MISSES")
	elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES")
	elseif event == "CHAT_MSG_COMBAT_PET_HITS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_PET_HITS")
	elseif event == "CHAT_MSG_COMBAT_PET_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.. "CHAT_MSG_COMBAT_PET_MISSES")
	elseif event == "CHAT_MSG_COMBAT_SELF_HITS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_COMBAT_SELF_HITS")
	elseif event == "CHAT_MSG_COMBAT_SELF_MISSES" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.. "CHAT_MSG_COMBAT_SELF_MISSES")
	elseif event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.. "CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS")
	elseif event == "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF")
	elseif event == "CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_PARTY_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.. "CHAT_MSG_SPELL_PARTY_DAMAGE")
		--]]
	elseif event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE" then 		-- when dots land on mobs
		if string.find(arg1,"afflicted") then
			for curse,_ in pairs(AutoDot.Settings) do
				if string.find(arg1,curse) then
					--AutoDot.Settings[curse] = GetTime()
				end
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage(arg1)
	elseif event == "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE" then		-- when dots land on enemy players
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE")
		--[[
	elseif event == "CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_PET_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_PET_DAMAGE")
	elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(arg1.."CHAT_MSG_SPELL_SELF_DAMAGE")
	]]
	--
	end
end

function AutoDot:Cast()
	if (AutoDot.Settings["Curse of Agony"] == 0 or (GetTime()-AutoDot.Settings["Curse of Agony"] > 24)) and not AutoDot:GetSpellCooldown("Curse of Agony") then
		CastSpellByName("Curse of Agony")
		AutoDot.Settings["Curse of Agony"] = GetTime()
		return
	end
	if (AutoDot.Settings["Corruption"] == 0 or (GetTime()-AutoDot.Settings["Corruption"] > 18)) and not AutoDot:GetSpellCooldown("Corruption") then
		CastSpellByName("Corruption")
		AutoDot.Settings["Corruption"] = GetTime()
		return
	end
	if (AutoDot.Settings["Siphon Life"] == 0 or (GetTime()-AutoDot.Settings["Siphon Life"] > 30)) and not AutoDot:GetSpellCooldown("Siphon Life") then
		CastSpellByName("Siphon Life")
		AutoDot.Settings["Siphon Life"] = GetTime()
		return
	end
end

function AutoDot:GetSpellCooldown(name)
	local spellID = 1
	local spell = GetSpellName(spellID, BOOKTYPE_SPELL)
	while (spell) do
		local start, duration, hasCooldown = GetSpellCooldown(spellID, BOOKTYPE_SPELL)
		if spell == name and duration > 0 then
			--DEFAULT_CHAT_FRAME:AddMessage(name.." has cooldown: "..duration)
			return true
		end
		spellID = spellID + 1
		spell = GetSpellName(spellID, BOOKTYPE_SPELL)
	end
	--DEFAULT_CHAT_FRAME:AddMessage(name.." has no cooldown")
	return false
end		

AutoDot:SetScript("OnEvent", AutoDot.OnEvent)