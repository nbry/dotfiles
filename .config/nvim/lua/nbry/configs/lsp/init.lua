local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- add a border around LspInfo
local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'single'
  return opts
end

-- transparent diagnostic signs
vim.cmd [[
  autocmd VimEnter * highlight DiagnosticSignError guibg=none guifg='#d18686'
  autocmd VimEnter * highlight DiagnosticSignWarn guibg=none guifg='#f9ab00'
  autocmd VimEnter * highlight DiagnosticSignHint guibg=none guifg='#bb86d1'
  autocmd VimEnter * highlight DiagnosticSignInfo guibg=none guifg='#86d195'
]]

require("nbry.configs.lsp.lsp-installer")
require("nbry.configs.lsp.handlers").setup()

