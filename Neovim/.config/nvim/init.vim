" More user-friendly mapping of key {
  let mapleader = ","
  " map leader key from backslash to comma, which is confortable to human.
  inoremap jj <ESC>
  " just hit j two times to exit.
  nnoremap ; :
  " free your left little finger!
" }

" https://github.com/VundleVim/Vundle.vim
" Vundle manage Vundle and plugins firstly {
  call plug#begin()
  " all plugins {
    " feature
    Plug 'scrooloose/nerdtree' " a tree explorer
      map <F1> :NERDTreeToggle<cr>
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
      " open a NERDTree automatically when vim starts up if no files were specified
      let NERDTreeShowLineNumbers=1
      " enable line numbers
      autocmd FileType nerdtree setlocal relativenumber
      " make sure relative line numbers are used
    Plug 'scrooloose/nerdcommenter' " intensely orgasmic commenting.
      let NERD_c_alt_style=1
      " change the default comment symbol from /**/ to // in c
      let g:NERDCustomDelimiters = {'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '// '}}
    Plug 'majutsushi/tagbar' " displays tags in a window, ordered by scope.
      map <F3> :TagbarToggle<cr>
    Plug 'SirVer/ultisnips'
      let g:UltiSnipsListSnippets="<leader>j"
    Plug 'jiangmiao/auto-pairs'
    Plug 'wakatime/vim-wakatime' " log your develop time

    " syntax support
    Plug 'scrooloose/syntastic'
      let g:syntastic_cpp_compiler = 'clang++'
      let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
    Plug 'Shougo/deoplete.nvim'
      let g:deoplete#enable_at_startup = 1
    Plug 's3rvac/AutoFenc' " auto detect encoding

    " extra language support
    Plug 'rust-lang/rust.vim'
      let g:rustfmt_autosave = 1
      " format your code using [rustfmt][rfmt] every time a buffer is written
    Plug 'cespare/vim-toml'
    Plug 'nvie/vim-flake8'
      autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
      autocmd BufWritePost *.py call Flake8()

    " improve appreance
    Plug 'luochen1990/rainbow'
    Plug 'tomasr/molokai' " color theme
    Plug 'Yggdroot/indentLine' " highlight indent block
      let g:indentLine_color_term = 239
      let g:indentLine_color_gui = '#A4E57E'
      let g:indentLine_char = '│'
      let g:rainbow_active = 1
    Plug 'bling/vim-airline' " eat my big powerline!
      let g:airline_symbols = {}
      let g:airline_powerline_fonts=1
      let g:airline#extensions#branch#enabled =1
      let g:airline#extensions#syntastic#enabled=1
      let g:airline_detect_paste=1
      let g:airline_theme='light'
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_symbols.branch = ''
      let g:airline_symbols.readonly = ''
      let g:airline_symbols.linenr = ''
      let g:airline_symbols.paste = 'Þ'
      let g:airline_whitespace_symbol = 'Ξ'
    Plug 'vim-airline/vim-airline-themes'
      let g:aireline_theme='molokai'
  " }

  call plug#end()
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

 "backup {
  set backup
  set backupdir=~/.config/nvim/backup
  " do not backup in the current dir
  set undofile
 "}

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
  filetype plugin indent on
  syntax on
  set scrolloff=3
  " Minimal number of screen lines to keep above and below the cursor.
  set wildmode=longest
  " complete till longest common string
  set ttimeoutlen=50
  " delay which wait for a key code to complete
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
  set showmatch
  nnoremap <leader><space> :nohlsearch<cr>
" }

" indentation {
  set tabstop=2
  set expandtab
  set shiftwidth=2
" }

" GUI {
  set guioptions=a
  set guifont=hermit\ 11
  set showtabline=2
" }
