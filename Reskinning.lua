----------------------------------------------------------------------------------
------------------------------ RESKINNING FUNCTIONS ------------------------------
----------------------------------------------------------------------------------

-- Cleaning CharacterFrame from unused widgets
local UnnecessaryFrames = {
    CharacterResistanceFrame,
    CharacterAttributesFrame,
    CharacterModelFrameRotateRightButton,
    CharacterModelFrameRotateLeftButton,
    GearManagerToggleButton,
    PlayerTitleDropDown,

    GearSetButton1,
    GearSetButton2,
    GearSetButton3,
    GearSetButton4,
    GearSetButton5,
    GearSetButton6,
    GearSetButton7,
    GearSetButton8,
    GearSetButton9,
    GearSetButton10,
    GearManagerDialogDeleteSet,
    GearManagerDialogEquipSet,
    GearManagerDialogSaveSet,
    GearManagerDialogClose,
    GearManagerDialog.Title,
    GearManagerDialogTitleBG,
    GearManagerDialogDialogBG,
    GearManagerDialogTop,
    GearManagerDialogTopRight,
    GearManagerDialogRight,
    GearManagerDialogBottomRight,
    GearManagerDialogBottom,
    GearManagerDialogBottomLeft,
    GearManagerDialogLeft,
    GearManagerDialogTopLeft,
};
function MCF_CleanDefaultFrame()
    for _, frame in pairs(UnnecessaryFrames) do
        if ( frame ) then
            frame:Hide();
        end
    end
end

-- Cleaning default texture
function MCF_DeleteFrameTextures(frame)
    local inversedAttributes = {};
    for k, v in pairs(frame) do
        if ( (type(v) == "table") and v:GetObjectType() and (v:GetObjectType() == "Texture") ) then
            inversedAttributes[v] = k;
        end
    end

    for _, child in pairs({ frame:GetRegions() }) do
        if ( not inversedAttributes[child] and (child:GetObjectType() == "Texture") ) then
            child:SetTexture("");
        end
    end
end

-- Creating new textures and frames for PaperDollFrame
function MCF_CreateNewFrameTextures(frame)
    -- Setting portrait's layer to OVERLAY because it's on BACKGROUND by default
    CharacterFramePortrait:SetDrawLayer("BORDER", -1);

    -- Creating new bg and border textures
    frame:CreateTexture("$parentBg", "BACKGROUND", "MCF-PaperDollFrameBgTemplate", -6);
    frame:CreateTexture("$parentTitleBg", "BACKGROUND", "MCF-PaperDollFrameTitleBgTemplate", -6);
    frame:CreateTexture("$parentPortraitFrame", "OVERLAY", "MCF-PaperDollPortraitFrameTemplate");
    frame:CreateTexture("$parentTopRightCorner", "OVERLAY", "MCF-TopRightCornerTemplate");
    frame:CreateTexture("$parentTopLeftCorner", "OVERLAY", "MCF-TopLeftCornerTemplate");
    frame:CreateTexture("$parentTopBorder", "OVERLAY", "MCF-TopBorderTemplate");
    frame:CreateTexture("$parentTopTileStreaks", "BORDER", "MCF-TopTileStreaksTemplate", -2);
    frame:CreateTexture("$parentBotLeftCorner", "BORDER", "MCF-BotLeftCornerTemplate");
    frame:CreateTexture("$parentBotRightCorner", "BORDER", "MCF-BotRightCornerTemplate");
    frame:CreateTexture("$parentBottomBorder", "BORDER", "MCF-BottomBorderTemplate");
    frame:CreateTexture("$parentLeftBorder", "BORDER", "MCF-LeftBorderTemplate");
    frame:CreateTexture("$parentRightBorder", "BORDER", "MCF-RightBorderTemplate");
    --[[ frame:CreateTexture("$parentBtnCornerLeft", "BORDER", "MCF-BtnCornerLeftTemplate", 1);
    frame:CreateTexture("$parentBtnCornerRight", "BORDER", "MCF-BtnCornerRightTemplate", 1);
    frame:CreateTexture("$parentButtonBottomBorder", "BORDER", "MCF-ButtonBottomBorderTemplate", 1); ]]

    -- Creating ItemSlot textures under item icons - Left side
    CharacterHeadSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterNeckSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterShoulderSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterBackSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterChestSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterShirtSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterTabardSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    CharacterWristSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-LeftItemSlotTemplate", -1);
    -- Creating ItemSlot textures under item icons - Right side
    CharacterHandsSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterWaistSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterLegsSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterFeetSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterFinger0Slot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterFinger1Slot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterTrinket0Slot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    CharacterTrinket1Slot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-RightItemSlotTemplate", -1);
    -- Creating ItemSlot textures under item icons - Bottom side
    CharacterMainHandSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-BottomItemSlotTemplate", -1);
    CharacterSecondaryHandSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-BottomItemSlotTemplate", -1);
    CharacterRangedSlot:CreateTexture("$parentFrame", "BACKGROUND", "MCF-BottomItemSlotTemplate", -1);
    -- Creating ItemSlot textures under item icons - Borders for bottom items (left and right vertical lines)
    CharacterMainHandSlot:CreateTexture(nil, "BACKGROUND", "MCF-BottomItemSlotLeftBorderTemplate");
    CharacterRangedSlot:CreateTexture(nil, "BACKGROUND", "MCF-BottomItemSlotRightBorderTemplate");   
