let mapleader = ","

" Vundle manage Vundle and plugins firstly {

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" all plugins {
" required! 
Plugin 'gmarik/Vundle.vim'

" original repos on github
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
  let g:syntastic_always_populate_loc_list=1
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>

Plugin 'Valloric/ListToggle'
  let g:lt_location_list_toggle_map = '<leader>l'
  let g:lt_quickfix_list_toggle_map = '<leader>q'
  let g:lt_height = 10

Plugin 'tomasr/molokai'
"Vim support for Rust file detection and syntax highlighting.
Plugin 'rust-lang/rust.vim'
  "autocmd BufRead,BufNewFile *.rs set filetype=rust
"Vim syntax for TOML
Plugin 'cespare/vim-toml'

Plugin 'scrooloose/nerdtree'
  map <F1> :NERDTreeToggle<cr>
  "Open a NERDTree automatically when vim starts up if no files were specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plugin 'xuhdev/SingleCompile'
  nmap <F3> :SCCompile<cr>
  nmap <S-F3> :SCCompileRun<cr>

Plugin 'scrooloose/nerdcommenter'
  let NERD_c_alt_style=1

"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
"Plugin 'corntrace/bufexplorer'
"Plugin 'mileszs/ack.vim'
" nnoremap <leader>a :Ack
Plugin 'jiangmiao/auto-pairs'

Plugin 'Yggdroot/indentLine'
  let g:indentLine_color_term = 239
  let g:indentLine_color_gui = '#A4E57E'
  let g:indentLine_char = '┆'

Plugin 'SirVer/ultisnips'
  let g:UltiSnipsListSnippets="<leader>j"

Plugin 'honza/vim-snippets'

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

Plugin 'majutsushi/tagbar'
  nnoremap <silent> <F4> :TagbarToggle<CR>

Plugin 'junegunn/vim-easy-align'

Plugin 'luochen1990/rainbow'
  let g:rainbow_active = 1

Plugin 'nvie/vim-flake8'

" vim-scripts repos
" improved yankring
"Plugin 'YankRing.vim'
" nnoremap <silent> <F3> :YRShow<cr>
" inoremap <silent> <F3> <ESC>:YRShow<cr>

" non github repos

call vundle#end()
filetype plugin indent on     " required!

syntax on
" }

" " plugins settings {

" " yankring
" " 配置yankring历史文件名前缀
" let g:yankring_history_file = '.yankring_history'
" 
" " Mini Buffer Explorer
" let g:miniBufExplSplitBelow = 1
" " }

" gui {
if has('gui_running')
  colorscheme molokai
  set background=dark
  set showtabline=2
  set guioptions=a
  set guifont=Source\ Code\ Pro\ for\ Powerline
endif
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
set t_vb=

" text typesetting {
set number
set relativenumber
set ruler
set textwidth=79
set wrap
set wrapscan
" formatoptions=qrn1
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

" nnoremap / /\v
" vnoremap / /\v
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

" " Fn mapping {

" " 切换MiniBufExplorer的显示
" nnoremap <F2> :TMiniBufExplorer<CR>
" 
" " 切换到MiniBufExplorer
" nnoremap <F3> :MiniBufExplorer<CR>
" 
" " 切换Yank Ring的显示
" nnoremap <silent> <F10> :YRShow<cr>
" inoremap <silent> <F10> <ESC>:YRShow<cr>
" 
" " }

"" filetype {
"augroup Binary
    "autocmd!
    "autocmd BufReadPre  *.bin,*.o let &bin=1
    "autocmd BufReadPost *.bin,*.o if &bin | %!xxd
    "autocmd BufReadPost *.bin,*.o set ft=xxd | endif
    "autocmd BufWritePre *.bin,*.o if &bin | %!xxd -r
    "autocmd BufWritePre *.bin,*.o endif
    "autocmd BufWritePost *.bin,*.o if &bin | %!xxd
    "autocmd BufWritePost *.bin,*.o set nomod | endif
"augroup END
"" }
