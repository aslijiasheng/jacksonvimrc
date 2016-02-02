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
