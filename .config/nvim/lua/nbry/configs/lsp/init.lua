local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- add a border around LspInfo
-- local win = require("lspconfig.ui.windows")
-- local _default_opts = win.default_opts

-- win.default_opts = function(options)
-- 	local opts = _default_opts(options)
-- 	opts.border = "single"
-- 	return opts
-- end

require("nbry.configs.lsp.lsp-installer")
require("nbry.configs.lsp.handlers").setup()
