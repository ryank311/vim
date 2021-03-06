" don't make vim compatible with vi 
set nocompatible
 
" turn on syntax highlighting
syntax on
" and show line numbers
set number
set relativenumber
 
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on
 
" reload files changed outside vim
set autoread         
 
" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8
 
" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim
 
" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start
 
" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden
 
" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos
 
" save up to 100 marks, enable capital marks
set viminfo='100,f1
 
" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw
 
" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience
 
" set , as mapleader
let mapleader = ","
 
" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
 
" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']
 
" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
 
" hide unnecessary gui in gvim
"if has("gui_running")
"    set guioptions-=m  " remove menu bar
"    set guioptions-=t  " remove toolbar
"    set guioptions-=r  " remove right-hand scroll bar
"    set guioptions-=l  " remove left-hand scroll bar
"end
 
" set Adobe's Source Code Pro font as default
set guifont=Source\ Code\ Pro
 
" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv 
 
" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile
 
" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
 
" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
"nnoremap ' `
"nnoremap ` '
 
" suggestion for normal mode commands
set wildmode=list:longest
 
" keep the cursor visible within 3 lines when scrolling
set scrolloff=3
 
" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces
 
" no lines longer than 80 cols
"set textwidth=80
 
" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>
 
" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less
"   .jade files use jade syntax
autocmd BufNewFile,BufRead *.jade setlocal ft=jade
 
" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>
 
" select all mapping
noremap <leader>a ggVG
 
" ---------------------- PLUGIN CONFIGURATION ----------------------
" initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
 
" start plugin defintion
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'itchyny/lightline.vim'      
Plugin 'vim-scripts/FuzzyFinder'
" -- Web Development
Plugin 'Shutnik/jshint2.vim'        
Plugin 'kchmck/vim-coffee-script'   
Plugin 'groenewege/vim-less'        
Plugin 'skammer/vim-css-color'      
Plugin 'hail2u/vim-css3-syntax'     
 
" end plugin definition
call vundle#end()            " required for vundle
 
" start NERDTree on start-up and focus active window
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
 
" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>
noremap <C-n> :NERDTreeToggle<cr>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" use zencoding with <C-E>
let g:user_emmet_leader_key = '<c-e>'
 
" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
autocmd BufWritePost *.js silent :JSHint

"This is a fix for the power line
if !has('gui_running')
  set t_Co=256
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

