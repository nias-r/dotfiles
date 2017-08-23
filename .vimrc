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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

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


set encoding=utf-8
