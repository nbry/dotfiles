require("transparent").setup({
	enable = true, -- boolean: enable transparent
	extra_groups = {
		"Float",
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
		"SignColumn",
	},
	exclude = {},
})

-- 🥲
vim.cmd([[
  highlight! DiagnosticFloatingError guibg=#None
  highlight! DiagnosticFloatingHint  guibg=#None
  highlight! DiagnosticFloatingInfo  guibg=#None
  highlight! DiagnosticFloatingWarn  guibg=#None

  highlight! GitSignsAdd             guibg=none guifg='#86d195'
  highlight! GitSignsChange          guibg=none guifg='#bb86d1'
  highlight! GitSignsDelete          guibg=none guifg='#d18686'
]])
