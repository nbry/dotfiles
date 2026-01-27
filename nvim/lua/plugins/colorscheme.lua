return {
  "luisiacc/gruvbox-baby",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_baby_transparent_mode = 1
    vim.g.gruvbox_baby_background_color = "dark"
    vim.cmd("colorscheme gruvbox-baby")
    -- Set a visible border color for floating windows
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#a89984", bg = "#282828" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#a89984", bg = "#282828" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
  end,
}
