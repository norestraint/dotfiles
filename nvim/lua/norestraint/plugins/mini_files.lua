return {
	"echasnovski/mini.files",
	version = false,
	config = function()
		require("mini.files").setup({
			windows = {
				width_focus = 35,
				preview = true,
				width_preview = 60,
				max_number = 3,
			},
		})
	end,
}
