" More user-friendly mapping of key {
  " Map leader key from backslash to comma, which is confortable to human.
  let mapleader = ","
  " easy
  nnoremap ; :
  nnoremap <Tab> %
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
    Plugin 'VundleVim/Vundle.vim'

    " feature
    " a tree explorer
    Plugin 'scrooloose/nerdtree'
      map <F1> :NERDTreeToggle<cr>
      " open a NERDTree automatically when vim starts up if no files were specified
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
      let NERDTreeShowLineNumbers=1
      autocmd FileType nerdtree setlocal relativenumber
      let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg$', '\.so$', 'CMakeCache.txt', 'CMakeFiles', 'CMakeScripts', 'cmake_install.cmake']
    " intensely orgasmic commenting.
    Plugin 'scrooloose/nerdcommenter'
      " change the default comment symbol from /**/ to // in c
      let NERD_c_alt_style=1
      let g:NERDCustomDelimiters = {'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '// '}}
    " displays tags in a window, ordered by scope.
    Plugin 'majutsushi/tagbar'
      map <F3> :TagbarToggle<cr>
      let tagbar_show_linenumbers=2
      autocmd FileType tagbar setlocal relativenumber
      " do not sort tag by name
      let g:tagbar_sort=0
    " auto complete pairs
    Plugin 'jiangmiao/auto-pairs'
    " log your develop time
    Plugin 'wakatime/vim-wakatime'
    " more powerful search
    Plugin 'mileszs/ack.vim'
      if executable('ag')
        let g:ackprg = 'ag --vimgrep'
      endif
      cnoreabbrev Ack Ack!
      " <C-r><C-W> can input the cuurent word in the command line mode
      " by the way, you can use <C-w> to delete the current word when you do not need it
      nnoremap <Leader>a :Ack! <C-r><C-w>
    " more powerful replace
    Plugin 'brooth/far.vim'
      let g:far#source = 'ag'
      nnoremap <Leader>f :Far <C-r><C-w>
    " show the number of matches and the index of the current match
    Plugin 'google/vim-searchindex'
    " auto detect encoding
    Plugin 's3rvac/AutoFenc'
    " git feature
    Plugin 'tpope/vim-fugitive'

    " syntax support
    " complete
    Plugin 'Shougo/neocomplete.vim'
      let g:neocomplete#enable_at_startup = 1
    " syntax checker
    Plugin 'scrooloose/syntastic'
      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*

      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 2
      let g:syntastic_loc_list_height=5
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      let g:syntastic_cpp_checkers = ['clang_check']
      let g:syntastic_cpp_compiler = 'clang++'
      let g:syntastic_cpp_compiler_options = '-std=c++14 -stdlib=libc++'
      let g:syntastic_python_checkers = ['flake8']

    " extra language support
    Plugin 'rust-lang/rust.vim'
      " format your code using [rustfmt][rfmt] every time a buffer is written
      let g:rustfmt_autosave = 1
    Plugin 'cespare/vim-toml'
    " proto.vim
    augroup filetype
      au! BufRead,BufNewFile *.proto setfiletype proto
    augroup end

    " improve appreance
    " colorful pairs
    Plugin 'luochen1990/rainbow'
    " color theme
    Plugin 'tomasr/molokai'
    " highlight indent block
    Plugin 'Yggdroot/indentLine'
      let g:indentLine_color_term = 239
      let g:indentLine_color_gui = '#A4E57E'
      let g:indentLine_char = '┆'
    " eat my big powerline!
    Plugin 'bling/vim-airline'
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
    Plugin 'vim-airline/vim-airline-themes'
      let g:airline_theme='molokai'
    " highlight color code by itself
    Plugin 'lilydjwg/colorizer'
  " }

  call vundle#end()
  filetype plugin indent on     " required!
  syntax on
" }

" windows {
  " do not scroll synchronously
  set noscrollbind
  " split windows so easy
  nnoremap <leader>v <C-w>v<C-w>l
  nnoremap <leader>s <C-w>s<C-w>j
  " move between windows so easy
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
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
  " show line number
  set number
  " and the line number is relative with the current line
  set relativenumber
  " show the line and column number of the cursor position
  set ruler
  " highlight the longest column
  set colorcolumn=80
  " highlight the current line in the cursor
  set cursorline
  " highlight the current column in the cursor
  set cursorcolumn
  highlight Cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white
  highlight Folded ctermbg=grey ctermfg=black
  " distinguish tab, trail space and nbsp
  " http://vi.stackexchange.com/a/430/5663
  set list
  set listchars=tab:␉·,trail:␠,nbsp:⎵
" }

" general {
  " do not use oct to increase of decrease number
  set nrformats=
  " minimal number of screen lines to keep above and below the cursor
  set scrolloff=3
  " show (partial) command in the last line of the screen
  set showcmd
  " enhance command-line completion
  set wildmenu
  " complete till longest common string
  set wildmode=longest
  set noerrorbells
  set novisualbell
  " the lastest window always have a status line
  set laststatus=2
  set encoding=utf-8
  " enable all mouse mode
  set mouse=a
  set history=1000
  set undolevels=1000
  " automatically read file when it is changed outside of Vim
  set autoread
  " support a fast terminal
  set ttyfast
  " https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
  set backspace=indent,eol,start
  " ignore file’s mode lines; use vimrc configurations instead
  set nomodeline
  set foldmethod=indent
  " display a confirmation dialog when closing an unsaved file
  set confirm
  " redraw screen only when we need to
  set lazyredraw
  " write forcibly as root
  cmap w!! w !sudo tee % >/dev/null
  autocmd FocusLost * silent! up
  nnoremap <leader>w :w<cr>
  nnoremap <leader>e :q<cr>
  set pastetoggle=<F2>

  " remove trailing whitespace
  nnoremap <Leader>rtw :%s/\s\+$//e<CR>
  " }

" searching/moving {
  set ignorecase
  " override the ignorecase option if the search pattern contains upper case characters
  set smartcase
  " so you do not need add 'g' after every replace command
  set gdefault
  " search dynamically
  set incsearch
  " awhen a bracket is inserted, briefly jump to the matching one
  set showmatch
  set hlsearch
  " cancle highlight search so easy
  nnoremap <leader><space> :nohlsearch<cr>
" }

" indentation {
" " best indent config
  set autoindent
  set tabstop=2
  set expandtab
  set shiftwidth=2
" }
