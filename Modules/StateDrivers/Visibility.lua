-- Primary ActionBar needs different rules since it's used for vehicles and other special states
RegisterStateDriver(MainMenuBar, "visibility", "[petbattle]hide;[mod:alt]show;hide");

local visibilityRules = "[petbattle]hide;[possessbar]hide;[target=vehicle,exists]hide;[overridebar]hide;[vehicleui]hide;[mod:alt]show;hide"

-- ActionBars
RegisterStateDriver(MultiBarLeft, "visibility", visibilityRules);
RegisterStateDriver(MultiBarRight, "visibility", visibilityRules);
RegisterStateDriver(MultiBarBottomLeft, "visibility", visibilityRules);
RegisterStateDriver(MultiBarBottomRight, "visibility", visibilityRules);
RegisterStateDriver(MultiBar5, "visibility", visibilityRules);
RegisterStateDriver(MultiBar6, "visibility", visibilityRules);
RegisterStateDriver(MultiBar7, "visibility", visibilityRules);
RegisterStateDriver(StanceBar, "visibility", visibilityRules);

-- XP, rep, and honor bars
RegisterStateDriver(StatusTrackingBarManager, "visibility", visibilityRules);

-- Quest Tracker
RegisterStateDriver(ObjectiveTrackerFrame, "visibility", visibilityRules);

-- Bags and menu bar
RegisterStateDriver(MicroButtonAndBagsBar, "visibility", visibilityRules);

-- Chat buttons
RegisterStateDriver(QuickJoinToastButton, "visibility", visibilityRules);
RegisterStateDriver(ChatFrameChannelButton, "visibility", visibilityRules);
RegisterStateDriver(ChatFrameMenuButton, "visibility", visibilityRules);

-- Chat tabs
RegisterStateDriver(GeneralDockManager, "visibility", visibilityRules);

-- Buffs
RegisterStateDriver(BuffFrame, "visibility", visibilityRules);

-- Covenant Minimap Button
RegisterStateDriver(ExpansionLandingPageMinimapButton, "visibility", visibilityRules);

-- Minimap zone and calendar
RegisterStateDriver(MinimapCluster.ZoneTextButton, "visibility", visibilityRules);
RegisterStateDriver(MinimapCluster.Tracking, "visibility", visibilityRules);
RegisterStateDriver(MinimapCluster.BorderTop, "visibility", visibilityRules);
RegisterStateDriver(GameTimeFrame, "visibility", visibilityRules);