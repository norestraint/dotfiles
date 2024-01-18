return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>"},
        {"<leader>lg", "<cmd>Telescope live_grep<cr>"},
        {"<leader>gs", "<cmd>Telescope grep_string<cr>"},

        {"<leader>gi", "<cmd>Telescope lsp_implementations<cr>"},
        {"<leader>gr", "<cmd>Telescope lsp_references<cr>"},
        {"<leader>gd", "<cmd>Telescope lsp_definitions<cr>"},

        {"<leader>gf", "<cmd>Telescope git_files<cr>"},

        {"<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<cr>"}
    },
    opts = {
        pickers = {
            find_files = {
                theme = "dropdown",
            },
            live_grep = {
                theme = "dropdown",
            },
            grep_string = {
                theme = "dropdown",
            },
            lsp_implementations = {
                theme = "dropdown",
            },
            lsp_references = {
                theme = "dropdown",
            },
        }
    }
}

