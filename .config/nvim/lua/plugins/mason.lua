return {
	"williamboman/mason.nvim",
	lazy = false,
	config = function()
		require("mason").setup({
			ui = {
				border = "double",
			},
		})
	end,
}
