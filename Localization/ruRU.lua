local _, L = ...;

if (GetLocale() == "ruRU") then
    L["MCF_OPTIONS_DESCRIPTION"] = "Придает современный вид стандартному окну персонажа.\n\nВерсия: " .. GetAddOnMetadata("ModernCharacterFrame", "Version") .. ".\nАвтор: Профессия — Flamegor (EU).";
    L["MCF_OPTIONS_TT_INTEGRATION_TITLE"] = "TacoTip's Gear Score";
    L["MCF_OPTIONS_TT_INTEGRATION_TITLE_DISABLED"] = "TacoTip's Gear Score "..RED_FONT_COLOR_CODE.."(аддон не загружен)"..FONT_COLOR_CODE_CLOSE;
    L["MCF_OPTIONS_TT_INTEGRATION_ENABLE_LABEL"] = "Отображение Gear Score";
    L["MCF_OPTIONS_TT_INTEGRATION_ENABLE_TOOLTIP"] = "Отображение значения Gear Score в панели характеристик в строке \"Ур. предметов\".";
    L["MCF_OPTIONS_TT_INTEGRATION_GSTYPE_LABEL"] = "Стиль отображения";
    L["MCF_OPTIONS_TT_INTEGRATION_GSTYPE_TOOLTIP"] = "Стиль отображения Gear Score в панели характеристик.";
    L["MCF_OPTIONS_TT_INTEGRATION_COLOR_LABEL"] = "Окрашивание Gear Score";
    L["MCF_OPTIONS_TT_INTEGRATION_COLOR_TOOLTIP"] = "Включить окрашивание значения Gear Score согласно его величине.";
    L["MCF_OPTIONS_RESET_BUTTON_TEXT"] = "Сброс настроек";
    L["MCF_OPTIONS_RESET_BUTTON_TOOLTIP"] = "Сбросить настройки аддона и окна персонажа к стандартным значениям."
    L["MCF_OPTIONS_CONFIRM_RESET"] = "Вы действительно хотите сбросить настройки Modern Character Frame?";
    L["MCF_OPTIONS_RESETED_MESSAGE"] = "Настройки Modern Character Frame были сброшены.";

    L["MCF_EQUIPMENT_SETS_NAME_RESERVED"] = "Это название комплекта экипировки ограничено для использования.";

    L["MCF_PLAYER_LEVEL"] = "|c%2$s%4$s (%3$s)|r %1$s-го уровня";
    L["MCF_PLAYER_LEVEL_NO_SPEC"] = "|c%2$s%3$s|r %1$s-го уровня";

    L["MCF_STATS_COLLAPSE_TOOLTIP"] = "Скрыть информацию о персонаже";
    L["MCF_STATS_EXPAND_TOOLTIP"] = "Показать информацию о персонаже";
    L["MCF_PET_STATS_COLLAPSE_TOOLTIP"] = "Скрыть информацию о питомце";
    L["MCF_PET_STATS_EXPAND_TOOLTIP"] = "Показать информацию о питомце";

    L["MCF_DEFAULT_STAT1_TOOLTIP"] = "Сила атаки увеличена на %d.";
    L["MCF_DEFAULT_STAT2_TOOLTIP"] = "Повышает вероятность нанести критический удар на %.2f%%.\nУсиливает броню на %d.";
    L["MCF_DEFAULT_STAT3_TOOLTIP"] = "Максимальный уровень здоровья увеличен на %d.";
    L["MCF_DEFAULT_STAT4_TOOLTIP"] = "Запас маны увеличен на %d|nСила заклинаний увеличена (НЕПРАВИЛЬНО РАБОТАЕТ) на %d|nВероятность нанести критический удар заклинанием повышена на %.2f%%.";
    L["MCF_MANA_REGEN_FROM_SPIRIT"] = "Скорость восполнения маны +%d каждые 5 сек. (если персонаж не творит заклинания)";
    L["MCF_STAT_TOOLTIP_BONUS_AP"] = "Увеличивает силу атаки на %d.\n";

    L["MCF_STAT_MOVEMENT_SPEED"] = "Скорость";
    L["MCF_STAT_ATTACK_POWER"] = "Сила атаки";
    L["MCF_STAT_DPS_SHORT"] = "Урон в сек";
    L["MCF_WEAPON_SPEED"] = "Скорость атаки";
    L["MCF_STAT_HASTE"] = "Скорость";
    L["MCF_STAT_ARMOR_PENETRATION"] = "Пробивание брони";
    L["MCF_SPELL_PENETRATION"] = "Проник. способность";
    L["MCF_MANA_REGEN"] = "Восполнение маны";
    L["MCF_STAT_PARRY"] = "Парирование";

    L["MCF_CR_CRIT_MELEE_TOOLTIP"] = "Вероятность нанести дополнительный урон.\nРейтинг: %d (вероятность нанести критический удар +%.2f%%).";
    L["MCF_CR_CRIT_RANGED_TOOLTIP"] = "Вероятность нанести дополнительный урон в дальнем бою.\nРейтинг: %d (вероятность нанести критический удар +%.2f%%).";
    L["MCF_CR_CRIT_SPELL_TOOLTIP"] = "Вероятность нанести дополнительный урон заклинанием.\nРейтинг: %d (вероятность нанести критический удар заклинанием +%.2f%%).";
    L["MCF_STAT_HASTE_BASE_TOOLTIP"] = "\nРейтинг скорости: %d (скорость +%.2f%%)";
    L["MCF_MANA_REGEN_TOOLTIP"] = "%d ед. маны восполняется раз в 5 секунд, если вы не участвуете в бою.";
    L["MCF_CR_BLOCK_TOOLTIP"] = "Рейтинг блока %d увеличивает вероятность блокировать удар на %.2f%%.\nПри успешном блоке урон уменьшается на %d.";
    L["MCF_RESISTANCE_TOOLTIP_SUBTEXT"] = "Уменьшает урон, получаемый персонажем от атак, в ходе которых используется %s, в среднем на %.2f%%.";
    L["MCF_CR_ARMOR_PENETRATION_TOOLTIP"] = "Снижение брони противника (только для ваших атак).\nРейтинг: %d (броня противника уменьшена на %.2f%%).";
    L["MCF_SPELL_PENETRATION_TOOLTIP"] = "Проникающая способность заклинаний: %d (снижение сопротивления противника всем видам магии на %d)";
    L["MCF_CR_EXPERTISE_TOOLTIP"] = "Вероятность того, что противник уклонится от удара или парирует его, снижена на %s.\nРейтинг мастерства: %d (мастерство +%d).";
    L["MCF_SPELLHIT_NOTALENTS_TOOLTIP"] = "|cff888888(Без учета эффекта талантов)|r";
    L["MCF_CRIT_HIT_TAKEN_CHANCE"] = "Вероятность получить крит. удар";
    L["MCF_STAT_ENEMY_LEVEL"] = "Уровень противника";
    L["MCF_TALENT_EFFECTS_ACTIVE"] = "Действуют эффекты талантов:";
    L["MCF_DEFENSE_TOOLTIP_DRUID_TALENT"] = "Вероятность получить крит. удар снижена на %d%%";


    L["MCF_STAT_AVERAGE_ITEM_LEVEL"] = "Ур. предметов";
    L["MCF_STAT_AVERAGE_ITEM_LEVEL_EQUIPPED"] = "(Надето %d)";
    L["MCF_STAT_GEARSCORE_LABEL"] = "Ур. предметов (GS)";
    L["MCF_STAT_GEARSCORE"] = "(Gear Score %d)";
end