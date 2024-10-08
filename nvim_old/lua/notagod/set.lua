vim.opt.guicursor = ""
vim.opt.guicursor = "n:,v-ve:block-Cursor"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true

vim.opt.cursorline = true

vim.g.mapleader = " "

vim.cmd("set noshowmode")

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})
]])


