local keymap = vim.keymap

keymap.set("n", "<C-s>", ":%s/")

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>el", ":g/^$/d<CR><leader>l")
keymap.set("v", "<leader>el", ":g/^$/d<CR><leader>l")

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Navigate between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Keep cursor centered when jumping
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- keep centered while searching
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- quit/save
keymap.set("n", "<leader>qa", ":quitall<CR>", { desc = "Quit all" })
keymap.set("n", "<leader>q1", ":quitall!<CR>", { desc = "Quit all without saving" })
keymap.set("n", "<leader>qq", ":q<CR>", { desc = "Quit current window" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current buffer" })
