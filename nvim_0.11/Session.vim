let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/dotfiles/nvim_0.11
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +23 lua/config/keymaps.lua
argglobal
%argdel
$argadd ./
edit lua/config/keymaps.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent>  lr :LspRestart
onoremap <buffer> ih :Gitsigns select_hunk
xnoremap <buffer> ih :Gitsigns select_hunk
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal busy=0
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:���
setlocal commentstring=
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal completeslash=
setlocal concealcursor=nvic
setlocal conceallevel=3
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal cursorlineopt=both
setlocal nodiff
setlocal eventignorewin=
setlocal expandtab
if &filetype != 'oil'
setlocal filetype=oil
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=jcroqlnt
setlocal iminsert=0
setlocal imsearch=-1
setlocal includeexpr=
setlocal indentexpr=GetLuaIndent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,-
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal nolist
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,,**
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal shiftwidth=2
setlocal signcolumn=no
setlocal smartindent
setlocal smoothscroll
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=%!v:lua.require'snacks.statuscolumn'.get()
setlocal statusline=%#lualine_a_normal#\ NORMAL\ %#lualine_transitional_lualine_a_normal_to_lualine_b_normal#%#lualine_b_normal#\ \ main\ %#lualine_transitional_lualine_b_normal_to_lualine_c_filetype_DevIconLua_normal#%<%#lualine_c_filetype_DevIconLua_normal#\ \ %#lualine_c_normal#%#lualine_c_normal#%=%#lualine_x_3_normal#\ <20>\ %#lualine_x_normal#%#lualine_x_diff_added_normal#\ \ 13\ %#lualine_transitional_lualine_b_normal_to_lualine_x_diff_added_normal#%#lualine_b_normal#\ 30%%\ %#lualine_b_normal#\ 23:1\ \ %#lualine_transitional_lualine_a_normal_to_lualine_b_normal#%#lualine_a_normal#\ \ 13:18\ 
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=300
if &syntax != 'oil'
setlocal syntax=oil
endif
setlocal tabstop=2
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal textwidth=80
setlocal undofile
setlocal varsofttabstop=
setlocal vartabstop=
setlocal winblend=0
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
sil! 17,22fold
let &fdl = &fdl
let s:l = 23 - ((17 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
