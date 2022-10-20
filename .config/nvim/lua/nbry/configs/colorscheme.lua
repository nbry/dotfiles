-- local colorscheme = "catppuccin"
local colorscheme = "gruvbox-baby"
-- local colorscheme = "gruvbox"
-- local colorscheme = "gruvbox-material"
-- local colorscheme = "tokyonight"

-- gruvbox-material
-- vim.g["gruvbox_material_transparent_background"] = 1

-- gruvbox-baby
vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_highlights = { Search = { bg = "gray" } }

-- load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
