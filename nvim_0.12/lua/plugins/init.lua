require("plugins.mini_setup")

vim.pack.add({
	-- Colorschemes
	"https://github.com/tanvirtin/monokai.nvim",
  "https://github.com/xero/miasma.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-web-devicons",
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://www.github.com/mason-org/mason.nvim",
	"https://www.github.com/mason-org/mason.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://www.github.com/lewis6991/gitsigns.nvim",
})

local function packadd(plugin)
	vim.cmd("packadd " .. plugin)
end

packadd("monokai.nvim")
packadd("miasma.nvim")
require("plugins.colorscheme")
packadd("nvim-web-devicons")

packadd("nvim-treesitter")
packadd("nvim-treesitter-context")
require("plugins.treesitter-config")

packadd("oil.nvim")
require("plugins.oil-config")

packadd("fzf-lua")
require("plugins.fzf-lua-config")

packadd("mason.nvim")
require("plugins.mason-config")

packadd("nvim-lspconfig")
require("plugins.nvim-lspconfig-config")

packadd("blink.cmp")
packadd("LuaSnip")
require("plugins.blink-config")

packadd("conform.nvim")
require("plugins.conform-config")

packadd("gitsigns.nvim")
require("plugins.gitsigns-config")
