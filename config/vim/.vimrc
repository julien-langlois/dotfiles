" auto load / install plugin manager

if !1 | finish | endif

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

filetype plugin indent on
syntax on
set autoindent                                  " automatically set the indent of a new line
set backspace=indent,eol,start                  " specifies what <BS>, CTRL-W, etc. can do in Insert mode
set hidden                                      " don't unload a buffer when no longer shown in a window
set hlsearch                                    " highlight all matches for the last used search pattern
set laststatus=2                                " always show the statusline
set noshowmode                                  " hide the default mode text (e.g. -- INSERT -- below the statusline)
" set mouse=a                                   " list of flags for using the mouse
set ttymouse=xterm2                             " xterm, xterm2, dec or netterm; type of mouse
set noundofile
set number                                      " always show line numbers
set wildmenu                                    " command-line completion shows a list of matches
set autochdir                                   " change to directory of file in buffer
set noswapfile

let mapleader = ","

" Begin Vim Plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'kien/ctrlp.vim'
Plug 'chr4/nginx.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
" Theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Theme
try
    colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry
let g:lightline = {'colorscheme': 'nord'}

" Buffer
nnoremap gb :ls<CR>:b<Space>
nnoremap <F2> :set nonumber!<CR>                " toggle line numbers

" Finder
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

" CtrlP
let g:ctrlp_show_hidden = 1

" Wildmenu
set wildmode=list:full
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/node_modules/**/*
set wildignore+=tags
set wildignore+=*.tar.*