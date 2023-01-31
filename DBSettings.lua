MCF_DEFAULT_SETTINGS = {
	["characterFrameCollapsed"] = "1",

	["statCategoryOrder"] = "", --"1,2,3,4,5,6,7",
	["statCategoryOrder_2"] = "", --"1,2,3,4,5,6,7",

	["statCategoriesCollapsed"] = {false, false, false, false, false, false, false},
	["statCategoriesCollapsed_2"] = {false, false, false, false, false, false, false},

	["enableItemSlotColoring"] = true,

	["TT_IntegrationEnabled"] = true,
	["TT_IntegrationType"] = 1,
	["TT_IntegrationColorEnabled"] = true,
}

function MCF_SetSettings(setting, value, id)
	if (id) then
		MCF_SETTINGS[setting][id] = value;
	else
		MCF_SETTINGS[setting] = value;
	end
end

function MCF_GetSettings(query, id)
	if ( MCF_SETTINGS[query] == nil ) then
		MCF_SETTINGS[query] = MCF_DEFAULT_SETTINGS[query];
	end
	if (id) then
		return MCF_SETTINGS[query][id];
	else
		return MCF_SETTINGS[query];
	end
end

function MCF_ResetSettings()
	table.wipe(MCF_SETTINGS);
	for setting, value in pairs(MCF_DEFAULT_SETTINGS) do
		MCF_SetSettings(setting, value)
	end
end