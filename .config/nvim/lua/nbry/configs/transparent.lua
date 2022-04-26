require("transparent").setup({
	enable = true, -- boolean: enable transparent
	extra_groups = {
		"DiagnosticSignError",
		"DiagnosticSignHint",
		"DiagnosticSignInfo",
		"DiagnosticSignWarn",
		"NvimTreeDiagnosticsError",
		"NvimTreeDiagnosticsHint",
		"NvimTreeDiagnosticsInformation",
		"NvimTreeDiagnosticsWarning",
		"NvimTreeSignColumn",
		"SignColumn",
	},
	exclude = {},
})
