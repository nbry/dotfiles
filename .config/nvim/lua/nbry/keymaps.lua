local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- mapleader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- clear highlights
keymap("n", "<leader>l", ":noh<CR>", opts)

-- resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keep centered while searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- quit/save
keymap("n", "<leader>qa", ":quitall<CR>", opts)
keymap("n", "<leader>q1", ":quitall!<CR>", opts)
keymap("n", "<leader>qq", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)

-- find and replace
keymap("n", "<C-s>", ":%s/", opts) -- buffer
keymap("v", "<C-s>", ":s/", opts) -- visual

-- find and replace - current directory (custom script)
keymap("n", "<leader>fr", ":! fnr ", opts)

-- source vimrc
keymap("n", "<leader>sv", "<cmd>luafile $MYVIMRC<CR>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- copy
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+yg_', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>yy", '"+yy', opts)

-- paste
keymap("v", "<leader>p", '"+p', opts)
keymap("v", "<leader>P", '"+P', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)

-- in visual, replace highlighted with yanked/clipboard item
keymap("v", "p", '"_dP', opts)

-- terminal, escape
keymap("t", "<leader><Esc>", "<C-\\><c-n>", opts)

-- base64
vim.cmd([[
	vnoremap <leader>d c<c-r>=system('base64 --decode \| jq .', @")<cr><esc>
	vnoremap <leader>e c<c-r>=system('jq --compact-output . \| base64 --wrap 0', @")<cr><esc>
]])
