local ok, mason = pcall(require, "mason")
if not ok then
	vim.notify("Unable to load mason")
	return {}
end

mason.setup({
	ensure_installed = {
		"stylua",
		"lua_ls",
		"shfmt",
		"elixirls",
	},
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
