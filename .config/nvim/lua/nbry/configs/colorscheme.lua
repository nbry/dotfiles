-- local colorscheme = "catppuccin"
-- local colorscheme = "gruvbox"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = "gruvbox-material"
local colorscheme = "terafox"
-- local colorscheme = "tokyonight"

------
-- gruvbox-material
------
-- vim.g["gruvbox_material_transparent_background"] = 1

------
-- gruvbox-baby
------
-- vim.g.gruvbox_baby_transparent_mode = 1
-- vim.g.gruvbox_baby_function_style = "NONE"
-- vim.g.gruvbox_baby_highlights = { Search = { bg = "gray" } }

------
-- nightfox
------
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {},
	specs = {},
	groups = {},
})

------
-- load colorscheme
------
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
