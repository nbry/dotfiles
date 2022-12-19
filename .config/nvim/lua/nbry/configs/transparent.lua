require("transparent").setup({
	enable = true, -- boolean: enable transparent
	extra_groups = {
		"Float",
		"FloatBorder",
		"NormalFloat",
		"NvimFloat",
		"SignColumn",
	},
	exclude = {
		"ScrollbarHandle",
		"ScrollbarSearchHandle",
		"ScrollbarSearch",
		"ScrollbarErrorHandle",
		"ScrollbarError",
		"ScrollbarWarnHandle",
		"ScrollbarWarn",
		"ScrollbarInfoHandle",
		"ScrollbarInfo",
		"ScrollbarHintHandle",
		"ScrollbarHint",
		"ScrollbarMiscHandle",
		"ScrollbarMisc",
	},
})

------
-- 🥲
------
vim.cmd([[
"red
au VimEnter * highlight DiagnosticFloatingError guibg=none guifg='#d18686'
au VimEnter * highlight GitSignsDelete          guibg=none guifg='#d18686'

"green
au VimEnter * highlight DiagnosticFloatingHint  guibg=none guifg='#86d195'
au VimEnter * highlight GitSignsAdd             guibg=none guifg='#86d195'

"purple
au VimEnter * highlight DiagnosticFloatingInfo  guibg=none guifg='#bb86d1'
au VimEnter * highlight GitSignsChange          guibg=none guifg='#bb86d1'

"yellow
au VimEnter * highlight DiagnosticFloatingWarn  guibg=none guifg='#f9ab00'
]])
