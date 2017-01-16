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
    Plugin 'VundleVim/Vundle.vim'

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
      autocmd FileType tagbar setlocal relativenumber
      map <F3> :TagbarToggle<cr>
      let tagbar_show_linenumbers=2
			let g:tagbar_compact=1
			" no compact help 
      let g:tagbar_type_cpp = {
				\ 'kinds' : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0', 
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \ 'm:members:0:1',
            \ 'n:namespaces:0:1',
            \ 'p:functions_prototypes:0:1',
            \ 's:structs:0:1',
            \ 't:typedefs:0:1',
            \ 'u:unions:0:1',
            \ 'v:global:0:1',
            \ 'x:external:0:1'
        \ ],
        \ 'sro'        : '::',
        \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
        \ },
        \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
        \ }
			\ }
    Plugin 'SirVer/ultisnips'
      let g:UltiSnipsListSnippets="<leader>j"
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'wakatime/vim-wakatime' " log your develop time
    Plugin 'mileszs/ack.vim'
      cnoreabbrev Ack Ack!
      nnoremap <Leader>a :Ack!<Space>

    " syntax support
    Plugin 'Shougo/neocomplete.vim'
      let g:neocomplete#enable_at_startup = 1
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
    Plugin 's3rvac/AutoFenc' " auto detect encoding

    " extra language support
    Plugin 'rust-lang/rust.vim'
      let g:rustfmt_autosave = 1
      " format your code using [rustfmt][rfmt] every time a buffer is written
    Plugin 'cespare/vim-toml'

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
    Plugin 'vim-airline/vim-airline-themes'
      let g:aireline_theme='molokai'
    Plugin 'lilydjwg/colorizer'
    " proto.vim
    augroup filetype
      au! BufRead,BufNewFile *.proto setfiletype proto
    augroup end
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
  set colorcolumn=80
  " highlight the longest column
  set cursorline
  " highlight the current line in the cursor
  set cursorcolumn
  " highlight the current column in the cursor
  highlight Cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white
  highlight Folded ctermbg=grey ctermfg=black
  " distinguish tab, trail space and nbsp
  " http://vi.stackexchange.com/a/430/5663
  set list
  set listchars=tab:␉·,trail:␠,nbsp:⎵
" }

" general {
  set nrformats=
  " Do not use oct to increase of decrease number.
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
