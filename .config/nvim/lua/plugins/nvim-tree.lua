return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    hijack_cursor = false,
    update_cwd = false,
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    filters = {
      dotfiles = false,
      custom = {},
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    view = {
      width = 50,
      -- hide_root_folder = false,
      side = "left",
      number = true,
      preserve_window_proportions = false,
      -- relativenumber = true,
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "🞄",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            arrow_open = "▾",
            arrow_closed = "▸",
          },
        },
      },
    },
  },
  --config = function()
  --  vim.g.loaded_netrw = 1
  --  vim.g.loaded_netrwPlugin = 1
  --  require("nvim-tree.view").View.winopts.signcolumn = "no"
  --  -------------------------------
  --  -- Open nvim-tree on startup --
  --  -------------------------------

  --  local function open_nvim_tree(data)
  --    -- buffer is a [No Name]
  --    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  --    -- buffer is a directory
  --    local directory = vim.fn.isdirectory(data.file) == 1

  --    if not no_name and not directory then
  --      return
  --    end

  --    -- change to the directory
  --    if directory then
  --      vim.cmd.cd(data.file)
  --    end

  --    -- open the tree
  --    require("nvim-tree.api").tree.open()
  --  end

  --  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  --end,
}
