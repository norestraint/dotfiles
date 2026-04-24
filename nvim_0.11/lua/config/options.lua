vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("set noshowmode")
vim.cmd("set formatoptions+=w")
vim.cmd("set tw=80")

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.updatetime = 300
opt.virtualedit = "block"
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.textwidth = 80

-- cursor style
opt.guicursor = "i:ver20-iCursor,n-v-ve:block-nCursor,a:blinkwait10-blinkon200-blinkoff2000"
opt.cursorline = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- appearence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.showmatch = true
opt.virtualedit = "block"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.cmdheight = 0

-- Folding settings
opt.smoothscroll = true
opt.foldmethod = "indent"
opt.foldlevel = 99 -- Start with all folds open
opt.foldtext = "" -- Start with all folds open
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

--

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.loader.enable()

return {}
