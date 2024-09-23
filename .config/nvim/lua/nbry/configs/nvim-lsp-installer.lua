local status_ok, package = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

package.setup({
	ui = {
		border = "double",
	},
})
