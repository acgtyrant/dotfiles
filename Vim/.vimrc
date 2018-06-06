" More user-friendly mapping of key {
  " Map leader key from backslash to comma, which is confortable to human.
  let mapleader = ","
  " easy
  nnoremap ; :
  nnoremap <Tab> %
" }

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins {
  call plug#begin()

  " feature
  " a tree explorer
  Plug 'scrooloose/nerdtree'
    map <F1> :NERDTreeToggle<cr>
    let NERDTreeShowLineNumbers=1
    autocmd FileType nerdtree setlocal relativenumber
    let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg$', '\.so$', 'CMakeCache.txt', 'CMakeFiles', 'CMakeScripts', 'cmake_install.cmake']
  " intensely orgasmic commenting.
  Plug 'scrooloose/nerdcommenter'
    " change the default comment symbol from /**/ to // in c
    let NERD_c_alt_style=1
    let g:NERDCustomDelimiters = {'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '// '}}
  " displays tags in a window, ordered by scope.
  Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
  let g:gutentags_ctags_tagfile = '.tags'
  " place all tags in ~/.cache/tags
  let s:vim_tags = expand('~/.cache/tags')
  let g:gutentags_cache_dir = s:vim_tags
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
  Plug 'majutsushi/tagbar'
    map <F3> :TagbarToggle<cr>
    let tagbar_show_linenumbers=2
    autocmd FileType tagbar setlocal relativenumber
    " do not sort tag by name
    let g:tagbar_sort=0
  " auto complete pairs
  Plug 'jiangmiao/auto-pairs'
  " log your develop time
  Plug 'wakatime/vim-wakatime'
  " more powerful search
  Plug 'mileszs/ack.vim'
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
    cnoreabbrev Ack Ack!
    " <C-r><C-W> can input the cuurent word in the command line mode
    " by the way, you can use <C-w> to delete the current word when you do not need it
    nnoremap <Leader>a :Ack! <C-r><C-w>
  " more powerful replace
  Plug 'brooth/far.vim'
    let g:far#source = 'ag'
    nnoremap <Leader>f :Far <C-r><C-w>
  " show the number of matches and the index of the current match
  Plug 'google/vim-searchindex'
  " auto detect encoding
  Plug 's3rvac/AutoFenc'

  " syntax support
  " complete
  Plug 'Shougo/neocomplete.vim'
    let g:neocomplete#enable_at_startup = 1
  " syntax checker
  Plug 'w0rp/ale'
  let g:ale_linters_explicit = 1
  let g:ale_completion_delay = 500
  let g:ale_echo_delay = 20
  let g:ale_lint_delay = 500
  let g:ale_echo_msg_format = '[%linter%] %code: %%s'
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:airline#extensions#ale#enabled = 1

  let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
  let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
  let g:ale_c_cppcheck_options = ''
  let g:ale_cpp_cppcheck_options = ''

  " Check Python files with flake8 and pylint.
  let b:ale_linters = ['flake8', 'pylint']
  " Fix Python files with autopep8 and yapf.
  let b:ale_fixers = ['autopep8', 'yapf']

  let g:ale_sign_error = "\ue009\ue009"
  hi! clear SpellBad
  hi! clear SpellCap
  hi! clear SpellRare
  hi! SpellBad gui=undercurl guisp=red
  hi! SpellCap gui=undercurl guisp=blue
  hi! SpellRare gui=undercurl guisp=magenta

  " extra language support
  Plug 'rust-lang/rust.vim'
    " format your code using [rustfmt][rfmt] every time a buffer is written
    let g:rustfmt_autosave = 1
  Plug 'cespare/vim-toml'
  " proto.vim
  augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
  augroup end

  " improve appreance
  " colorful pairs
  Plug 'luochen1990/rainbow'
  " color theme
  Plug 'tomasr/molokai'
  " highlight indent block
  Plug 'Yggdroot/indentLine'
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_char = '┆'
  " eat my big powerline!
  Plug 'bling/vim-airline'
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
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='molokai'
  " highlight color code by itself
  Plug 'lilydjwg/colorizer'

  Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
      \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
      \}
    let g:ctrlp_working_path_mode = 'r'
    nnoremap <C-p> :CtrlPMixed<cr>

  Plug 'mhinz/vim-signify'

  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-syntax'
  Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java', 'python'] }
  Plug 'sgur/vim-textobj-parameter'

  call plug#end()
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
  colorscheme tyrant
  set t_Co=256

  " http://www.skywind.me/blog/archives/2084
  set tags=./.tags;,.tags
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
