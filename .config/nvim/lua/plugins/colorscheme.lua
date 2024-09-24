vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_material_transparent_background = 2

return {
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gruvbox-material]])
	-- 	end,
	-- },
	{
		"luisiacc/gruvbox-baby",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox-baby]])
		end,
	},
}
