local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Configure a language server with individual server configs
-- merged with the general capabilities and attachment behavior
local function configuration(server)
	local server_config = {}

	local exists, file = pcall(require, "nbry.configs.lsp.servers." .. server)
	if exists then
		server_config = file
	end

	return vim.tbl_deep_extend("force", {
		on_attach = require("nbry.configs.lsp.handlers").on_attach,
		capabilities = require("nbry.configs.lsp.handlers").capabilities,
	}, server_config)
end

local servers = {
	"astro",
	"dockerls",
	"gopls",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup(configuration(server))
end

require("nbry.configs.lsp.handlers").setup()
