let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/dotfiles/nvim_0.12
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +3 lua/plugins/conform-config.lua
badd +51 lua/config/tabline.lua
badd +70 lua/config/statusline.lua
badd +18 lua/config/options.lua
argglobal
%argdel
$argadd .
edit lua/config/tabline.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt lua/config/statusline.lua
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
45
sil! normal! zo
62
sil! normal! zo
76
sil! normal! zo
95
sil! normal! zo
105
sil! normal! zo
126
sil! normal! zo
140
sil! normal! zo
142
sil! normal! zo
149
sil! normal! zo
152
sil! normal! zo
62
sil! normal! zo
76
sil! normal! zo
95
sil! normal! zo
105
sil! normal! zo
126
sil! normal! zo
140
sil! normal! zo
142
sil! normal! zo
149
sil! normal! zo
152
sil! normal! zo
let s:l = 51 - ((10 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 51
normal! 010|
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
