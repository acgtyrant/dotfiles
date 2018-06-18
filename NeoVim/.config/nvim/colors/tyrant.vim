" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="tyrant"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif


highlight Boolean guifg=#ae81ff ctermfg=141
highlight Character guifg=#e6db74 ctermfg=185
highlight Number guifg=#ae81ff ctermfg=141
highlight String guifg=#e6db74 ctermfg=185
highlight Conditional guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight Constant guifg=#ae81ff gui=bold ctermfg=141 cterm=bold
highlight Cursor guifg=#000000 guibg=#f8f8f0 ctermfg=16 ctermbg=231
hi iCursor         guifg=#000000 guibg=#F8F8F0
highlight Debug guifg=#bca3a3 gui=bold ctermfg=181 cterm=bold
highlight Define guifg=#66d9ef ctermfg=45
highlight Delimiter guifg=#8f8f8f ctermfg=246
highlight DiffAdd guibg=#13354a ctermbg=236
highlight DiffChange guifg=#89807d guibg=#4c4745 ctermfg=244 ctermbg=238
highlight DiffDelete guifg=#960050 guibg=#1e0010 ctermfg=125 ctermbg=232
highlight DiffText guibg=#4c4745 gui=italic,bold ctermbg=238 cterm=bold

highlight Directory guifg=#a6e22e gui=bold ctermfg=112 cterm=bold
highlight Error guifg=#e6db74 guibg=#1e0010 ctermfg=185 ctermbg=232
highlight ErrorMsg guifg=#f92672 guibg=#232526 gui=bold ctermfg=197 ctermbg=235 cterm=bold
highlight Exception guifg=#a6e22e gui=bold ctermfg=112 cterm=bold
highlight Float guifg=#ae81ff ctermfg=141
highlight FoldColumn guifg=#465457 guibg=#000000 ctermfg=239 ctermbg=16
highlight Folded guifg=#465457 guibg=#000000 ctermfg=239 ctermbg=16
highlight Function guifg=#a6e22e ctermfg=112
highlight Identifier guifg=#fd971f ctermfg=208
highlight Ignore guifg=#808080 guibg=bg ctermfg=244
highlight IncSearch guifg=#c4be89 guibg=#000000 ctermfg=144 ctermbg=16

highlight Keyword guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight Label guifg=#e6db74 gui=NONE ctermfg=185 cterm=NONE
highlight Macro guifg=#c4be89 gui=italic ctermfg=144
highlight SpecialKey guifg=#66d9ef gui=italic ctermfg=45

highlight MatchParen guifg=#000000 guibg=#fd971f gui=bold ctermfg=16 ctermbg=208 cterm=bold
highlight ModeMsg guifg=#e6db74 ctermfg=185
highlight MoreMsg guifg=#e6db74 ctermfg=185
highlight Operator guifg=#f92672 ctermfg=197

" complete menu
highlight Pmenu guifg=#66d9ef guibg=#000000 ctermfg=45 ctermbg=16
highlight PmenuSel guibg=#808080 ctermbg=244
highlight PmenuSbar guibg=#080808 ctermbg=232
highlight PmenuThumb guifg=#66d9ef ctermfg=45

highlight PreCondit guifg=#a6e22e gui=bold ctermfg=112 cterm=bold
highlight PreProc guifg=#a6e22e ctermfg=112
highlight Question guifg=#66d9ef ctermfg=45
highlight Repeat guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight Search guifg=#000000 guibg=#ffe792 ctermfg=16 ctermbg=222
" marks
highlight SignColumn guifg=#a6e22e guibg=#232526 ctermfg=112 ctermbg=235
highlight SpecialChar guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight SpecialComment guifg=#7e8e91 gui=bold ctermfg=245 cterm=bold
highlight Special guifg=#66d9ef guibg=bg gui=italic ctermfg=45
if has("spell")
highlight SpellBad guisp=#ff0000 gui=undercurl cterm=undercurl
highlight SpellCap guisp=#7070f0 gui=undercurl cterm=undercurl
highlight SpellLocal guisp=#70f0f0 gui=undercurl cterm=undercurl
highlight SpellRare guisp=#ffffff gui=undercurl cterm=undercurl
endif
highlight Statement guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight StatusLine guifg=#455354 guibg=fg ctermfg=239
highlight StatusLineNC guifg=#808080 guibg=#080808 ctermfg=244 ctermbg=232
highlight StorageClass guifg=#fd971f gui=italic ctermfg=208
highlight Structure guifg=#66d9ef ctermfg=45
highlight Tag guifg=#f92672 gui=italic ctermfg=197
highlight Title guifg=#ef5939 ctermfg=196
highlight Todo guifg=#ffffff guibg=bg gui=bold ctermfg=231 cterm=bold

highlight Typedef guifg=#66d9ef ctermfg=45
highlight Type guifg=#66d9ef gui=NONE ctermfg=45 cterm=NONE
highlight Underlined guifg=#808080 gui=underline ctermfg=244 cterm=underline

highlight VertSplit guifg=#808080 guibg=#080808 gui=bold ctermfg=244 ctermbg=232 cterm=bold
highlight VisualNOS guibg=#403d3d ctermbg=237
highlight Visual guibg=#403d3d ctermbg=237
highlight WarningMsg guifg=#ffffff guibg=#333333 gui=bold ctermfg=231 ctermbg=236 cterm=bold
highlight WildMenu guifg=#66d9ef guibg=#000000 ctermfg=45 ctermbg=16

highlight TabLineFill guifg=#1b1d1e guibg=#1b1d1e ctermfg=234 ctermbg=234
highlight TabLine guifg=#808080 guibg=#1b1d1e gui=NONE ctermfg=244 ctermbg=234 cterm=NONE

if s:molokai_original == 1
highlight Normal guifg=#f8f8f2 guibg=#272822 ctermfg=231 ctermbg=235
highlight Comment guifg=#75715e ctermfg=242
highlight CursorLine guibg=#3e3d32 ctermbg=237 cterm=NONE
highlight CursorLineNr guifg=#fd971f gui=NONE ctermfg=208 cterm=NONE
highlight CursorColumn guibg=#3e3d32 ctermbg=237
highlight ColorColumn guibg=#3b3a32 ctermbg=237
highlight LineNr guifg=#bcbcbc guibg=#3b3a32 ctermfg=250 ctermbg=237
highlight NonText guifg=#75715e ctermfg=242
highlight SpecialKey guifg=#75715e ctermfg=242
else
highlight Normal guifg=#f8f8f2 guibg=#1b1d1e ctermfg=231 ctermbg=234
highlight Comment guifg=#7e8e91 ctermfg=245
highlight CursorLine guibg=#293739 ctermbg=236 cterm=NONE
highlight CursorLineNr guifg=#fd971f gui=NONE ctermfg=208 cterm=NONE
highlight CursorColumn guibg=#293739 ctermbg=236
highlight ColorColumn guibg=#232526 ctermbg=235
highlight LineNr guifg=#465457 guibg=#232526 ctermfg=239 ctermbg=235
highlight NonText guifg=#465457 ctermfg=239
highlight SpecialKey guifg=#465457 ctermfg=239
end

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
