--return {
--  {
--    "xiyaowong/nvim-transparent",
--    lazy = false,
--    priority = 1000,
--    config = function()
--      require("transparent").setup({
--        extra_groups = {
--          "Float",
--          "FloatBorder",
--          "LspDiagnosticsFloatingError",
--          "LspDiagnosticsFloatingHint",
--          "LspDiagnosticsFloatingInformation",
--          "LspDiagnosticsFloatingWarning ",
--          "LspDiagnosticsSignError",
--          "LspDiagnosticsSignHint",
--          "LspDiagnosticsSignInformation",
--          "LspDiagnosticsSignWarning",
--          "LspReferenceRead",
--          "LspReferenceText",
--          "LspReferenceWrite",
--          "NormalFloat",
--          "NvimFloat",
--          "NvimTreeLspDiagnosticsError",
--          "NvimTreeLspDiagnosticsHint",
--          "NvimTreeLspDiagnosticsInformation",
--          "NvimTreeLspDiagnosticsWarning",
--          "NvimTreeSignColumn",
--          "Pmenu",
--          "SignColumn",
--        },
--        exclude_groups = {
--          "ScrollbarHandle",
--          "ScrollbarSearchHandle",
--          "ScrollbarSearch",
--          "ScrollbarErrorHandle",
--          "ScrollbarError",
--          "ScrollbarWarnHandle",
--          "ScrollbarWarn",
--          "ScrollbarInfoHandle",
--          "ScrollbarInfo",
--          "ScrollbarHintHandle",
--          "ScrollbarHint",
--          "ScrollbarMiscHandle",
--          "ScrollbarMisc",
--        },
--      })

--      ------
--      -- 🥲
--      ------
--      vim.cmd([[
--      "red
--      au VimEnter * highlight DiagnosticFloatingError guibg=none guifg='#d18686'
--      au VimEnter * highlight GitSignsDelete          guibg=none guifg='#d18686'

--      "green
--      au VimEnter * highlight DiagnosticFloatingHint  guibg=none guifg='#86d195'
--      au VimEnter * highlight GitSignsAdd             guibg=none guifg='#86d195'

--      "purple
--      au VimEnter * highlight DiagnosticFloatingInfo  guibg=none guifg='#bb86d1'
--      au VimEnter * highlight GitSignsChange          guibg=none guifg='#bb86d1'

--      "yellow
--      au VimEnter * highlight DiagnosticFloatingWarn  guibg=none guifg='#f9ab00'
--      ]])
--    end,
--  }
--}

return {
	"tribela/transparent.nvim",
	event = "VimEnter",
	config = true,
	auto = true,
	opts = {
		extra_groups = {
			"Float",
			"FloatBorder",
			"LspDiagnosticsFloatingError",
			"LspDiagnosticsFloatingHint",
			"LspDiagnosticsFloatingInformation",
			"LspDiagnosticsFloatingWarning ",
			"LspDiagnosticsSignError",
			"LspDiagnosticsSignHint",
			"LspDiagnosticsSignInformation",
			"LspDiagnosticsSignWarning",
			"LspReferenceRead",
			"LspReferenceText",
			"LspReferenceWrite",
			"NormalFloat",
			"NvimFloat",
			"NvimTreeLspDiagnosticsError",
			"NvimTreeLspDiagnosticsHint",
			"NvimTreeLspDiagnosticsInformation",
			"NvimTreeLspDiagnosticsWarning",
			"NvimTreeSignColumn",
			"Pmenu",
			"SignColumn",
		},
	},
}
