local ok, mini_files = pcall(require, "mini.files")
if not ok then
	vim.notify("Unable to load mini.files")
	return {}
end

mini_files.setup({
	mappings = {
		close = "<esc>",
		go_in = "l",
		go_in_plus = "L",
		go_out = "h",
		go_out_plus = "H",
		mark_goto = "'",
		mark_set = "m",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "w",
		trim_left = "<",
		trim_right = ">",
	},
	options = {
		-- Whether to delete permanently or move into module-specific trash
		permanent_delete = false,
		-- Whether to use for editing directories
		use_as_default_explorer = false,
	},
	windows = {
		-- Maximum number of windows to show side by side
		max_number = 2,
		-- Whether to show preview of file/directory under cursor
		preview = true,
		-- Width of focused window
		width_focus = 45,
		-- Width of non-focused window
		width_nofocus = 45,
		-- Width of preview window
		width_preview = 50,
	},
})

vim.keymap.set("n", "<leader>e", function()
	mini_files.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini files" })
