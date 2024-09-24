local servers = {
  "dockerls",
  "gopls",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "typescript-language-server",
  "lua-language-server"
}

return {
  {
		"neovim/nvim-lspconfig",
    lazy = false,
		config = function()
      local status_ok, lspconfig = pcall(require, "lspconfig")
      if not status_ok then
        return
      end

      local function configuration(server)
        local server_config = {}

        local exists, file = pcall(require, "plugins.lsp.servers." .. server)
        if exists then
          server_config = file
        end

        return vim.tbl_deep_extend("force", {
          on_attach = require("plugins.lsp.handlers").on_attach,
          capabilities = require("plugins.lsp.handlers").capabilities,
        }, server_config)
      end


      for _, server in ipairs(servers) do
        lspconfig[server].setup(configuration(server))
      end

      require("plugins.lsp.handlers").setup()
		end,
  },
}

