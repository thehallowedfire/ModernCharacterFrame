local _, L = ...;

----------------------------------------------------------------------------------
----------------------------- OPTION PANEL FUNCTIONS -----------------------------
----------------------------------------------------------------------------------

-- Creating Interface/AddOns options tab
function MCF_CreateOptionsFrame()
    MCF.OptionsFrame = CreateFrame("Frame", "MCF_OptionsFrame", nil, "MCF_OptionsFrameTemplate");
end

-- OPTIONS FRAME FUNCTIONS
function MCF_OptionsFrame_OnLoad(self)
    self.name = "Modern Character Frame";
    InterfaceOptions_AddCategory(self);
    
    _G[self:GetName().."SubText"]:SetText(L["MCF_OPTIONS_DESCRIPTION"]);
    _G[self:GetName().."TacoTipIntegrationTitle"]:SetText(L["MCF_OPTIONS_TT_INTEGRATION_TITLE"]);
end
function MCF_OptionsFrame_Update()
    local optionsFrame = MCF_OptionsFrame;
    local TTIntegration = _G[optionsFrame:GetName().."TacoTipIntegration"];
    local TTEnableButton = _G[TTIntegration:GetName().."EnableButton"];
    local TTGSDropDown = _G[TTIntegration:GetName().."GSStatTypeDropDown"];
    local TTColorButton = _G[TTIntegration:GetName().."GSColorEnableButton"];

    if ( not MCF_GetSettings("TT_IntegrationEnabled") ) then
        -- TT Integration Enable button
        TTEnableButton:SetChecked(false);
    else
        TTEnableButton:SetChecked(true);
    end

    TTGSDropDown:SetValue(TTGSDropDown.defaultValue);
    MCF_OptionsFrameGSTextTypeDropDown_OnLoad(TTGSDropDown);

    if ( not MCF_GetSettings("TT_IntegrationColorEnabled") ) then
        TTColorButton:SetChecked(false);
    else
        TTColorButton:SetChecked(true);
    end

    if ( not IsAddOnLoaded("TacoTip") ) then
        TTEnableButton:Disable();
        TTEnableButton.Text:SetFontObject(GameFontDisable);

        UIDropDownMenu_DisableDropDown(TTGSDropDown);

        TTColorButton:Disable();
        TTColorButton.Text:SetFontObject(GameFontDisable);
    elseif ( TTEnableButton:GetChecked() ) then
        UIDropDownMenu_EnableDropDown(TTGSDropDown);

        TTColorButton:Enable();
        TTColorButton.Text:SetFontObject(GameFontHighlight);
    end
end

-- TACOTIP INTEGRATION ENABLE BUTTON FUNCTIONS
function MCF_OptionsFrameTTEnableButton_OnLoad(self)
    self.Text:SetText(L["MCF_OPTIONS_TT_INTEGRATION_ENABLE_LABEL"]);
    self.tooltip = L["MCF_OPTIONS_TT_INTEGRATION_ENABLE_TOOLTIP"];

    if ( not MCF_GetSettings("TT_IntegrationEnabled") ) then
        self:SetChecked(false);
    else
        self:SetChecked(true);
    end

    self:HookScript("OnClick", function(self) MCF_OptionsFrameTTEnableButton_HookOnClick(self); end);
end
function MCF_OptionsFrameTTEnableButton_OnShow(self)
    if ( not IsAddOnLoaded("TacoTip") ) then
        self:Disable();
        self.Text:SetFontObject(GameFontDisable);
        _G[self:GetParent():GetName().."Title"]:SetText(L["MCF_OPTIONS_TT_INTEGRATION_TITLE_DISABLED"]);
    end
end
function MCF_OptionsFrameTTEnableButton_HookOnClick(self)
    local ColorEnableButton = _G[self:GetParent():GetName().."GSColorEnableButton"];
    if ( self:GetChecked() ) then
        MCF_SetSettings("TT_IntegrationEnabled", true);
        ColorEnableButton:Enable();
        ColorEnableButton.Text:SetFontObject(GameFontHighlight);
        UIDropDownMenu_EnableDropDown(MCF_OptionsFrameTacoTipIntegrationGSStatTypeDropDown);
    else
        MCF_SetSettings("TT_IntegrationEnabled", false);
        ColorEnableButton:Disable();
        ColorEnableButton.Text:SetFontObject(GameFontDisable);
        UIDropDownMenu_DisableDropDown(MCF_OptionsFrameTacoTipIntegrationGSStatTypeDropDown);
    end
end

