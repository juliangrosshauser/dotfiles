set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rizzatti/dash.vim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

call vundle#end()

filetype plugin indent on
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set history=512
set title
set visualbell
set nonumber
set relativenumber
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
let base16colorspace=256
colorscheme base16-bright
set guifont=Source\ Code\ Pro\ for\ Powerline:h11

let g:airline_theme='base16'
let g:airline_powerline_fonts=1

let g:syntastic_check_on_open=1
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_go_checkers=['govet', 'golint']

let g:racer_cmd = "$HOME/dev/Rust/racer/target/release/racer"

" restore cursor position
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

" remap leader to comma
let mapleader=","

" remap ; to :
nnoremap ; :

" use jk/kj as <esc>
inoremap jk <esc>
inoremap kj <esc>
cnoremap jk <esc>
cnoremap kj <esc>
vnoremap ii <esc>
vnoremap ii <esc>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" clear search highlights
noremap <silent><leader>/ :nohls<cr>

" use sane regexes
nnoremap / /\v
vnoremap / /\v

" force savin files that require root permission
cmap w!! %!sudo tee > /dev/null %

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" insert newline after current line without entering insert mode by pressing enter
nmap <cr> o<esc>
" insert newline before current line without entering insert mode by pressing
" shift and enter
nmap <s-enter> O<esc>

" open ~/.vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>

" source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
