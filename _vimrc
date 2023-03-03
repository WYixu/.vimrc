" Basic Settings {{{
set number
set numberwidth=4
set wrap
set laststatus=2
set expandtab
set tabstop=2 shiftwidth=2
set hlsearch
set incsearch
syntax on
set guifont=mononoki:h12
set background=dark
colorscheme gruvbox
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
" }}}

" Status Line {{{
set statusline=%.20f
set statusline+=\ -\ 
set statusline+=FileType:
set statusline+=%y
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
" }}}

" Mappings {{{
let mapleader = ","
let maplocalleader = "\\"

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" sourc vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" - move down a line, _ move up a line
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" round a word with quote
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" capitalize a word
nnoremap <c-u> viwUe
" copy all to system clipboard
nnoremap <leader>ca gg"*yG
" convenient moving
nnoremap J Lzz
nnoremap K Hzz
nnoremap H ^
nnoremap L g_
" mark trailing whitespace
nnoremap <leader>w :match Error /\v +$/<cr>
nnoremap <leader>W :match<cr>
" always using very magic mode
nnoremap / /\v
" clear search highlighting
nnoremap <leader>/ :nohlsearch<cr>

" insert mode esc
inoremap jk <esc>
inoremap <esc> <nop>
" quick capitalize
inoremap <c-u> <esc>viwUea

" round marked with quote
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>

" in/around next/last ()
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
" H/L
onoremap L g_

"terminal esc
tnoremap <leader>n <c-\><c-n>
tnoremap <leader>q <c-\><c-n>:q!<cr>
" }}}

" Startup Actions {{{
" Detect Filetype
filetype on
filetype plugin on
filetype indent on
augroup detect_filetype
  autocmd!
  autocmd BufNewFile, BufRead * filetype detect
augroup END
" Maximize GUI
augroup maximizer
  autocmd!
  autocmd GUIEnter * simalt ~x
augroup END
" }}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" C++ file settings {{{
augroup filetype_cpp
  autocmd!
  autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType cpp :iabbrev <buffer> ret return
augroup END
" }}}

" LaTex file settings {{{
augroup filetype_tex
  autocmd!
  autocmd Filetype tex :iabbrev <buffer> para paragraph
  autocmd Filetype tex :iabbrev <buffer> sumin sum_{i=1}^n
augroup END
" }}}
