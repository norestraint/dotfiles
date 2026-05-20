return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			view_options = { show_hidden = true },
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<S-l>"] = "actions.select",
				["<S-h>"] = { "actions.parent", mode = "n" },
				["<C-l>"] = { "actions.select", opts = { vertical = true } },
				["<C-j>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["<C-r>"] = "actions.refresh",
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
		})
	end,
}
