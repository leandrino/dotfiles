call plug#begin('~/.local/share/nvim/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'diepm/vim-rest-console'
  Plug 'w0rp/ale'
  Plug 'roxma/nvim-yarp'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'arcticicestudio/nord-vim'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'tpope/vim-cucumber'
  Plug 'jreybert/vimagit'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nathanaelkane/vim-indent-guides'

  " LANGUAGES
  Plug 'Quramy/tsuquyomi'
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'hashivim/vim-terraform'
  Plug 'juliosueiras/vim-terraform-completion'

call plug#end()

" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
source ~/.vim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.local/share/nvim/backups')
  silent !mkdir ~/.local/share/nvim/backups > /dev/null 2>&1
  set undodir=~/.local/share/nvim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll
thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away
from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Witespaces ========================

set listchars+=tab:▸\ 
set listchars+=trail:·
set listchars+=space:·
set listchars+=eol:↴
set listchars+=nbsp:_
set list

" ================ Custom Settings ========================
so ~/dotfiles/vim/settings.vim
