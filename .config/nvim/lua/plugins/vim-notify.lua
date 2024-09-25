return {
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			local notify = require("notify")

			notify.setup({
				background_colour = "#000000",
				render = "compact",
				stages = "static",
			})

			vim.notify = notify
		end,
	},
}
