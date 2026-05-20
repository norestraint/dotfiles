vim.cmd("let g:netrw_liststyle = 3")
-- vim.cmd("set formatoptions+=w")

-- cursor stuff
vim.opt.guicursor = "i:ver20-iCursor,n-v-ve:block-nCursor,a:blinkwait10-blinkon200-blinkoff2000"
vim.opt.cursorline = true
vim.opt.mouse = "a" -- Enables mouse support

vim.opt.wrap = false

vim.opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns? above and below the cursor

-- tabs & indentation
vim.opt.tabstop = 2 -- Width of the tabs
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Width of the indent
vim.opt.expandtab = true -- Use spaces in place of tabs

vim.opt.smartindent = true
vim.opt.autoindent = true -- Use indent from current line

vim.opt.textwidth = 80

-- search settings
vim.opt.ignorecase = true -- Sets case-insensitive search
vim.opt.smartcase = true -- Sets case-sensitive using upcase
vim.opt.hlsearch = true -- Highlights search matches
vim.opt.incsearch = true -- Highlights search as typing

-- appearence
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.colorcolumn = "80" -- Always show the sign column
vim.opt.showmatch = true -- Highlights matching brackets

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.virtualedit = "block"

vim.opt.cmdheight = 0 -- Single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- Set completion options
vim.opt.showmode = false -- Don't show the mode

vim.opt.pumheight = 10 -- Sets popup menu height
vim.opt.pumblend = 10 -- Sets popup menu transparency
vim.opt.winblend = 0 -- Sets floating window transparency

vim.opt.conceallevel = 0 -- Sets no hide markup
vim.opt.concealcursor = "" -- Sets cursorline always on in markup

-- vim.opt.lazyredraw = true -- Sets no redraw during macros
vim.opt.synmaxcol = 300 -- Sets syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- Sets no "~" on empty lines

-- backspace
vim.opt.backspace = "indent,eol,start" -- Sets better backspace behaviour
vim.opt.autochdir = false -- Disables autochange directories
vim.opt.iskeyword:append("-") -- Includes - in words
vim.opt.path:append("**") -- Includes subdirs in search
vim.opt.selection = "inclusive" -- Include last char in selection
vim.opt.modifiable = true -- Allows buffer modifications
vim.opt.encoding = "utf-8" -- Sets the basic encoding

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- Sets the use of system clipboard

vim.opt.hidden = true -- Allows hidden buffers
vim.opt.errorbells = false -- Disables error sounds

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- turn off swapfile
local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- Creates undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.backup = false -- Disables backup file
vim.opt.writebackup = false -- Disables writing to the backup file
vim.opt.swapfile = false -- Disables the swapfile
vim.opt.undofile = true -- Disables undo file
vim.opt.undodir = undodir -- Re-sets the undo directory

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.updatetime = 300 -- Enables faster completion
vim.opt.timeoutlen = 500 -- Sets timeout duration
vim.opt.ttimeoutlen = 50 -- Sets key code timeout
vim.opt.autoread = true -- Sets auto-reload changes if outside of neovim
vim.opt.autowrite = false -- Disables auto-save

-- Folding settings
vim.opt.smoothscroll = true
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldmethod = "expr" -- Sets expression for folding
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Sets treesitter for folding
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldtext = "" -- Start with all folds open
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

--
vim.opt.diffopt:append("linematch:60") -- Improves diff display
vim.opt.redrawtime = 10000 -- Increases redraw tolerance
vim.opt.maxmempattern = 20000 -- Increases max memory

-- opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.loader.enable()

return {}
