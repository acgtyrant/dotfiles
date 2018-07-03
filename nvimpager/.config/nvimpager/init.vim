" More user-friendly mapping of key {
  " Map leader key from backslash to comma, which is confortable to human.
  let mapleader = ","
  " easy
  nnoremap ; :
  nnoremap <Tab> %
" }

" Plugins {
  call plug#begin()

  " feature
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
  " log your develop time
  Plug 'wakatime/vim-wakatime'
  " show the number of matches and the index of the current match
  Plug 'google/vim-searchindex'
  " auto detect encoding
  Plug 's3rvac/AutoFenc'
  " do not search forward when match it
  " https://stackoverflow.com/a/13682379/1546088
  Plug 'vim-scripts/star-search'

  " syntax support
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
  " my colorscheme
  Plug 'morhetz/gruvbox'
    let g:gruvbox_italic=1
    let g:gruvbox_constrast_dark='hard'
    let g:gruvbox_constrast_light='hard'
  Plug 'octol/vim-cpp-enhanced-highlight'
  " highlight indent block
  Plug 'Yggdroot/indentLine'
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_char = '┆'
  " eat my big powerline!
  " highlight color code by itself
  Plug 'lilydjwg/colorizer'

  call plug#end()
" }

" windows {
  " do not scroll synchronously
  set noscrollbind
" }

" text typesetting {
  " show line number
  set number
  " and the line number is relative with the current line
  set relativenumber
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
  " minimal number of screen lines to keep above and below the cursor
  set scrolloff=3
  " complete till longest common string
  set wildmode=longest
  " enable all mouse mode
  set mouse=a
  set undolevels=1000
  " ignore file’s mode lines; use vimrc configurations instead
  set nomodeline
  set foldmethod=indent
  " redraw screen only when we need to
  set lazyredraw

  " set theme
  set termguicolors
  set background=dark
  colorscheme gruvbox

  " http://www.skywind.me/blog/archives/2084
  set tags=./.tags;,.tags
" }

" searching/moving {
  set ignorecase
  " override the ignorecase option if the search pattern contains upper case characters
  set smartcase
  " so you do not need add 'g' after every replace command
  set gdefault
  " awhen a bracket is inserted, briefly jump to the matching one
  set showmatch
  " cancle highlight search so easy
  nnoremap <leader><space> :nohlsearch<cr>
" }

" indentation {
" " best indent config
  set tabstop=2
  set expandtab
  set shiftwidth=2
" }
