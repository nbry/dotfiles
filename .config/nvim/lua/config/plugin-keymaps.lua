local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

----------------
--- TELESCOPE --
----------------
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>mf", "<cmd>Telescope media_files<cr>", opts)
keymap(
	"n",
	"<C-p>",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)

---------------
-- NVIM TREE --
---------------
keymap("n", "<leader>c", ":NvimTreeCollapse<CR>", opts)
keymap("n", "<C-n>", ":NvimTreeFocus<CR>", opts)
keymap("n", "<C-t>", ":NvimTreeToggle<CR>", opts)

---------------
-- GIT SIGNS --
---------------
keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts)
