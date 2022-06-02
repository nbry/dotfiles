vim.g["ale_fixers"] = {
	c = { "clang-format" },
	css = { "prettier" },
	go = { "gofmt" },
	javascript = { "eslint", "prettier" },
	-- json = { "fixjson", "eslint" },
	lua = { "stylua" },
	typescript = { "eslint", "prettier" },
	python = { "autoflake", "isort", "black" },
	rust = { "rustfmt" },
	ruby = { "rufo" },
	yaml = { "prettier" },
}

vim.g["ale_rust_rustfmt_options"] = "--edition 2021"
vim.g["ale_fix_on_save"] = 1
