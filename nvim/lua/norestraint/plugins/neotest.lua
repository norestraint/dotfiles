return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"jfpedroza/neotest-elixir",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")
		local keymap = vim.keymap

		keymap.set("n", "<localleader>tt", function()
			neotest.run.run()
		end, { desc = "Run nearest test" })

		keymap.set("n", "<localleader>td", function()
			neotest.run.run({ strategy = "dap" })
		end, { desc = "Run nearest test" })

		keymap.set("n", "<localleader>tb", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run tests in current file" })

		keymap.set("n", "<localleader>ts", "<CMD>Neotest summary<CR>", { desc = "Run ests in current file" })

		neotest.setup({
			adapters = {
				require("neotest-elixir"),
				require("neotest-python"),
			},
			output = {
				open_on_run = false,
			},
		})
	end,
}