end

function MCF_CreateNewCharacterFrameElements(frame)
    -- Creating inset under PaperDoll and Character model
    frame.Inset = CreateFrame("Frame", "$parentInset", frame, "InsetFrameTemplate");
    frame.Inset:SetPoint("TOPLEFT", 18, -72);
    frame.Inset:SetSize(328, 360);
    -- HACK to make inset bottom border smaller
    frame.Inset.InsetBorderBottomLeft:SetPoint("BOTTOMLEFT", CharacterFrame.Inset.Bg, 0, -3);
    frame.Inset.InsetBorderBottomRight:SetPoint("BOTTOMRIGHT", CharacterFrame.Inset.Bg, 0, -3);

    -- Creating right inset
    frame.InsetRight = CreateFrame("Frame", "$parentInsetRight", frame, "InsetFrameTemplate");
    frame.InsetRight:SetPoint("TOPLEFT", "CharacterFrameInset", "TOPRIGHT", -2, 0);
    frame.InsetRight:SetSize(203, 360);

    -- Creating expand/collapse button
    frame.ExpandButton = CreateFrame("Button", "$parentExpandButton", frame, "MCF-CharacterFrameExpandButtonTemplate");
end

function MCF_CreateSidebarTabsPanel(frame)
    frame.Sidebar = CreateFrame("Frame", "PaperDollSidebarTabs", frame, "MCF-PaperDollSidebarTabsTemplate");
end

function MCF_ReskinTabButtons(tabButton)
    local activeTexture = "Interface\\AddOns\\ModernCharacterFrame\\Textures\\UI-Character-ActiveTab";
    local inactiveTexture = "Interface\\AddOns\\ModernCharacterFrame\\Textures\\UI-Character-InActiveTab";

    local LeftDisabled = _G[tabButton:GetName().."LeftDisabled"];
    local MiddleDisabled = _G[tabButton:GetName().."MiddleDisabled"];
    local RightDisabled = _G[tabButton:GetName().."RightDisabled"];
    local Left = _G[tabButton:GetName().."Left"];
    local Middle = _G[tabButton:GetName().."Middle"];
    local Right = _G[tabButton:GetName().."Right"];

    LeftDisabled:SetTexture(activeTexture);
    LeftDisabled:SetSize(20, 34);
    LeftDisabled:SetPoint("TOPLEFT", 0, 0);
    LeftDisabled:SetTexCoord(0, 0.15625, 0, 0.546875);

    MiddleDisabled:SetTexture(activeTexture);
    MiddleDisabled:SetSize(88, 34);
    MiddleDisabled:SetTexCoord(0.15625, 0.84375, 0, 0.546875);

    RightDisabled:SetTexture(activeTexture);
    RightDisabled:SetSize(20, 34);
    RightDisabled:SetTexCoord(0.84375, 1, 0, 0.546875);

    Left:SetTexture(inactiveTexture);
    Left:SetPoint("TOPLEFT", 0, -1);

    Middle:SetTexture(inactiveTexture);

    Right:SetTexture(inactiveTexture);

    tabButton.selectedTextY = nil;
end