local colorscheme = "gruvbox-material"

---------------------
-- gruvbox-material--
---------------------
vim.g.gruvbox_material_transparent_background = 2

----------------------
-- load colorscheme --
----------------------
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
