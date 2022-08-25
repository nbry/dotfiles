local colorscheme = "gruvbox-material"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = "tokyonight"

-- gruvbox-material
vim.g["gruvbox_material_transparent_background"] = 1

-- load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
