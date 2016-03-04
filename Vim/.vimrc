" More user-friendly mapping of key {
  " Map leader key from backslash to comma, which is confortable to human.
  let mapleader = ","
  " just hit j two times to exit
  inoremap jj <ESC>
  " easy
  nnoremap ; :
  nnoremap tab %
" }

" https://github.com/VundleVim/Vundle.vim
" Vundle manage Vundle and plugins firstly {
  set nocompatible               " be improved
  filetype off                   " required!
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  " call vundle#begin('~/some/path/here')

  " all plugins {
    " Vim plugins manager
    Plugin 'VumdleVim/Vundle.vim'

    " feature
    Plugin 'scrooloose/nerdtree' " a tree explorer
      map <F1> :NERDTreeToggle<cr>
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
      " open a NERDTree automatically when vim starts up if no files were specified
      let NERDTreeShowLineNumbers=1
      " enable line numbers
      autocmd FileType nerdtree setlocal relativenumber
      " make sure relative line numbers are used
    Plugin 'scrooloose/nerdcommenter' " intensely orgasmic commenting.
      let NERD_c_alt_style=1
      " change the default comment symbol from /**/ to // in c
      let g:NERDCustomDelimiters = {'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '// '}}
    Plugin 'majutsushi/tagbar' " displays tags in a window, ordered by scope.
      map <F3> :TagbarToggle<cr>
    Plugin 'SirVer/ultisnips'
      let g:UltiSnipsListSnippets="<leader>j"
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'wakatime/vim-wakatime' " log your develop time

    " syntax support
    Plugin 'Shougo/neocomplete.vim'
      let g:neocomplete#enable_at_startup = 1
    Plugin 'scrooloose/syntastic'
      let g:syntastic_cpp_compiler = 'clang++'
      let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

    " extra language support
    Plugin 'rust-lang/rust.vim'
      let g:rustfmt_autosave = 1
      " format your code using [rustfmt][rfmt] every time a buffer is written
    Plugin 'cespare/vim-toml'
    Plugin 'nvie/vim-flake8'
      autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
      autocmd BufWritePost *.py call Flake8()

    " improve appreance
    Plugin 'luochen1990/rainbow'
    Plugin 'tomasr/molokai' " color theme
    Plugin 'Yggdroot/indentLine' " highlight indent block
      let g:indentLine_color_term = 239
      let g:indentLine_color_gui = '#A4E57E'
      let g:indentLine_char = '┆'
      let g:rainbow_active = 1
    Plugin 'bling/vim-airline' " eat my big powerline!
      let g:airline_symbols = {}
      let g:airline_powerline_fonts=1
      let g:airline#extensions#branch#enabled =1
      let g:airline#extensions#syntastic#enabled=1
      let g:airline_detect_paste=1
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_symbols.branch = ''
      let g:airline_symbols.readonly = ''
      let g:airline_symbols.linenr = ''
      let g:airline_symbols.paste = 'Þ'
      let g:airline_whitespace_symbol = 'Ξ'
    Plugin 'vim-airline/vim-airline-themes' "
      let g:aireline_theme='molokai'
  " }

  call vundle#end()
  filetype plugin indent on     " required!
  syntax on
" }

" windows {
  set noscrollbind
  " do not scroll synchronously
  nnoremap <leader>s <C-w>v<C-w>l
  " split windows so easy
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  " move between windows so easy
" }

" backup {
  " put all your tmp file in ~/.vim!
  set backup
  set backupdir=~/.vim/.vim_backup//
  set swapfile
  set directory=~/.vim/.vim_swap//
  set undofile
  set undodir=~/.vim/.vim_undo/
" }

" text typesetting {
  set number
  " show line number
  set relativenumber
  " and the line number is relative with the current line
  set ruler
  " show the line and column number of the cursor position
  set textwidth=79
  " wrap the line when it is more than textwidth
  set colorcolumn=80
  " highlight the longest column
  set cursorline
  " highlight the current line in the cursor
  set cursorcolumn
  " highlight the current column in the cursor
  highlight Cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white
  highlight Folded ctermbg=grey ctermfg=black
" }

" general {
  set scrolloff=3
  " Minimal number of screen lines to keep above and below the cursor.
  set showcmd
  " Show (partial) command in the last line of the screen.
  set wildmenu
  set wildmode=longest
  " complete till longest common string
  set noerrorbells
  set novisualbell
  set laststatus=2
  " the lastest window always have a status line
  set encoding=utf-8
  set mouse=a
  " enable all mouse mode
  set history=1000
  set undolevels=1000
  set ttimeoutlen=50
  " delay which wait for a key code to complete
  set autoread
  set ttyfast
  " support a fast terminal
  set backspace=indent,eol,start
  set modelines=0
  set foldmethod=indent
  set confirm
  set lazyredraw
  cmap w!! w !sudo tee % >/dev/null
  " write forcibly as root
  autocmd FocusLost * silent! up
  autocmd! bufwritepost vimrc source ~/.vimrc
  nnoremap <leader>w :w<cr>
  nnoremap <leader>e :q<cr>
  nnoremap <leader>n :bn<cr>
  nnoremap <leader>p :bp<cr>
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
  set pastetoggle=<F2>

  nnoremap <Leader>rtw :%s/\s\+$//e<CR>
  " remove trailing whitespace
  " }

" searching/moving {
  set ignorecase
  set smartcase
  set gdefault
  " so you do not need add 'g' after every replace command
  set incsearch
  set showmatch
  set hlsearch
  " show highlighting of search mapping
  nnoremap <leader><space> :nohlsearch<cr>
" }

" indentation {
  set autoindent
  set tabstop=2
  set expandtab
  set shiftwidth=2
" }
