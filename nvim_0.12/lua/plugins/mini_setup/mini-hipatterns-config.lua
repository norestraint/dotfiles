local ok, hipatterns = pcall(require, "mini.hipatterns")
if not ok then
	vim.notify("Unable to load mini.hipatterns")
	return {}
end

mini_hipatterns.setup({
	highlighters = {
		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
