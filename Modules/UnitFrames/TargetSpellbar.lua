-- Modified copy of TargetSpellBarMixin:OnEvent
local function handleTargetSpellbarEvent(self, event, ...)
	local arg1 = ...

	if ((event == "VARIABLES_LOADED") or ((event == "CVAR_UPDATE") and (arg1 == "showTargetCastbar"))) then
		if (GetCVar("showTargetCastbar") == "0") then
			self.showCastbar = false;
		else
			self.showCastbar = true;
		end

		if (not self.showCastbar) then
			self:Hide();
		elseif (self.casting or self.channeling) then
			self:Show();
		end
		return;
	elseif (event == self.updateEvent) then
		local nameChannel  = UnitChannelInfo(self.unit);
		local nameSpell  = UnitCastingInfo(self.unit);
		if (nameChannel) then
			event = "UNIT_SPELLCAST_CHANNEL_START";
			arg1 = self.unit;
		elseif (nameSpell) then
			event = "UNIT_SPELLCAST_START";
			arg1 = self.unit;
		else
			self.casting = nil;
			self.channeling = nil;
			self:SetMinMaxValues(0, 0);
			self:SetValue(0);
			self:Hide();
			return;
		end
	end
	CastingBarMixin.OnEvent(self, event, arg1, select(2, ...));
end

local function createTargetSpellbar(name)
	local frame = CreateFrame("STATUSBAR", name, TargetFrame, "SmallCastingBarFrameTemplate");

	local updateEvent = "PLAYER_TARGET_CHANGED";

	frame.updateEvent = updateEvent;

	frame:RegisterEvent(updateEvent);
	frame:RegisterEvent("CVAR_UPDATE");
	frame:RegisterEvent("VARIABLES_LOADED");

	frame:SetScript("OnEvent", handleTargetSpellbarEvent);

	frame:SetUnit(TargetFrame.unit, false, true);

	frame:SetLook("UNITFRAME");

	frame.Icon:SetSize(15, 15);
	frame.Icon:SetPoint("RIGHT", frame, "LEFT", -4, 0);

	frame.BorderShield:ClearAllPoints();
	frame.BorderShield:SetSize(25, 28);
	frame.BorderShield:SetPoint("TOPLEFT", -24, 6);

	return frame;
end

-- Disable default target spellbar
TargetFrame.spellbar:UnregisterAllEvents();

-- Create new target spellbar
local newTargetSpellbar = createTargetSpellbar("PixelVictoryTargetFrameSpellBar");

-- Position new target spellbar
newTargetSpellbar:SetPoint("TOPLEFT", TargetFrame, "BOTTOMLEFT", 43, 10);


