vim.g.mapleader = " "
vim.keymap.set("n", "<leader><Esc>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ww", ":w<cr>")
vim.keymap.set("n", "<leader>qq", ":q!<cr>")

-- Move selected text up and down when on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle of the screen 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")

function __lazygit_toggle()
    local term = require('toggleterm.terminal').Terminal
    local lazygit = term:new {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "none",
            width = 100000,
            height = 100000,
        },
        on_open = function(_) end,
        count = 99,
    }
    lazygit:toggle()
end

vim.keymap.set("n", "<leader>gg", "<cmd>lua __lazygit_toggle()<cr>")
