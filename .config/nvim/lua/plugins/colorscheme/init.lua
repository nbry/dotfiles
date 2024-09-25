vim.g.theme_choice = "gruvbox-baby"

local colorscheme_plugins = {
	require("plugins.colorscheme.transparent"),
}

vim.g.themes = {
	"catppuccin",
	"gruvbox-baby",
	"gruvbox-material",
}

-- This loop allows the installation of all the colorscheme plugins,
-- but sets the theme to the choice defined in this file
--
-- Iterate through themes
-- 1. Attempt to go find plugin config
-- 2. If exists, then check if the plugin config is the choice
-- 3. If it is the choice, modify the config function to set the colorscheme
for _, theme in pairs(vim.g.themes) do
	local exists, plugin = pcall(require, "plugins.colorscheme.themes." .. theme)
	if exists then
		if theme == vim.g.theme_choice then
			local base_config = plugin.config
			plugin.config = function()
				if base_config then
					base_config()
				end
				vim.cmd.colorscheme(theme)
			end
		end

		table.insert(colorscheme_plugins, plugin)
	end
end

function NextTheme()
	local currentIndex
	for i, theme in ipairs(vim.g.themes) do
		if theme == vim.g.theme_choice then
			currentIndex = i
			break
		end
	end

	local nextIndex = (currentIndex % #vim.g.themes) + 1
	vim.g.theme_choice = vim.g.themes[nextIndex]
	vim.cmd.colorscheme(vim.g.theme_choice)
end

-------------------
-- THEME CHOOSER --
-------------------
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-\\>", "<cmd>lua NextTheme()<CR>", opts)

return colorscheme_plugins
