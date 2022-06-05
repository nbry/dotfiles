-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Popup window for packer
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "double" })
		end,
	},
})

-------------
-- Plugins --
-------------
return packer.startup(function(use)
	-- Theme
	use({
		"sainnhe/gruvbox-material",
		config = function()
			require("nbry.configs.colorscheme")
		end,
	})

	-- Lualine: Better status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("nbry.configs.lualine")
		end,
	})

	-- Git Symbols and Blamer
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("nbry.configs.gitsigns")
		end,
	})

	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nbry.configs.nvim-tree")
		end,
	})

	-- Scrollbar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("nbry.configs.nvim-scrollbar")
		end,
	})

	-- Markdown Preview: Live preview of mardown files in browser
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	-- Transparency Everywhere
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("nbry.configs.transparent")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nbry.configs.treesitter")
		end,
	})

	-- Language Server Protocol
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("nbry.configs.lsp")
		end,
	})

	-- Language Server Installation Tool
	use("williamboman/nvim-lsp-installer")

	-- CMP
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("nbry.configs.cmp")
		end,
	})

	-- LSP/CMP Extra
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip") -- engine
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")

	-- Better Syntax Highlighting
	use("mboughaba/i3config.vim")
	use("vim-python/python-syntax")
	use("pangloss/vim-javascript")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("nbry.configs.telescope")
		end,
	})

	-- Telescope Plugins
	use("nvim-telescope/telescope-media-files.nvim")
	use("BurntSushi/ripgrep")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- Ale: ...only using for lint/format on save
	use({
		"w0rp/ale",
		config = function()
			require("nbry.configs.ale")
		end,
	})

	-- Pears: Bracket/Pair completion tool
	use({
		"steelsojka/pears.nvim",
		config = function()
			require("nbry.configs.pears")
		end,
	})

	-- Vanilla Vim Utilties
	use("tpope/vim-commentary")
	use("tpope/vim-surround")

	-- Neovim Lua
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-----------------------------------------------------------------------
	-- Automatically set up your configuration after cloning packer.nvim --
	-- Put this at the end after all plugins                             --
	-----------------------------------------------------------------------
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
