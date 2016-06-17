" "颜色高亮配置
let g:landscape_highlight_full_space=1
highlight Normal gui=none guifg=#dddddd guibg=grey0
highlight Macro term=none ctermfg=36 gui=none guifg=#00af87
highlight Debug term=none ctermfg=183 gui=none guifg=violet

highlight TabLine ctermfg=253 ctermbg=241 guifg=#dadada guibg=#606060
highlight TabLineFill ctermfg=253 ctermbg=241 guifg=#dadada guibg=#606060
highlight TabLineSel cterm=bold ctermfg=253 guifg=#dadada
highlight default link VisualNOS Visual
highlight Error term=none ctermfg=15 ctermbg=124 gui=none guifg=#ffffff guibg=#af0000
highlight WarningMsg term=none ctermfg=7 ctermbg=0 gui=none guifg=#c0c0c0 guibg=#000000
highlight DiffAdd term=none cterm=none ctermfg=none ctermbg=22 guifg=fg guibg=#005f00
highlight DiffChange term=none cterm=none ctermfg=none ctermbg=52 guifg=fg guibg=#5f0000
highlight DiffDelete term=none cterm=none ctermfg=none ctermbg=88 guifg=fg guibg=#870000
highlight DiffText term=none cterm=none ctermfg=none ctermbg=160 guifg=fg guibg=#df0000
highlight DiffFile term=none cterm=none ctermfg=47 ctermbg=none guifg=#00ff5f guibg=bg
highlight DiffNewFile term=none cterm=none ctermfg=199 ctermbg=none guifg=#ff00af guibg=bg
highlight default link DiffRemoved DiffDelete
highlight DiffLine term=none cterm=none ctermfg=129 ctermbg=none guifg=#af00ff guibg=bg
highlight default link DiffAdded DiffAdd
highlight default link ErrorMsg Error
highlight default link FullSpace Error
if version >= 700
  if get(g:, 'landscape_cursorline', 1)
    highlight CursorLine term=none cterm=none ctermbg=235 gui=none guibg=#262626
    highlight CursorLineNr term=underline cterm=bold ctermfg=148 ctermbg=235 gui=bold guifg=#afdf00 guibg=#262626
  else
    highlight clear CursorLine
    highlight CursorLineNr term=NONE ctermbg=NONE guibg=NONE
  endif
  highlight ColorColumn term=none cterm=none ctermbg=239 gui=none guibg=#4e4e4e
  highlight Cursor term=reverse cterm=reverse gui=reverse guifg=NONE guibg=NONE
  highlight CursorColumn term=none cterm=none ctermbg=235 gui=none guibg=#262626
  highlight LineNr term=none ctermfg=58 ctermbg=none guifg=#5f5f00 guibg=bg
  highlight MatchParen ctermfg=none ctermbg=238 guibg=#4e4e4e
  highlight Pmenu ctermfg=233 ctermbg=249 gui=none guifg=#121212 guibg=#b2b2b2
  highlight PmenuSel ctermfg=233 ctermbg=242 gui=none guifg=#121212 guibg=#666666
  highlight PmenuSbar ctermfg=233 ctermbg=244 gui=none guifg=#121212 guibg=#808080
  highlight PmenuThumb ctermfg=233 ctermbg=239 gui=none guifg=#121212 guibg=#4e4e4e
endif
highlight Search cterm=reverse ctermfg=220 ctermbg=234 gui=reverse guifg=#ffdf00 guibg=#1c1c1c
highlight IncSearch cterm=reverse ctermfg=136 ctermbg=236 gui=reverse guifg=#af8700 guibg=#303030

highlight default link vimCmplxRepeat Normal

" for vimshell, vimfiler, unite.vim
highlight default link Command Function
highlight default link GitCommand Constant
highlight default link Arguments Type
highlight default link PdfHtml Function
highlight default link Archive Special
highlight default link Image Type
highlight default link Multimedia SpecialComment
highlight default link System Comment
highlight default link Text Constant
highlight default link Link Constant
highlight default link Exe Statement
highlight default link Prompt PreCondit
highlight default link Icon LineNr
highlight Time ctermfg=141 ctermbg=none gui=none guifg=#af87ff
highlight Date ctermfg=140 ctermbg=none gui=none guifg=#af87df
highlight default link DateToday Special
highlight default link DateWeek Identifier
highlight default link DateOld Comment
highlight default link Path Preproc
highlight default link Marked StorageClass
highlight default link Title Identifier

" Color definitions.
let s:G_Mono1='#ABB2BF' " Default Text
let s:G_Mono2='#828997'
let s:G_Mono3='#5C6370'
let s:G_Hue1='#56B6C2'  " Cyan
let s:G_Hue2='#61AFEF'  " Blue
let s:G_Hue3='#C678DD'  " Purple
let s:G_Hue4='#98C379'  " Green
let s:G_Hue5='#E06C75'  " Red 1
let s:G_Hue52='#BE5046' " Red 2
let s:G_Hue6='#D19A66'  " Orange 1
let s:G_Hue62='#E5C07B' " Orange 2
let s:G_SyntaxFG=s:G_Mono1
let s:G_SyntaxBG='#282C34'
let s:G_SyntaxGutter='#636D83'
let s:G_SyntaxGuide='#3B3F48'
let s:G_SyntaxAccent='#528BFF'

if &t_Co == 256
	let s:T_Mono1='249'
	let s:T_Mono2='245'
	let s:T_Mono3='241'
	let s:T_Hue1='73'
	let s:T_Hue2='75'
	let s:T_Hue3='170'
	let s:T_Hue4='150'
	let s:T_Hue5='167'
	let s:T_Hue52='131'
	let s:T_Hue6='180'
	let s:T_Hue62='179'
	let s:T_SyntaxFG=s:T_Mono1
	let s:T_SyntaxBG='236'
	let s:T_SyntaxGutter='60'
	let s:T_SyntaxGuide='237'
	let s:T_SyntaxAccent='69'
else
	let s:T_Mono1='Gray'
	let s:T_Mono2='DarkGray'
	let s:T_Mono3='DarkGray'
	let s:T_Hue1='Cyan'
	let s:T_Hue2='Blue'
	let s:T_Hue3='Magenta'
	let s:T_Hue4='Green'
	let s:T_Hue5='Red'
	let s:T_Hue52='DarkRed'
	let s:T_Hue6='Yellow'
	let s:T_Hue62='DarkYellow'
	let s:T_SyntaxFG=s:T_Mono1
	let s:T_SyntaxBG='Black'
	let s:T_SyntaxGutter='DarkGray'
	let s:T_SyntaxGuide='DarkGray'
	let s:T_SyntaxAccent='DarkGray'
endif

" PHP
exe 'hi phpClass ctermfg='.s:T_Hue62.' guifg='.s:G_Hue62
exe 'hi phpClassExtends ctermfg='.s:T_Hue4.' guifg='.s:G_Hue4
exe 'hi phpFunction ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2
exe 'hi phpMethodsVar ctermfg='.s:T_Hue6.' guifg='.s:G_Hue6
exe 'hi phpParent ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpStaticClasses ctermfg='.s:T_Hue62.' guifg='.s:G_Hue62
exe 'hi phpComparison ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpMemberSelector ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpOperator ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpFunctions ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi phpRelation ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpVarSelector ctermfg='.s:T_Hue5.' guifg='.s:G_Hue5

