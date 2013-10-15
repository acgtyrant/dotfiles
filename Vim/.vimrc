let mapleader = ","

" Let Vundle manage Vundle and plugins firstly {

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" all plugins {
" required! 
Bundle 'gmarik/vundle'

" original repos on github
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
  let g:syntastic_always_populate_loc_list=1
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

Bundle 'Valloric/ListToggle'
  let g:lt_location_list_toggle_map = '<leader>l'
  let g:lt_quickfix_list_toggle_map = '<leader>q'
  let g:lt_height = 10

"Bundle 'gerw/vim-latex-suite'
  "set grepprg=grep\ -nH\ $*
  "let g:tex_flavor = "latex"

Bundle 'tomasr/molokai'

Bundle 'scrooloose/nerdtree'
  map <F1> :NERDTreeToggle<cr>

Bundle 'xuhdev/SingleCompile'
  nmap <F3> :SCCompile<cr>
  nmap <F4> :SCCompileRun<cr>

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-rails.git'
"Bundle 'mattn/gist-vim'
"Bundle 'kien/ctrlp.vim'
"Bundle 'corntrace/bufexplorer'
"Bundle 'mileszs/ack.vim'
" nnoremap <leader>a :Ack

Bundle 'Yggdroot/indentLine'
  let g:indentLine_color_term = 239
  let g:indentLine_color_gui = '#A4E57E'
  let g:indentLine_char = '┆'

Bundle 'SirVer/ultisnips'
  let g:UltiSnipsJumpForwardTrigger="<leader>j"
  let g:UltiSnipsJumpBackwardTrigger="<leader>k"

Bundle 'bling/vim-airline'
  let g:airline_powerline_fonts=1
  let g:airline_enable_branch=1
  let g:airline_enable_syntastic=1
  let g:airline_detect_paste=1
  let g:airline_theme='light'
  let g:airline_left_sep = '⮀'                                                  
  let g:airline_left_alt_sep = '⮁'                                              
  let g:airline_right_sep = '⮂'                                                 
  let g:airline_right_alt_sep = '⮃'
  let g:airline_branch_prefix = '⭠'                                             
  let g:airline_readonly_symbol = '⭤'                                           
  let g:airline_linecolumn_prefix = '⭡'
  let g:airline_paste_symbol = 'Þ'
  let g:airline_whitespace_symbol = 'Ξ'

"Bundle 'vimwiki/vimwiki'
 
""let g:vimwiki_list = [{'path': 'E:/My Dropbox/vimwiki/',
      ""\ 'html_header': 'E:/My Dropbox/Public/vimwiki_template/header.htm',
      ""\ 'html_footer': 'E:/My Dropbox/Public/vimwiki_template/footer.htm',
      ""\ 'diary_link_count': 5},
      ""\{'path': 'Z:\demo\qiuchi\wiki'}]
  "let g:vimwiki_camel_case = 1
  "let g:vimwiki_hl_cb_checked = 1
  "let g:vimwiki_menu = ''
  "let g:vimwiki_folding = 1
  "let g:vimwiki_CJK_length = 1
  "let g:vimwiki_use_mouse = 1
  "let g:vimwiki_use_calendar = 0
  "let g:vimwiki_timestamp_format='%Y年%m月%d日 %H:%M:%S'
  "let g:vimwiki_user_htmls = "search.html,404.html"
  "map <S-F5> :VimwikiAll2HTML<cr>
  "map <F5> :Vimwiki2HTML<cr>

"The c.vim script from vim-scripts is out of date
"So using it which has updated to version 6.0
"Bundle 'blak3mill3r/c.vim'

" vim-scripts repos
" it looks like some library
"Bundle 'L9'
Bundle 'fcitx.vim'
" auto detect encondings
"Bundle 'FencView.vim'
"Bundle 'taglist.vim'
" bookmark
"Bundle 'Visual-Mark'
"Bundle 'genutils'
" improved yankring
"Bundle 'YankRing.vim'
" nnoremap <silent> <F3> :YRShow<cr>
" inoremap <silent> <F3> <ESC>:YRShow<cr>

