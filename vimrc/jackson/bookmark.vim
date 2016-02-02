"bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
nmap <silent>mm <Plug>BookmarkToggle
nmap <silent>mi <Plug>BookmarkAnnotate
nmap <silent>ma <Plug>BookmarkShowAll
nmap <silent>mj <Plug>BookmarkNext
nmap <silent>mk <Plug>BookmarkPrev
nmap <silent>mc <Plug>BookmarkClear
nmap <silent>mx <Plug>BookmarkClearAll
nmap <silent>mk <Plug>BookmarkMoveUp
nmap <silent>mj <Plug>BookmarkMoveDown
