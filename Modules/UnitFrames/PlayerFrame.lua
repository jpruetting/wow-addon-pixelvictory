-- seconds to fade in/out on mouseover
local secondsToFade = 0.35;

local function fadeInPlayerFrame(secondsToFade)
   UIFrameFadeIn(PlayerFrame, secondsToFade * (1 - PlayerFrame:GetAlpha()), PlayerFrame:GetAlpha(), 1);
end

local function fadeOutPlayerFrame(secondsToFade)
   UIFrameFadeIn(PlayerFrame, secondsToFade * PlayerFrame:GetAlpha(), PlayerFrame:GetAlpha(), 0);
end

local function handlePlayerTargetChangedEvent(self, event, ...)
   if UnitExists("target") then
      fadeInPlayerFrame(0);
   else
      fadeOutPlayerFrame(0);
   end
end

local function handlePlayerFrameMouseInEvent(self, event, ...)
   fadeInPlayerFrame(secondsToFade);
end

local function handlePlayerFrameMouseOutEvent(self, event, ...)
   if not UnitExists("target") then
      fadeOutPlayerFrame(secondsToFade);
   end
end

local playerTargetChangedEventFrame = CreateFrame("Frame");
playerTargetChangedEventFrame:RegisterEvent("PLAYER_TARGET_CHANGED");
playerTargetChangedEventFrame:SetScript("OnEvent", handlePlayerTargetChangedEvent);

PlayerFrame:SetScript("OnEnter", handlePlayerFrameMouseInEvent);
PlayerFrame:SetScript("OnLeave", handlePlayerFrameMouseOutEvent);

PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar:SetScript("OnEnter", handlePlayerFrameMouseInEvent);
PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar:SetScript("OnLeave", handlePlayerFrameMouseOutEvent);

PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar:SetScript("OnEnter", handlePlayerFrameMouseInEvent);
PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar:SetScript("OnLeave", handlePlayerFrameMouseOutEvent);

-- Slow fade out on load
if not UnitExists("target") then
   fadeOutPlayerFrame(4);
end