-- TACOTIP GEARSCORE TEXT TYPE DROPDOWN MENU FUNCTIONS
function MCF_OptionsFrameGSTextTypeDropDown_OnLoad(self)
    _G[self:GetName().."Label"]:SetText(L["MCF_OPTIONS_TT_INTEGRATION_GSTYPE_LABEL"]);

    self.defaultValue = 1;
    self.oldValue = MCF_GetSettings("TT_IntegrationType");
    self.value = self.oldValue;
    self.tooltip = L["MCF_OPTIONS_TT_INTEGRATION_GSTYPE_TOOLTIP"];

    UIDropDownMenu_SetWidth(self, 90);
    UIDropDownMenu_Initialize(self, MCF_OptionsFrameGSTextTypeDropDown_Initialize);
    UIDropDownMenu_SetSelectedValue(self, self.value);

    self.SetValue =
        function(self, value)
            self.value = value;
            UIDropDownMenu_SetSelectedValue(self, value);
            MCF_SetSettings("TT_IntegrationType", value);
        end;
    self.GetValue =
        function(self)
            return UIDropDownMenu_GetSelectedValue(self);
        end;
    self.RefreshValue =
        function(self)
            UIDropDownMenu_Initialize(self, MCF_OptionsFrameGSTextTypeDropDown_Initialize);
            UIDropDownMenu_SetSelectedValue(self, self.value);
        end;
end
function MCF_OptionsFrameGSTextTypeDropDown_Initialize()
    local selectedValue = UIDropDownMenu_GetSelectedValue(MCF_OptionsFrameTacoTipIntegrationGSStatTypeDropDown);
    local info = UIDropDownMenu_CreateInfo();

    info.func = MCF_OptionsFrameGSTextTypeDropDown_OnClick;

    info.text = "ILVL / GS";
    info.value = 1;
    info.checked = info.value == selectedValue;
    UIDropDownMenu_AddButton(info);

    info.text = "ILVL (GS)";
    info.value = 2;
    info.checked = info.value == selectedValue;
    UIDropDownMenu_AddButton(info);

    info.text = "GS";
    info.value = 3;
    info.checked = info.value == selectedValue;
    UIDropDownMenu_AddButton(info);


end
function MCF_OptionsFrameGSTextTypeDropDown_OnShow(self)
    local EnableButton = _G[self:GetParent():GetName().."EnableButton"];
    if ( (not EnableButton:GetChecked()) or (not EnableButton:IsEnabled()) ) then
        UIDropDownMenu_DisableDropDown(self);
        self.Text:SetFontObject(GameFontDisable);
    end
end
function MCF_OptionsFrameGSTextTypeDropDown_OnClick(self)
	MCF_OptionsFrameTacoTipIntegrationGSStatTypeDropDown:SetValue(self.value);
end

-- TACOTIP GEARSCORE COLOR ENABLE BUTTON FUNCTIONS
function MCF_OptionsFrameGSColorEnableButton_OnLoad(self)
    self.Text:SetText(L["MCF_OPTIONS_TT_INTEGRATION_COLOR_LABEL"]);
    self.tooltip = L["MCF_OPTIONS_TT_INTEGRATION_COLOR_TOOLTIP"];

    if ( not MCF_GetSettings("TT_IntegrationColorEnabled") ) then
        self:SetChecked(false);
    else
        self:SetChecked(true);
    end

    self:HookScript("OnClick", function(self) MCF_OptionsFrameGSColorEnableButton_HookOnClick(self); end);
end
function MCF_OptionsFrameGSColorEnableButton_OnShow(self)
    local EnableButton = _G[self:GetParent():GetName().."EnableButton"];
    if ( (not EnableButton:GetChecked()) or (not EnableButton:IsEnabled()) ) then
        self:Disable();
        self.Text:SetFontObject(GameFontDisable);
    end
end
function MCF_OptionsFrameGSColorEnableButton_HookOnClick(self)
    if ( self:GetChecked() ) then
        MCF_SetSettings("TT_IntegrationColorEnabled", true);
    else
        MCF_SetSettings("TT_IntegrationColorEnabled", false);
    end
end

-- RESET SETTINGS BUTTON FUNCTIONS
function MCF_OptionsFrameResetSettingsButton_OnLoad(self)
    self.text:SetText(L["MCF_OPTIONS_RESET_BUTTON_TEXT"]);

    self.tooltip = L["MCF_OPTIONS_RESET_BUTTON_TOOLTIP"];
    self:SetWidth(self.text:GetWidth() + 40);
end
function MCF_OptionsFrameResetSettingsButton_OnShow(self)
    self:Enable();
end
function MCF_OptionsFrameResetSettingsButton_OnClick(self)
    StaticPopupDialogs["MCF_RESET_SETTINGS"] = {
        text = L["MCF_OPTIONS_CONFIRM_RESET"],
        button1 = YES,
        button2 = NO,
        OnAccept = function()
            MCF_ResetSettings();
            MCF_OptionsFrame_Update();
            SendSystemMessage(L["MCF_OPTIONS_RESETED_MESSAGE"]);
            self:Disable();
        end,
        OnCancel = function()
            self:Enable();
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
    }

    StaticPopup_Show("MCF_RESET_SETTINGS", self);
end