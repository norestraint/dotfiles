return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		local fzf_lua = require("fzf-lua")
		fzf_lua.setup({
			"hide",
		})
	end,
}
