" Map leader key from backslash to comma, which is confortable to human.
let mapleader = ","

" Vundle manage Vundle and plugins firstly {

set nocompatible               " be improved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" all plugins {
" Vim plugins manager
Plugin 'gmarik/Vundle.vim'

" original repos on github
Plugin 'scrooloose/nerdtree'
  map <F1> :NERDTreeToggle<cr>
  "Open a NERDTree automatically when vim starts up if no files were specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plugin 'scrooloose/nerdcommenter'
  let NERD_c_alt_style=1

Plugin 'majutsushi/tagbar'
  map <F3> :TagbarToggle<cr>

"Plugin 'vim-scripts/LustyExplorer'
  "nmap <Leader>lf :LustyFilesystemExplorer<cr>
  "nmap <Leader>lr :LustyFilesystemExplorerFromHere<cr>
  "nmap <Leader>lb :LustyBufferExplorer<cr>
  "nmap <Leader>lg :LustyBufferGrep<cr>

Plugin 'Valloric/YouCompleteMe'
  let g:syntastic_always_populate_loc_list=1
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>
Plugin 'scrooloose/syntastic'

Plugin 'SirVer/ultisnips'
  let g:UltiSnipsListSnippets="<leader>j"

Plugin 'honza/vim-snippets'

Plugin 'rust-lang/rust.vim'

Plugin 'cespare/vim-toml'

Plugin 'tomasr/molokai'

Plugin 'tpope/vim-surround'

Plugin 'jiangmiao/auto-pairs'

Plugin 'Yggdroot/indentLine'
  let g:indentLine_color_term = 239
  let g:indentLine_color_gui = '#A4E57E'
  let g:indentLine_char = '┆'

Plugin 'luochen1990/rainbow'
  let g:rainbow_active = 1

Plugin 'bling/vim-airline'
  let g:airline_symbols = {}
  let g:airline_powerline_fonts=1
  let g:airline_enable_branch=1
  let g:airline_enable_syntastic=1
  let g:airline_detect_paste=1
  let g:airline_theme='light'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_paste_symbol = 'Þ'
  let g:airline_whitespace_symbol = 'Ξ'

call vundle#end()

filetype plugin indent on     " required!

syntax on
" }

" splict {
set scrollbind
set nosplitbelow
set nosplitright
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }

" backup {
set backup
set backupdir=~/.vim/.vim_backup//
set swapfile
set directory=~/.vim/.vim_swap//
set undofile
set undodir=~/.vim/.vim_undo/
set viminfo+=n~/.vim/.viminfo/
" }

set scrolloff=3
set showcmd
set wildmenu
set wildmode=longest
set noerrorbells
set novisualbell
set noeb vb t_vb=

" text typesetting {
set number
set relativenumber
set ruler
set textwidth=79
set wrap
set wrapscan
set colorcolumn=80
set cursorline
set cursorcolumn
hi Cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white
set nolist
nnoremap <leader>h :set cursorline! cursorcolumn!<CR>
highlight Folded ctermbg=grey ctermfg=black
" }

" general {
set laststatus=2
set encoding=utf-8
set mouse=a
set history=1000
set undolevels=1000
set ttimeoutlen=50
set autoread
set ttyfast
set backspace=indent,eol,start
set modelines=0
set selection=inclusive
set foldmethod=indent
set confirm
set noscrollbind
set ttyfast
set lazyredraw
cmap w!! w !sudo tee % >/dev/null
autocmd FocusLost * silent! up
autocmd! bufwritepost vimrc source ~/.vimrc
nnoremap <leader>w :w<cr>
nnoremap <leader>e :q<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
set pastetoggle=<F2>

autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif

autocmd BufWritePre *.py :%s/\s\+$//e

inoremap jj <ESC>
nnoremap ; :

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

match ErrorMsg '\s\+$'
"match Todo /\s\+$/
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" }

" searching/moving {
set ignorecase
set smartcase
set gdefault "" You do not need add 'g' after every replace command
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
map <tab> %
nnoremap <S-h> :bp<cr>
nnoremap <S-l> :bn<cr>
" }

" indentation {
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
" }
