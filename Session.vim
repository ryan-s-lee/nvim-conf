let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +8 lua/config/mini-nvim.lua
badd +10 init.lua
badd +1 ~/.config/nvim/lua/plugins/mason-lspconfig.lua
badd +51 lua/options.lua
badd +5 lsp/veridian.lua
badd +32 ~/.config/nvim/lua/keymaps.lua
badd +32 lua/plugins/snacks-nvim.lua
argglobal
%argdel
edit lua/options.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 120 + 121) / 242)
exe 'vert 2resize ' . ((&columns * 121 + 121) / 242)
argglobal
balt ~/.config/nvim/lua/plugins/mason-lspconfig.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 51 - ((36 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 51
normal! 024|
wincmd w
argglobal
if bufexists(fnamemodify("lua/plugins/snacks-nvim.lua", ":p")) | buffer lua/plugins/snacks-nvim.lua | else | edit lua/plugins/snacks-nvim.lua | endif
if &buftype ==# 'terminal'
  silent file lua/plugins/snacks-nvim.lua
endif
balt ~/.config/nvim/lua/keymaps.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 36 - ((35 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 36
let s:c = 9 - ((1 * winwidth(0) + 60) / 121)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 9 . '|'
else
  normal! 09|
endif
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 120 + 121) / 242)
exe 'vert 2resize ' . ((&columns * 121 + 121) / 242)
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