" non github repos

" }

filetype plugin indent on     " required!
syntax on
" }

" " plugins settings {

" " taglist
" let Tlist_Auto_Open = 0
" let Tlist_Auto_Update = 1
" let Tlist_Hightlight_Tag_On_BufEnter = 1
" let Tlist_Show_One_File = 1    " 只显示当前文件
" let Tlist_Enable_Fold_Column = 0
" let Tlist_File_Fold_Auto_Close = 0
" let Tlist_Process_File_Always = 1
" let Tlist_Display_Prototype = 0
" let Tlist_Compact_Format = 1
" let Tlist_Use_Right_Window = 0
" let Tlist_Exit_OnlyWindow = 1      "如果taglist窗口是最后一个窗口，则退出vim
" let tlist_php_settings = 'php;c:class;d:constant;f:function' 
" let Tlist_WinWidth = 30
" 
" " yankring
" " 配置yankring历史文件名前缀
" let g:yankring_history_file = '.yankring_history'
" 
" " Mini Buffer Explorer
" let g:miniBufExplSplitBelow = 1
" " }

" gui {
if has('gui_running')
 set background=dark
 colorscheme molokai
endif
set guioptions=a
set guifont=Droid\ Sans\ Mono\ for\ Powerline
" }

" splict {
set scrollbind
set nosplitbelow
set nosplitright
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }

" backup {
set backup
set backupdir=~/.vim/.vim_backup//
set swapfile
set directory=~/.vim/.vim_swap//
set undofile
set undodir=~/.vim/.vim_undo/
set viminfo+=n~/.vim/viminfo/

set scrolloff=3
set showcmd
set wildmenu
set wildmode=list:longest
set novisualbell
" }

" text typesetting {
set number
set relativenumber
set ruler
set textwidth=79
set wrap
set wrapscan
" formatoptions=qrn1
" You should set nocolorcolumn in markdown file.
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
cmap w!! w !sudo tee % >/dev/null
autocmd FocusLost * silent! up
autocmd! bufwritepost vimrc source ~/.vimrc
nnoremap <leader>w :w<cr>
nnoremap <leader>e :q<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif

inoremap jj <ESC>
nnoremap ; :

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }

" searching/moving {

" nnoremap / /\v
" vnoremap / /\v
set ignorecase
set smartcase
set gdefault
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
autocmd filetype python set tabstop=4
set shiftwidth=2
set expandtab
" }

" " Fn mapping {
set pastetoggle=<F2>

nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>
" 
" " 切换MiniBufExplorer的显示
" nnoremap <F2> :TMiniBufExplorer<CR>
" 
" " 切换到MiniBufExplorer
" nnoremap <F3> :MiniBufExplorer<CR>
" 
" " 切换TagList的显示
" nnoremap <F4> :TlistToggle<CR>
" 
" " 切换Yank Ring的显示
" nnoremap <silent> <F10> :YRShow<cr>
" inoremap <silent> <F10> <ESC>:YRShow<cr>
" 
" " 在.cpp/.c和.h文件间切换
" nnoremap <F12> <Esc>:A<CR>
" " }

" filetype {
augroup Binary
    autocmd!
    autocmd BufReadPre  *.bin,*.o let &bin=1
    autocmd BufReadPost *.bin,*.o if &bin | %!xxd
    autocmd BufReadPost *.bin,*.o set ft=xxd | endif
    autocmd BufWritePre *.bin,*.o if &bin | %!xxd -r
    autocmd BufWritePre *.bin,*.o endif
    autocmd BufWritePost *.bin,*.o if &bin | %!xxd
    autocmd BufWritePost *.bin,*.o set nomod | endif
augroup END
" }
