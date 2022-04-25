-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Popup window for packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-------------
-- Plugins --
-------------
return packer.startup(function(use)
  -- Theme
  use ({
    "sainnhe/everforest",
    config = function()
      require "nbry.configs.colorscheme"
    end,
  })

  -- Status line
  use ({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "nbry.configs.lualine"
    end,
  })

  -- Git symbols and blamer
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require "nbry.configs.gitsigns"
    end
  }

  -- NvimTree
  use ({
      'kyazdani42/nvim-tree.lua',
      -- requires = {
      --   'kyazdani42/nvim-web-devicons', -- optional, for file icon
      -- },
      config = function()
        require "nbry.configs.nvim-tree"
      end,
  })

  -- Transparency Everywhere
  use ({
     "xiyaowong/nvim-transparent",
      config = function()
        require "nbry.configs.transparent"
      end,
  })

  -- Syntax Highlighting
  use "mboughaba/i3config.vim"
  use "pangloss/vim-javascript"
  use "vim-python/python-syntax"

  -- Utilty
  use "tpope/vim-commentary"
  use "tmsvg/pear-tree"

  -- Neovim Lua
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -----------------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim --
  -- Put this at the end after all plugins                             --
  -----------------------------------------------------------------------
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
