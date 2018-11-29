syntax on
set ruler
set showmode
set showcmd
"set cuc"
set cul
set nu rnu
set scrolloff=10
set background=dark
set tabstop=4
set ttimeoutlen=100
set nowrap

set hlsearch
set incsearch
set ignorecase
set clipboard=unnamedplus

nnoremap <F2> :set norelativenumber!<CR>:set nonumber!<CR>
" exit vim "
nnoremap <F9> :exec "x"<CR>

:imap jj <Esc>"
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <F4> : set nu rnu!<BAR> set nonu nornu?<CR>
" tab indent "
vmap <TAB> >gv
vmap <S-TAB> <gv

filetype indent plugin on
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize "
call plug#begin('~/.vim/plugged')
" 插件和設定放這裡(設定也可以放外面) "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentline'
nnoremap <F3> :IndentLinesToggle<CR>
call plug#end()
filetype plugin indent on

":colorscheme molokai"

if has("autocmd")
au BufReadPost * exe "normal! g`\""
endif

" command abbreviate "
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev db bd


" remove trailing whitespace when writing a buffer. "
" From: Vigil <vim5632@rainslide.net> "
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
autocmd VimLeave ~/col5/os/**/*.c execute "!astyle *.c *.h"
autocmd VimLeave ~/col5/os/**/*.h execute "!astyle *.c *.h"
