local addonName, L = ...;

local function defaultFunc(L, key)
    --[[ print("MCF debug - send it to author - key is missing:", key); ]]
    return key;
end
setmetatable(L, {__index=defaultFunc});

if GetLocale() == ("enUS") then
    L["MCF_OPTIONS_DESCRIPTION"] = "Re-skins default Character frame into modern version.\n\nVersion: " .. GetAddOnMetadata("ModernCharacterFrame", "Version") .. ".\nAuthor: Профессия — Flamegor (EU).";
    L["MCF_OPTIONS_TT_INTEGRATION_TITLE"] = "TacoTip's Gear Score";
    L["MCF_OPTIONS_TT_INTEGRATION_TITLE_DISABLED"] = "TacoTip's Gear Score "..RED_FONT_COLOR_CODE.."(AddOn isn't loaded)"..FONT_COLOR_CODE_CLOSE;
    L["MCF_OPTIONS_TT_INTEGRATION_ENABLE_LABEL"] = "Show Gear Score";
    L["MCF_OPTIONS_TT_INTEGRATION_ENABLE_TOOLTIP"] = "Show Gear Score value on Stats panel in line \"Item Level\".";
    L["MCF_OPTIONS_TT_INTEGRATION_GSTYPE_LABEL"] = "Display style";
    L["MCF_OPTIONS_TT_INTEGRATION_GSTYPE_TOOLTIP"] = "Choose Gear Score value display style.";
    L["MCF_OPTIONS_TT_INTEGRATION_COLOR_LABEL"] = "Color Gear Score";
    L["MCF_OPTIONS_TT_INTEGRATION_COLOR_TOOLTIP"] = "Enable colorizing for Gear Score numbers based on its value.";
    L["MCF_OPTIONS_RESET_BUTTON_TEXT"] = "Reset settings";
    L["MCF_OPTIONS_RESET_BUTTON_TOOLTIP"] = "Reset addon's and Character frame's settings to default state.";
    L["MCF_OPTIONS_CONFIRM_RESET"] = "Are you sure you want to reset Modern Character Frame settings?";
    L["MCF_OPTIONS_RESETED_MESSAGE"] = "Modern Character Frame settings have been reset.";

    L["MCF_PLAYER_LEVEL"] = "Level %s |c%s%s %s|r";
    L["MCF_PLAYER_LEVEL_NO_SPEC"] = "Level %s |c%s%s|r";

    L["MCF_STATS_COLLAPSE_TOOLTIP"] = "Hide Character Information";
    L["MCF_STATS_EXPAND_TOOLTIP"] = "Show Character Information";
    L["MCF_PET_STATS_COLLAPSE_TOOLTIP"] = "Hide Pet Information";
    L["MCF_PET_STATS_EXPAND_TOOLTIP"] = "Show Pet Information";

    L["MCF_DEFAULT_STAT1_TOOLTIP"] = DEFAULT_STAT1_TOOLTIP; --"Increases Attack Power by %d";
    L["MCF_DEFAULT_STAT2_TOOLTIP"] = DEFAULT_STAT2_TOOLTIP; --"Increases Critical Hit chance by %.2f%%";
    L["MCF_DEFAULT_STAT3_TOOLTIP"] = DEFAULT_STAT3_TOOLTIP; --"Increases Health by %d";
    L["MCF_DEFAULT_STAT4_TOOLTIP"] = "Increases Mana by %d|nIncreases Spell Power (WRONG - WORK IN PROGRESS) by %d|nIncreases Spell Critical Hit by %.2f%%";
    L["MCF_MANA_REGEN_FROM_SPIRIT"] = MANA_REGEN_FROM_SPIRIT; --"Increases Mana Regeneration by %d Per 5 Seconds while not casting";
    L["MCF_STAT_TOOLTIP_BONUS_AP"] = "Increases Attack Power by %d.\n";

    L["MCF_STAT_MOVEMENT_SPEED"] = "Speed";
    L["MCF_STAT_ATTACK_POWER"] = "Attack Power";
    L["MCF_STAT_DPS_SHORT"] = STAT_DPS_SHORT; --"Урон в сек";
    L["MCF_WEAPON_SPEED"] = WEAPON_SPEED; --"Скорость атаки";
    L["MCF_STAT_HASTE"] = "Haste";
    L["MCF_STAT_ARMOR_PENETRATION"] = "Armor Penetration";

    L["MCF_CR_CRIT_MELEE_TOOLTIP"] = "Chance of attacks doing extra damage.\nCrit rating %d (+%.2f%% crit chance)";
    L["MCF_CR_CRIT_RANGED_TOOLTIP"] = "Chance of attacks doing extra damage.\nCrit rating %d (+%.2f%% crit chance)";
    L["MCF_CR_CRIT_SPELL_TOOLTIP"] = "Chance of spells doing extra damage.\nCrit rating %d (+%.2f%% crit chance)";
    L["MCF_STAT_HASTE_BASE_TOOLTIP"] = "\nHaste rating %d (+%.2f%% Haste)";
    L["MCF_MANA_REGEN_TOOLTIP"] = "%d mana regenerated every 5 seconds while not in combat.";
    L["MCF_CR_BLOCK_TOOLTIP"] = CR_BLOCK_TOOLTIP; --"Рейтинг блока %d увеличивает вероятность блокировать удар на %.2f%%.\nПри успешном блоке урон уменьшается на %d%%.";
    L["MCF_RESISTANCE_TOOLTIP_SUBTEXT"] = "Reduces %s damage taken by an average of %.2f%%.";
    L["MCF_CR_ARMOR_PENETRATION_TOOLTIP"] = "Reduces enemy armor (only for your attacks).\nArmor Penetration Rating: %d (enemy armor reduced for %.2f%%).";

    L["MCF_STAT_AVERAGE_ITEM_LEVEL"] = STAT_AVERAGE_ITEM_LEVEL; --"Ур. предметов";
    L["MCF_STAT_AVERAGE_ITEM_LEVEL_EQUIPPED"] = STAT_AVERAGE_ITEM_LEVEL_EQUIPPED; --"(Надето %d)";
    L["MCF_STAT_GEARSCORE_LABEL"] = "Item Level (GS)";
    L["MCF_STAT_GEARSCORE"] = "(Gear Score %d)";
end