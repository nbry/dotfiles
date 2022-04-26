local lspconfig = require'lspconfig'

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'clangd', 'html', 'pyright', 'rust_analyzer', 'sumneko_lua', 'tsserver' }

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		capabilities = capabilities
	}
end

lspconfig.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
