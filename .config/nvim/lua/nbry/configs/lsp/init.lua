local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local servers = {
	"gopls",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
}

for _, server in ipairs(servers) do
	local config = {}

	local exists, file = pcall(require, "nbry.configs.lsp.servers." .. server)

	if exists then
		config = file
	end

	config.on_attach = require("nbry.configs.lsp.handlers").on_attach
	config.capabilities = require("nbry.configs.lsp.handlers").capabilities

	lspconfig[server].setup(config)
end

require("nbry.configs.lsp.handlers").setup()
