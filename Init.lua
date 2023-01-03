----------------------------------------------------------------------------------
------------------------------- ADDON INITIALIZING -------------------------------
----------------------------------------------------------------------------------

-- Creating hidden support frame
MCF = CreateFrame("Frame");

-- Creating options frame (temporary via functions, later will be made in XML)
MCF_CreateOptionsFrame();
MCF_CreateOptionsText();

-- Register event to initialize addon's job
MCF:RegisterEvent("PLAYER_ENTERING_WORLD");
MCF:RegisterEvent("ADDON_LOADED");
MCF:RegisterEvent("PLAYER_REGEN_ENABLED");

-- Setting script to addon's support frame
MCF:SetScript("OnEvent", MCF_OnEvent);
