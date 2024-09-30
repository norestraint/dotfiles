return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		local keymap = vim.keymap

		keymap.set("n", "<leader>hm", function()
			ui.toggle_quick_menu()
		end, { desc = "Toggle Harpoon quick menu" })

		keymap.set("n", "<leader>ha", function()
			mark.add_file()
		end, { desc = "Add file to Harpoon" })

		keymap.set("n", "<leader>hn", function()
			mark.nav_next()
		end, { desc = "Go to next Harpoon file" })

		keymap.set("n", "<leader>hp", function()
			mark.nav_prev()
		end, { desc = "Go to previous Harpoon file" })

		keymap.set("n", "<leader>h1", function()
			ui.nav_file(1)
		end, { desc = "Go to 1º Harpoon file" })

		keymap.set("n", "<leader>h2", function()
			ui.nav_file(2)
		end, { desc = "Go to 2º Harpoon file" })

		keymap.set("n", "<leader>h3", function()
			ui.nav_file(3)
		end, { desc = "Go to 3º Harpoon file" })

		keymap.set("n", "<leader>h4", function()
			ui.nav_file(4)
		end, { desc = "Go to 4º Harpoon file" })

		keymap.set("n", "<leader>h5", function()
			ui.nav_file(5)
		end, { desc = "Go to 5º Harpoon file" })

		harpoon.setup()
	end,
}
