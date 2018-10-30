set nocompatible
filetype off
syntax on

set number
set rtp+=~/.vim/bundle/Vundle.vim
set laststatus=2

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'

call vundle#end() 
filetype plugin indent on 


"  Plugin settings
let g:airline_powerline_fonts = 1

let g:airline#extensions#whitespace#checks = [ 'indent' ]

let g:ctrlp_map = '<c-p>'

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

map <C-o> :NERDTreeToggle<CR>
map ; :Files<CR>

set encoding=utf-8
set tabstop=4
