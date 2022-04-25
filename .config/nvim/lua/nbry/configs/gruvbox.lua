local colorscheme = "gruvbox"

-- load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- config
vim.g["gruvbox_transparent_bg"] = 1
vim.g["gruvbox_bold"] = 0

-- vim.cmd([[
--   highlight Normal guibg=NONE     ctermbg=None
--   highlight SignColumn		        ctermbg=None
--   highlight GitGutterAdd		      ctermbg=None ctermfg=Green
--   highlight GitGutterChange	      ctermbg=None ctermfg=Yellow
--   highlight GitGutterDelete	      ctermbg=None ctermfg=Red
--   highlight GitGutterChangeDelete ctermbg=None ctermfg=Cyan
-- ]])
