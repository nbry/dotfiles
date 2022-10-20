local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	open_on_setup_file = false,
	open_on_tab = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	hijack_cursor = false,
	update_cwd = false,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
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
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		number = true,
		relativenumber = true,
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
})

require("nvim-tree.view").View.winopts.signcolumn = "no"

-- keymap
keymap("n", "<leader>c", ":NvimTreeCollapse<CR>", opts)
keymap("n", "<C-n>", ":NvimTreeFocus<CR>", opts)
keymap("n", "<C-t>", ":lua require('nvim-tree').toggle(false, true)<CR>", opts)
