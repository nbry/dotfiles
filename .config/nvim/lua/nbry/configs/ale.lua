vim.g["ale_fixers"] = {
	c = { "clang-format" },
	css = { "prettier" },
	go = { "gofmt" },
	javascript = { "eslint", "prettier" },
	lua = { "stylua" },
	typescript = { "eslint", "prettier" },
	python = { "autoflake", "isort", "black" },
	rust = { "rustfmt" },
}

vim.g["ale_fix_on_save"] = 1
