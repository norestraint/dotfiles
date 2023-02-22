local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>lg", builtin.live_grep)
vim.keymap.set("n", "<leader>gs", builtin.grep_string)

vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations)
vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions)

vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

-- Project search
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
    defaults = {
        theme = "dropdown",
    },
}
