set termguicolors
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
  Plug 'Valloric/YouCompleteMe'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'arcticicestudio/nord-vim'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'tpope/vim-cucumber'
  " Plug 'Shougo/deoplete.nvim'

" LANGUAGES
  Plug 'Quramy/tsuquyomi'
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'hashivim/vim-terraform'
  Plug 'juliosueiras/vim-terraform-completion'

call plug#end()

set nocompatible
syntax on

" WHITESPACES
set listchars+=tab:▸\ 
set listchars+=trail:·
set listchars+=space:·
set listchars+=eol:↴
set listchars+=nbsp:_
set list

" UI CONFIG
set colorcolumn=80
set cursorline
set relativenumber
set scrolloff=99
set number
set noshowmode
set background=dark
colorscheme nord

" TABS
set shiftwidth=2
set tabstop=2
set expandtab

" SEARCHING
set incsearch
set hlsearch
set ignorecase
" set autochdir

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" LINT
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'css': ['prettier'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" CLIPBOARD
:set clipboard=unnamedplus

" FOLDING
" set foldmethod=syntax

" NERD Tree
" autocmd vimenter * NERDTree

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map <C-n> :NERDTreeToggle<CR>

" DEOPLETE
let g:deoplete#enable_at_startup = 1
