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
badd +170 lua/config/tabline.lua
argglobal
%argdel
$argadd ./
edit lua/config/tabline.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 10,16fold
sil! 20,22fold
sil! 18,23fold
sil! 25,31fold
sil! 36,38fold
sil! 34,42fold
sil! 46,48fold
sil! 45,60fold
sil! 64,66fold
sil! 67,69fold
sil! 78,85fold
sil! 87,92fold
sil! 77,93fold
sil! 63,94fold
sil! 100,102fold
sil! 108,110fold
sil! 106,111fold
sil! 113,117fold
sil! 96,125fold
sil! 131,134fold
sil! 127,138fold
sil! 144,146fold
sil! 143,147fold
sil! 141,148fold
sil! 155,157fold
sil! 153,158fold
sil! 150,159fold
sil! 166,168fold
sil! 164,169fold
sil! 161,170fold
let &fdl = &fdl
161
sil! normal! zo
164
sil! normal! zo
let s:l = 170 - ((17 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 170
normal! 031|
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
