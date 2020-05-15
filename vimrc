set nocompatible
filetype plugin indent on
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set history=512
set title
set visualbell
set number
set norelativenumber
set ruler
set cursorline
set showmatch

set laststatus=2
set viminfo='10,"100,:20,%,n~/.viminfo

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set wrapscan

set noswapfile
set nobackup
set hidden
set undodir=~/.vim/undodir
set undofile
set undolevels=2000

syntax enable
set background=dark
" Fix background in Windows Terminal. `set termguicolors` doesn't fix it completely. See: https://github.com/dracula/vim/issues/164
let g:dracula_colorterm = 0
packadd! dracula
colorscheme dracula
set guifont=Hasklig:h11

" Restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Remap leader to comma
let mapleader=","

" Remap ; to :
nnoremap ; :

" Use jk/kj as <esc>
inoremap jk <esc>
inoremap kj <esc>
cnoremap jk <esc>
cnoremap kj <esc>
vnoremap ii <esc>
vnoremap ii <esc>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Clear search highlights
noremap <silent><leader>/ :nohls<cr>

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Insert newline after current line without entering insert mode by pressing
" enter
nmap <cr> o<esc>
" Insert newline before current line without entering insert mode by pressing
" shift and enter
nmap <s-enter> O<esc>

" Open ~/.vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>

" Source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
