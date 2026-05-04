local ok, oil = pcall(require, "oil")
if not ok then
	vim.notify("Unable to load Oil")
	return {}
end

oil.setup({
	default_file_explorer = true,
	columns = {
		"icon",
		"permissions",
		"size",
		-- "mtime",
	},
	-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
	},
	-- Configuration for the file preview window
	preview_win = {
		-- Whether the preview window is automatically updated when the cursor is moved
		update_on_cursor_moved = true,
	},
})

vim.keymap.set("n", "<leader><esc>", function()
	oil.open()
end, { desc = "Open Oil" })
