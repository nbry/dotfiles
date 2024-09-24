local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- popup window for packer
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
	-- use({
	-- 	"sainnhe/gruvbox-material",
	-- 	config = function()
	-- 		require("nbry.configs.colorscheme")
	-- 	end,
	-- })

	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("nbry.configs.transparent")
		end,
	})

	-- icons for tree/lualine
	use({ "kyazdani42/nvim-web-devicons" })

	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	config = function()
	-- 		require("nbry.configs.lualine")
	-- 	end,
	-- })

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nbry.configs.nvim-tree")
		end,
	})

	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("nbry.configs.nvim-scrollbar")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("nbry.configs.gitsigns")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nbry.configs.treesitter")
		end,
	})

	-- opens browser for live preview for .md editting
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	-- lsp
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("nbry.configs.lsp")
		end,
	})

	-- show signature of function while typing
	use({
		"ray-x/lsp_signature.nvim",
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("nbry.configs.cmp")
		end,
	})

	-- auto install lsp servers
	use({
		"williamboman/nvim-lsp-installer",
		config = function()
			require("nbry.configs.nvim-lsp-installer")
		end,
	})

	-- lsp/cmp extra
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")

	-- snippets
	use("dcampos/nvim-snippy")
	use("dcampos/cmp-snippy")
	use("honza/vim-snippets")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("nbry.configs.telescope")
		end,
	})

	-- telescope plugins
	use("nvim-telescope/telescope-media-files.nvim")
	use("BurntSushi/ripgrep")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- ale: ...only using for lint/format on save
	use({
		"w0rp/ale",
		config = function()
			require("nbry.configs.ale")
		end,
	})

	-- vanilla vim utilties
	use("tpope/vim-commentary")
	use("tpope/vim-surround")

	-- neovim lua
	use("nvim-lua/plenary.nvim") -- Useful lua functions used for lots of plugins
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
