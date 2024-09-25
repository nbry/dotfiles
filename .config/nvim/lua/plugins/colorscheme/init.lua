local DEFAULT_THEME = "gruvbox-baby"
vim.g.theme_choice = DEFAULT_THEME

local colorscheme_plugins = {
	require("plugins.colorscheme.transparent"),
}

vim.g.themes = {
	{ name = "catppuccin", config = "catpuccin" },
	{ name = "gruvbox-baby", config = "gruvbox-baby" },
	{ name = "gruvbox-material", config = "gruvbox-material" },
	{ name = "nightfox", config = "nightfox" },
	-- { name = "dawnfox", config = "nightfox" },
	-- { name = "duskfox", config = "nightfox" },
	{ name = "nordfox", config = "nightfox" },
	{ name = "terafox", config = "nightfox" },
	{ name = "carbonfox", config = "nightfox" },
}

local plugin_loaded = {}

-- This loop allows the installation of all the colorscheme plugins,
-- but sets the theme to the choice defined in this file
--
-- Iterate through themes
-- 1. Attempt to go find plugin config
-- 2. If exists, then check if the plugin config is the choice
-- 3. If it is the choice, modify the config function to set the colorscheme
for _, theme in pairs(vim.g.themes) do
	local exists, plugin = pcall(require, "plugins.colorscheme.themes." .. theme.name)
	if exists then
		if theme.name == vim.g.theme_choice then
			local base_config = plugin.config
			plugin.config = function()
				if base_config then
					base_config()
				end
				vim.cmd.colorscheme(theme.name)
			end
		end

		-- If a theme uses the same config (e.g. nightfox and terafox both use nightfox config)
		if not plugin_loaded[theme.config] then
			plugin_loaded[theme.config] = true
			table.insert(colorscheme_plugins, plugin)
		end
	end
end

function NextTheme()
	local currentIndex
	for i, theme in ipairs(vim.g.themes) do
		if theme.name == vim.g.theme_choice then
			currentIndex = i
			break
		end
	end

	local nextIndex = (currentIndex % #vim.g.themes) + 1
	vim.g.theme_choice = vim.g.themes[nextIndex].name
	vim.cmd.colorscheme(vim.g.theme_choice)
	vim.notify.dismiss()
	vim.notify(vim.g.theme_choice, nil, {
		title = "colorscheme",
	})
end

function SaveCurrentTheme()
	local command = "sed -i '"
		.. "s/local DEFAULT_THEME "
		.. '= "'
		.. DEFAULT_THEME
		.. '"'
		.. "/local DEFAULT_THEME "
		.. '= "'
		.. vim.g.theme_choice
		.. '"/'
		.. "' "
		.. "~/.dotfiles/.config/nvim/lua/plugins/colorscheme/init.lua"

	-- vim.notify(command)
	os.execute(command)
	vim.notify.dismiss()
	vim.notify(vim.g.theme_choice, nil, {
		title = "colorscheme SAVED",
	})
end

-------------------
-- THEME CHOOSER --
-------------------
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-\\>", "<cmd>lua NextTheme()<CR>", opts)
keymap("n", "<leader>\\", "<cmd>lua SaveCurrentTheme()<CR>", opts)

return colorscheme_plugins
