local sumneko_binary = "~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"

return {
	settings = {
		Lua = {
			cmd = { sumneko_binary },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
