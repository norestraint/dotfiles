local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "norestraint.plugins" },
	{ import = "norestraint.plugins.lsp" },
	{ import = "norestraint.plugins.colorschemes" },
	{ import = "norestraint.plugins.debugger" },
	{ import = "norestraint.plugins.mini" },
}, {
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
})
