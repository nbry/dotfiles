return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        preview = {
          treesitter = false,
        },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
  end,
}
