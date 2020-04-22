set runtimepath+=~/.config/nvim/plugged/vim-gutentags
set runtimepath+=~/.config/nvim/plugged/tagbar
set runtimepath+=~/.config/nvim/plugged/vim-searchindex
set runtimepath+=~/.config/nvim/plugged/AutoFenc
set runtimepath+=~/.config/nvim/plugged/vim-toml
set runtimepath+=~/.config/nvim/plugged/rainbow
" my colorscheme
set runtimepath+=~/.config/nvim/plugged/gruvbox
set runtimepath+=~/.config/nvim/plugged/vim-cpp-enhanced-highlight
set runtimepath+=~/.config/nvim/plugged/indentLine
set runtimepath+=~/.config/nvim/plugged/vim-airline
set runtimepath+=~/.config/nvim/plugged/colorizer
set runtimepath+=~/.config/nvim/plugged/LeaderF
set runtimepath+=~/.config/nvim/plugged/vim-signify
set runtimepath+=~/.config/nvim/plugged/vim-textobj-user

set runtimepath+=~/.config/nvim/plugged/vim-textobj-indent
set runtimepath+=~/.config/nvim/plugged/vim-textobj-syntax
set runtimepath+=~/.config/nvim/plugged/vim-textobj-parameter

" More user-friendly mapping of key {
  " Map leader key from backslash to comma, which is confortable to human.
  let mapleader = ","
  " easy
  nnoremap ; :
  nnoremap <Tab> %
" }

  " feature
  " displays tags in a window, ordered by scope.
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
  let g:gutentags_ctags_tagfile = '.tags'
  " place all tags in ~/.cache/tags
  let s:vim_tags = expand('~/.cache/tags')
  let g:gutentags_cache_dir = s:vim_tags
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    map <F3> :TagbarToggle<cr>
    let tagbar_show_linenumbers=2
    autocmd FileType tagbar setlocal relativenumber
    " do not sort tag by name
    let g:tagbar_sort=0
  " show the number of matches and the index of the current match
  "set runtimepath+=~/.config/nvim/plugged/vim-beancount
  " auto detect encoding
  " do not search forward when match it
  " https://stackoverflow.com/a/13682379/1546088
  "Plug 'vim-scripts/star-search'

  "" syntax support
  "" complete
  "Plug 'Shougo/deoplete.nvim'
    "set runtimepath+=~/.config/nvim/plugged/nvim-yarp
    "set runtimepath+=~/.config/nvim/plugged/vim-hug-neovim-rpc
    "let g:deoplete#enable_at_startup = 1
  "" extra language support
  "Plug 'rust-lang/rust.vim'
    "" format your code using [rustfmt][rfmt] every time a buffer is written
    "let g:rustfmt_autosave = 1
  " proto.vim
  augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
  augroup end

  " improve appreance
  " colorful pairs
    let g:gruvbox_italic=1
    let g:gruvbox_constrast_dark='hard'
    let g:gruvbox_constrast_light='hard'
  " highlight indent block
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_char = '┆'
  " eat my big powerline!
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
  "Plug 'vim-airline/vim-airline-themes'
    "let g:airline_theme='molokai'
  " highlight color code by itself

    let g:Lf_ShortcutF = '<c-p>'
    let g:Lf_ShortcutB = '<m-n>'
    noremap <c-n> :LeaderfMru<cr>
    noremap <m-p> :LeaderfFunction!<cr>
    noremap <m-n> :LeaderfBuffer<cr>
    noremap <m-m> :LeaderfTag<cr>
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': ''  }
   
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

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
  set listchars=tab:␉·,trail:␠,nbsp:¬
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
  " display a confirmation dialog when closing an unsaved file
  set confirm
  " redraw screen only when we need to
  set lazyredraw
  set pastetoggle=<F2>

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
