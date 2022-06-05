vim.g["ale_fixers"] = {
	c = { "clang-format" },
	css = { "prettier" },
	go = { "gofmt" },
	html = { "prettier" },
	javascript = { "eslint", "prettier" },
	-- json = { "fixjson", "eslint" },
	lua = { "stylua" },
	python = { "autoflake", "isort", "black" },
	ruby = { "rufo" },
	rust = { "rustfmt" },
	typescript = { "eslint", "prettier" },
	yaml = { "prettier" },
}

vim.g["ale_rust_rustfmt_options"] = "--edition 2021"
vim.g["ale_fix_on_save"] = 1
