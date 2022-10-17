" VIMRC                    VER: 5.0 (2022-07-09) "
" ================================================
" VUNDLE PLUGIN
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Supertab plugin (press TAB will give suggestions...)
Plugin 'ervandew/supertab'

" NerdTree Plugin - Ctl+n to open NerdTree
Plugin 'scrooloose/nerdtree'

" Python Syntax checker (inc REP-8 support)
Plugin 'scrooloose/syntastic'

" Lightline - Nice colorfull status line
Plugin 'itchyny/lightline.vim'

" SimpylFold - Fold block of code
Plugin 'tmhedberg/SimpylFold'
set foldmethod=indent

" jedi-vim - Python 2.7+  auto-complete: os.(will give you suggestion)
Plugin 'davidhalter/jedi-vim'

" delimitMate - Automatic close ",(,[...
Plugin 'delimitMate.vim'

" VIM close html tag
Plugin 'alvan/vim-closetag'

" Surround
"  BASIC USAGE:
"    ds" - delete surround " (left+right)
"    cs'" - change surround ' to "
"    yss' - you surround the whole line with '
"    yss<HTML TAG> - surround the whole line with HTML TAGS
"    ysas' - you surround the whole sentence '
"    ysiw' - you surround - surround the word with '
"  VISUAL MODE:
"    select area, S' sorround the area with '
Plugin 'tpope/vim-surround'

" Last Place
Plugin 'farmergreg/vim-lastplace'

" OneDark Theme
Plugin 'joshdick/onedark.vim'

" T-Comment
Plugin 'tomtom/tcomment_vim'
" USAGE:
"  BASIC USAGE:
"    gcc - comment\uncomment the whole line
"  VISUAL USAGE:
"    gc - comment\uncomment the whole region

call vundle#end()
filetype plugin indent on

" VUNDLE HELP
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins. append `!` to auto-approve removal
" :h vundle for more details or wiki for FAQ
" ============================================================================

filetype plugin on " load filetype plugins

" Better copy & paste (Press before you paste large blocks of code)
set pastetoggle=<F2>
"set clipboard+=unnamed
set clipboard=unnamedplus

" Mouse and backspace
set mouse=a
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
let mapleader = ","

" Quicksave: use ctrl+z (in any vim status)
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" shift+H to get python help on current word (via pydoc)
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Open new tab
map <C-t> <esc>:tabnew<CR>

" easier moving of code blocks: select code in visual mode and press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Sort: Mark block and use <Leader>s
vnoremap <Leader>s :sort<CR>

" No backup files
set nobackup
set nowritebackup
set noswapfile

" Show whitespace (MUST be inserted BEFORE the colorscheme command)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"set t_Co=256

" Showing line numbers and length
set number  " show line numbers
set relativenumber
set number relativenumber
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Enable syntax highlighting
syntax on

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Settings for vim-powerline
set laststatus=2

" Settings for ctrl+p
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Show hide invisible character
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>

set ruler " Always show current positions along the bottom
set wildmenu " turn on wild menu
set noerrorbells " don't make noise
set showmatch " show matching brackets
set ai " autoindent
set si " smartindent
set guioptions-=T "Remove toolbar
set guioptions-=m "Remove menu
au BufWinLeave * mkview

"python definition
set autoindent "when you press RETURN new line is created with the right indent
set cpoptions+=$

" Run F5 to run python scripts
map <F5> :!python %<cr>
command P :!python %
map <F6> :!python3 %<cr>

"Hebrew:
" :set invrl - change keyborad to hebrew and vice versa
" F9 key for right to left writing in command mode
map <F9> <Esc>:set invrl<CR>a
"F9 key for right to keft writing in insert mode
imap <F9> <Esc>:set invrl<CR>a

" Write Backup Plugin
command W :WriteBackup
map <F4> <Esc> :WriteBackup

" Force saving the file with sudo
command S :w !sudo tee % >/dev/null

ab br <BR />
ab ol <OL></OL>
ab li <LI></LI>
ab mail ilan.shavit@gmail.com

colorscheme onedark
