local DEFAULT_THEME = "gruvbox-baby"
vim.g.theme_choice = DEFAULT_THEME

local colorscheme_plugins = {
	require("plugins.colorscheme.transparent"),
}

vim.g.themes = {
	{ name = "catppuccin", plugin = "catpuccin" },
	{ name = "gruvbox-baby", plugin = "gruvbox-baby" },
	{ name = "gruvbox-material", plugin = "gruvbox-material" },
	{ name = "nightfox", plugin = "nightfox" },
	-- { name = "dawnfox", plugin = "nightfox" },
	-- { name = "duskfox", plugin = "nightfox" },
	{ name = "nordfox", plugin = "nightfox" },
	{ name = "terafox", plugin = "nightfox" },
	{ name = "carbonfox", plugin = "nightfox" },
}

local plugin_loaded = {}

----
-- This loop is responsible for loading all the available theme plugins
----
for _, theme in pairs(vim.g.themes) do
	local exists, plugin = pcall(require, "plugins.colorscheme.themes." .. theme.name)
	if exists then
		----
		-- Set high priority and turn off lazy loading for DEFAULT_THEME.
		-- Set the theme.
		----
		if theme.name == DEFAULT_THEME then
			local base_config = plugin.config
			plugin.config = function()
				if base_config then
					base_config()
				end
				vim.cmd.colorscheme(theme.name)
			end
			plugin.lazy = false
			plugin.priority = 1000
		end

		----
		-- This ignores configs already loaded
		-- (e.g. carbonfox & terafox both use nightfox config, which is already loaded)
		----
		if not plugin_loaded[theme.plugin] then
			plugin_loaded[theme.plugin] = true
			table.insert(colorscheme_plugins, plugin)
		end
	end
end

----
-- Set the theme (and pointer) to whichever theme
-- is next on the list
----
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
	-- print("colorscheme changed: ", vim.g.theme_choice)
end

----
-- Use sed to replace the DEFAULT_THEME variable
-- at the top of this file
----
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
		.. "~/dotfiles/.config/nvim/lua/plugins/colorscheme/init.lua"

	os.execute(command)
	vim.notify.dismiss()
	vim.notify(vim.g.theme_choice, nil, {
		title = "colorscheme SAVED",
	})
	-- print("colorscheme saved: ", vim.g.theme_choice)
end

----
-- THEME CHOOSER
----
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-\\>", "<cmd>lua NextTheme()<CR>", opts)
keymap("n", "<leader>\\", "<cmd>lua SaveCurrentTheme()<CR>", opts)

return colorscheme_plugins
