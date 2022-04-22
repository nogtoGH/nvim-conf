"-------------------------------------------------------------------------------
"
"     File Name           :     otgon.vim
"     Created By          :     otgon
"     Creation Date       :     [2021-10-20 21:31]
"     Last Modified       :
"     Description         :     nogto color v1
"--------------------------------------------------------------------------------
let s:color0 = "#22292b"
let s:color1 = "#e06e6e"
let s:color2 = "#8ccf7e"
let s:color3 = "#e5c76b"
let s:color4 = "#67b0e8"
let s:color5 = "#c47fd5"
let s:color6 = "#87dfdf"
let s:color7 = "#b3b9b8"
let s:color8 = "#191919"
let s:color9 = "#ef7d7d"
let s:color10 = "#9bdead"
let s:color11 = "#f4d67a"
let s:color12 = "#6cb5ed"
let s:color13 = "#ce89df"
let s:color14 = "#67cbe7"
let s:color15 = "#585858"
let s:color16 = "#ffaf5f"
let s:color17 = "#d7d787"
let s:color18 = "#d7afd7"
let s:color19 = "#ff5f87"
let s:color20 = "#87dfaf"
let s:color21 = "#dfafaf"
let s:colorbg= "#181f21"

set background=dark
if version > 1
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
set t_Co=256
let g:colors_name = "nogto"
""""""""""""""""""""""
" General
"""""""""""""""""""""""
exe "hi Normal cterm=NONE ctermbg=NONE ctermfg=255 gui=NONE guibg="s:colorbg
exe "hi Visual  ctermbg=236  guibg="s:color8
" cursor
exe "hi Cursor  ctermbg=234  guibg="s:color0
hi! link  CursorLineNr Cursor
hi! link  CursorLine Cursor
hi! link  CursorColumn Cursor
" complete
exe "hi Pmenu ctermfg=239 ctermbg=232  guifg="s:color7 "guibg="s:color8
hi! link PmenuSel  Pmenu
hi! link PmenuSbar Pmenu
hi! link PmenuThumb Pmenu
"search
exe "hi Search  ctermbg=17 cterm=NONE  guibg=" s:color0
hi! link IncSearch  Search
"text and line or numbers
exe "hi NonText guifg="s:color0" guibg="s:color0
hi StatusLine  cterm=NONE
hi StatusLineNC cterm=NONE
hi! link  TabLine Pmenu
hi! link  TabLineFill Pmenu
hi! link  TabLineSel Cursor
hi LineNr guibg=bg
exe "hi Todo guifg=" s:color3
exe "hi Macro guifg=" s:color3
"""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""
" constant
exe "hi Constant guifg=" s:color6 "ctermfg=116"
exe "hi String guifg=" s:color12 "ctermfg=110"
exe "hi Comment ctermfg=240 guifg="s:color15
exe "hi Character ctermfg=150 guifg="s:color2
exe "hi Number guifg=" s:color4 "ctermfg=116"
exe "hi Boolean  ctermfg=74 guifg="s:color6
exe "hi Float  ctermfg=221  guifg="s:color11
" identifier
exe "hi Identifier guifg="s:color16 "ctermfg=216 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE"
exe "hi Function  ctermfg=215   guifg="s:color11
"statement
exe "hi Statement ctermfg=167 guifg="s:color9
hi! link  Conditional Statement
exe "hi Repeat ctermfg=186  guifg=" s:color17
hi! link Label  Repeat
exe "hi Operator  ctermfg=117 guifg="s:color14
hi! link Keyword Define
" PreProc
exe "hi Define  ctermfg=140 guifg=" s:color13
exe "hi PreCondit  ctermfg=142  guifg=" s:color3
exe "hi PreProc ctermfg=182  guifg=" s:color18
" type
exe "hi StorageClass  ctermfg=204 guifg=" s:color19 "gui=italic"
exe "hi Structure ctermfg=215 guifg="s:color16
exe "hi Type guifg="s:color20  "ctermfg=115 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE"
" Special
exe "hi Special guifg="s:color21 "ctermfg=181"
exe "hi SpecialComment ctermfg=242  guifg=" s:color15
exe "hi Tag ctermfg=140 guifg=" s:color13
" error
exe "hi Error ctermfg=255  ctermbg=167  guifg=" s:color7  "guibg="s:color1
hi ErrorMsg ctermfg=1 ctermbg=NONE cterm=BOLD guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=3 ctermbg=NONE cterm=BOLD guifg=NONE guibg=NONE gui=NONE
"others
hi foldcolumn guibg=bg
hi VertSplit cterm=NONE  guibg=bg guifg=bg
exe "hi ColorColumn  ctermbg=235  guibg=" s:color8
exe "hi MatchParen ctermfg=0 ctermbg=5  guifg="s:color11
exe "hi Directory ctermfg=68  guifg=" s:color4
exe "hi Folded ctermfg=249 ctermbg=0  guifg="s:color15 "guibg="s:color15
exe "hi FoldColumn  ctermbg=234 ctermfg=249  guibg="s:color15 "guifg="s:color15
exe "hi PMenuSel guifg="s:color3" guibg="s:color3
" Spell Highlightings
exe "hi SpellBad guifg="s:color3
exe "hi SpellCap guifg="s:color3" guibg="s:color3
exe "hi SpellLocal guifg="s:color3
exe "hi SpellRare guifg="s:color3
" Diff Highlightings
exe "hi DiffAdd guifg="s:color3" guibg="s:color3
exe "hi DiffChange guifg="s:color3" guibg="s:color3
exe "hi DiffDelete guifg="s:color3" guibg="s:color3
exe "hi DiffText guifg="s:color3 " guibg="s:color3
" Nvim-Treesitter Highlights
exe "hi TSAttribute guifg="s:color5
exe "hi TSBoolean guifg="s:color6
exe "hi TSCharacter guifg="s:color2
exe "hi TSComment guifg=" s:color15
exe "hi TSConditional guifg="s:color1
exe "hi TSConstant guifg="s:color6
exe "hi TSConstBuiltin guifg="s:color8
exe "hi TSConstMacro guifg="s:color2
exe "hi TSConstructor guifg="s:color0
exe "hi TSException guifg="s:color3
exe "hi TSField guifg="s:color5
exe "hi TSFloat guifg="s:color11
exe "hi TSFunction guifg="s:color11
exe "hi TSFuncBuiltin guifg="s:color19
exe "hi TSFuncMacro guifg="s:color11
exe "hi TSInclude guifg="s:color13
exe "hi TSKeyword guifg="s:color3
exe "hi TSKeywordFunction guifg="s:color3
exe "hi TsKeywordOperator guifg="s:color13
exe "hi TSKeywordReturn guifg="s:color3
exe "hi TSLabel guifg="s:color9
exe "hi TSMethod guifg="s:color10
exe "hi TSNamespace guifg="s:color16
exe "hi TSNumber guifg="s:color4
exe "hi TSParameter guifg="s:color11
exe "hi TSParameterReference guifg="s:color14
exe "hi TSProperty guifg="s:color5
exe "hi TSPunctDelimiter guifg="s:color7
exe "hi TSPunctBracket guifg="s:color8
exe "hi TSPunctSpecial guifg="s:color10
exe "hi TSRepeat guifg=" s:color17
exe "hi TSString guifg="s:color19
exe "hi TSStringRegex guifg=" s:color11
exe "hi TSStringEscape guifg="s:color12
exe "hi TSStringSpecial guifg="s:color18
exe "hi TSSymbol guifg=" s:color20
exe "hi TSTag guifg="s:color12
exe "hi TSTagAttribute guifg="s:color8
exe "hi TSTagDelimiter guifg="s:color2
exe "hi TSText guifg="s:color5
exe "hi TSStrong guifg="s:color3
exe "hi TSEmphasis gui=italic"
exe "hi TSUnderline guifg="s:color3
exe "hi TSStrike guifg="s:color13
exe "hi TSTitle guifg="s:color17
exe "hi TSLiteral guifg="s:color19
exe "hi TSURI guifg="s:color4
exe "hi TSMath guifg="s:color8
exe "hi TSTextReference guifg="s:color11
exe "hi TSEnvirontment guifg="s:color15
exe "hi TSEnvironmentName guifg="s:color17
exe "hi TSNote guifg="s:color18
exe "hi TSWarning guifg="s:color2 "guibg="s:color16
exe "hi TSDanger guifg="s:color8
exe "hi TSType guifg="s:color6
exe "hi TSTypeBuiltin guifg="s:color4
exe "hi TSVariable guifg="s:color9
exe "hi TSVariableBuiltin guifg="s:color20
" NvimTree Highlights
exe "hi NvimTreeFolderIcon guifg="s:color3
exe "hi NvimTreeFoldername guifg="s:color3
exe "hi NvimTreeOpenedFolderName guifg="s:color3
exe "hi NvimTreeEmptyFolderName guifg="s:color3
exe "hi NvimTreeFileDirty guifg="s:color3
exe "hi NvimTreeExecFile guifg="s:color3
exe "hi NvimTreeGitDirty guifg="s:color3
exe "hi NvimTreeGitDeleted guifg="s:color3
exe "hi NvimTreeRootFolder guifg="s:color3
exe "hi NvimTreeIndentMarker guifg="s:color3
