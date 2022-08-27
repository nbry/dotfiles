require("nbry.configs.lsp.handlers").setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Base LSP handlers/options, to attach to each server
local lsp_opts = {
	on_attach = require("nbry.configs.lsp.handlers").on_attach,
	capabilities = require("nbry.configs.lsp.handlers").capabilities,
}

local servers = {
	"sumneko_lua",
	"pyright",
	"jsonls",
}

-- Attach a combined/flattened server AND base config to the server
for _, server in ipairs(servers) do
	local server_opts = require("nbry.configs.lsp.servers." .. server)
	local opts = vim.tbl_deep_extend("force", server_opts, lsp_opts)
	lspconfig[server].setup(opts)
end
