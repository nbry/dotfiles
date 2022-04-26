local colorscheme = "gruvbox-material"

-- gruvbox
-- vim.g["gruvbox_transparent_bg"] = 1
-- vim.g["gruvbox_bold"] = 0

-- everforest
-- vim.g["everforest_background"] = "hard"
-- vim.g["everforest_transparent_background"] = 1

-- load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- transparent popups
vim.cmd("autocmd VimEnter * highlight NormalFloat guibg=none")
