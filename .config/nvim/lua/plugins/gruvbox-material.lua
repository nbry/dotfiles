vim.g.gruvbox_material_transparent_background = 2

return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox-material]])
  end,
}
