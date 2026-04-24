return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
		modes = {
			lsp = {
				win = { position = "right" },
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Open Trouble diagnostics for workspace" },
		{
			"<leader>xX",
			"<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open trouble diagnostics for the current buffer",
		},
		{ "<leader>xq", "<CMD>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>xL", "<CMD>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
		{ "<leader>xl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").prev({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Previous Trouble/Quickfix Item",
		},
		{
			"]q",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Next Trouble/Quickfix Item",
		},
	},
}
