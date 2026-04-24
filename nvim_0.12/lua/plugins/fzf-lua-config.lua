ok, fzf_lua = pcall(require, "fzf-lua")

if not ok then
  vim.notify("Unable to start fzf-lua.")
  return {}
end

fzf_lua.setup({})

vim.keymap.set("n", "<leader>ff", function()
	fzf_lua.files()
end, { desc = "FZF Files" })

vim.keymap.set("n", "<leader>fr", function()
	fzf_lua.resume()
end, { desc = "FZF Resume" })

vim.keymap.set("n", "<leader>ff", function()
	fzf_lua.files()
end, { desc = "FZF Files" })

vim.keymap.set("n", "<leader>fg", function()
	fzf_lua.live_grep()
end, { desc = "FZF Live Grep" })

vim.keymap.set("n", "<leader>fb", function()
	fzf_lua.buffers()
end, { desc = "FZF Buffers" })

vim.keymap.set("n", "<leader>fh", function()
	fzf_lua.help_tags()
end, { desc = "FZF Help Tags" })

vim.keymap.set("n", "<leader>fx", function()
	fzf_lua.diagnostics_document()
end, { desc = "FZF Diagnostics Document" })

vim.keymap.set("n", "<leader>fX", function()
	fzf_lua.diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })
