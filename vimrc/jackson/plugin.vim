"
"WMToggle 设置开始
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Ctags_Cmd = "/usr/bin/.ctags"
let g:winManagerWindowLayout='TagList'
nmap tm :WMToggle<cr>
"MRU插件 设置开始
let MRU_Max_Entries = 400
map <leader>h :MRU<CR>
"MRU插件 设置结束
"编码设置
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
language messages zh_CN.UTF-8
" 文件格式，默认 ffs=dos,unix
set fileformat=unix
set fileformats=unix,dos,mac
set ambiwidth=double
"
"交换文件(swap file)存放路径
exe "set directory=".u_swap_path
"
" 持久化撤销设置
if has("persistent_undo")
    set undofile
    set undolevels=1000
    exe "set undodir=".g:u_undo_path
    set undofile
endif
"
" 中文帮助
set helplang=cn
"
" 高亮显示当前行配置开始
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorLine  cterm=underline ctermbg=black ctermfg=none guibg=Grey40 gui=underline guifg=white term=underline
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" 高亮显示当前行配置结束
" 关闭VIM的时候保存会话
set sessionoptions=buffers,sesdir,help,tabpages,winsize
"---------------------------------------------------------------------------
"bufexplorer插件	缓冲区文件打开
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看 \bs 上下方式查看
"---------------------------------------------------------------------------

"--------------------------------------------------------------------------
"NERD_commente (代码注释)插件
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看
",ca在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
",cc注释当前行
",c<space> 切换注释/非注释状态
",cs 以”性感”的方式注释
",cA 在当前行尾添加注释符，并进入Insert模式
",cu 取消注释
",c$ 从光标开始到行尾注释
",cc:光标以下count行添加注释(2,cc) 
",cu:光标以下count行取消注释(2,cu)
",cm:光标以下count行添加块注释(2,cm)
"Normal模式下，几乎所有命令前面都可以指定行数
"Visual模式下执行命令，会对选中的特定区块进行注释/反注释
"---------------------------------------------------------------------------

nnoremap <S-F1> :set filetype=xhtml<return>
nnoremap <S-F2> :set filetype=css<return>
nnoremap <S-F3> :set filetype=javascript<return>
nnoremap <S-F4> :set filetype=php<return>
nnoremap <S-F5> :set filetype=python<return>
"按o不进入编辑模式并且插入一行"
nmap <silent> bo :call append('.', '')<CR>j
nmap <silent> bO :call append(line('.')-1, '')<CR>k
"去除文件中^M这个符号
nnoremap <S-F6> :e ++ff=dos<return>
"去除搜索高亮显示
nmap <Leader>nh :nohl<return>
"快速打开新窗口
nmap <Leader>tn :tabnew<return>

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set autoindent smartindent tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"autocmd FileType python map <F5> :!python %<CR>

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

noremap <leader>sm :call SetComment()<return>
"/* 加入注释 */
func SetComment()
    normal o
    call setline(line("."),"    /*") 
    call append(line("."), "     * @Func:")
    call append(line(".")+1, "     * @Author:".g:u_name)
    call append(line(".")+2, "     * @Crate Time:".strftime("%Y-%m-%d %H:%M")) 
    call append(line(".")+3, "     * @Last modified:".strftime("%Y-%m-%d %H:%M")) 
    call append(line(".")+4, "     * @Description:") 
    call append(line(".")+5, "     * @Return:")
    call append(line(".")+6, "     */") 
endfunc
"echo php print_r debug
noremap <leader>pr :call EchoPrintR()<return>
"print_r function
func EchoPrintR()
    normal o
    call setline('.', "echo '<pre>';")
    let firstLn = line('.')
    normal o
    call setline('.', 'print_r();')
    let gotoLn = line('.')
    normal o
    call setline('.', "echo '</pre>';")
    normal o
    call setline('.', 'exit();')
    exe 'normal '.firstLn.'G'
    exe 'normal 4V='
    exe 'normal '.gotoLn.'G'
    exe "normal /)\<CR>"
    startinsert
endfunc
imap <C-T> <pre><CR>print_r()<C-O>mz;<CR></pre><C-O>`z 
"CtrlP插件	查找并打开文件
nnoremap <leader>tp :CtrlP<return> "文件搜索模式打开
nnoremap <leader>tb :CtrlPBuffer<return> "用缓冲区搜索模式打开CtrlP
nnoremap <Leader>tm :CtrlPMRU<return> "用最近最多使用模式打开CtrlP
nnoremap <Leader>td :CtrlPBookmarkDir<return> "书签标记的工作目录
nnoremap <Leader>ta :CtrlPBookmarkDirAdd<return> "添加标记书签工作目录 <F5>刷新 <F7>清除
"使用方式	ctrl+t	新窗口打开查找的文件
"Nerdtree 目录导航插件配置开始
noremap <leader>nt :NERDTreeToggle<CR>:NERDTreeMirror<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
"Nerdtree 目录导航插件配置结束
"
"sessionman 配置开始
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>
"sessionman 配置结束
"
"indentline 缩进标识 配置开始 
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_char = '︙'
nnoremap <leader>ig :IndentLinesToggle<CR>:set list! lcs=tab:\\|\<Space><CR>
"indentline 缩进标识 配置结束 
"
"vim-powerline 配置开始
set t_Co=256
" let g:Powerline_symbols = 'fancy'
"vim-powerline 配置结束
"
"添加注释信息插件 配置开始
let g:vimrc_author= g:u_name 
let g:vimrc_email= g:u_email 
let g:vimrc_homepage='' 
nmap <leader>ai :AuthorInfoDetect<cr>
"添加注释信息插件 配置结束
"
"bufexplorer 配置开始
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
"bufexplorer 配置结束
"
"Markdown 配置开始
"禁用折叠
"let g:vim_markdown_folding_disabled = 1
"Markdown 配置结束
"
"手工折叠代码
nmap <leader>fd :set fdm=manual<return>
"每次保存自动生成 tag
"autocmd BufWritePost * call system("ctags -R")

function! GenerateCtags()
    exe "cd " . Find_project_root()
    if &filetype == 'c' || &filetype == 'cpp'
        call system('ctags -R --c++-types=+p --fields=+iaS --extra=+q .')
    elseif &filetype == "verilog"
        call system ('ctags --language-force=verilog -R .')
    else
        echohl  ErrorMsg | echo "Generate tags fail!" | echohl None
    endif
    exe 'set tags+=' . Find_project_root() .'/tags'
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look up project root directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:project_root_marker')
    let g:project_root_marker = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
endif

function! Find_project_root()
    let project_root = fnamemodify(".", ":p:h")

    if !empty(g:project_root_marker)
        let root_found = 0
        let candidate = fnamemodify(project_root, ":p:h")
        let last_candidate = ""

        while candidate != last_candidate
            for tags_dir in g:project_root_marker
                let tags_dir_path = candidate . "/" . tags_dir
                if filereadable(tags_dir_path) || isdirectory(tags_dir_path)
                    let root_found = 1
                    break
                endif
            endfor

            if root_found
                let project_root = candidate
                break
            endif

            let last_candidate = candidate
            let candidate = fnamemodify(candidate, ":p:h:h")
        endwhile

        return root_found ? project_root : fnamemodify(".", ":p:h")
    endif

    return project_root
endfunction
let g:miniBufExplMapWindowNavVim = 1
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>
"let g:bufExplorerMaxHeight = 20
"let g:miniBufExplForceSyntaxEnable = 1  
set laststatus=2 "show the status line
set statusline=%-10.3n  "buffer number

map <silent> <leader>1 :diffget 1<CR> :diffupdate<CR>
map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerMoreThanOne=0
"php和python调试快捷键
au FileType php map <leader>cli :call DebugRun('php')<cr>
au FileType php imap <leader>cli <Esc>:call DebugRun('php')<cr>
" au FileType python map <leader> :call DebugRun('python')<cr>
" au FileType python imap <leader> <Esc>:call DebugRun('python')<cr>
function DebugRun(cmd)
    :w
    execute '!' . a:cmd . ' %'
endfunction
"自动提示插件"
filetype plugin indent on 
set completeopt=longest,menu 
"vim-scripts/PDV--phpDocumentor-for-Vim PHP注释插件
inoremap <leader>doc <ESC>:call PhpDocSingle()<CR>i 
nnoremap <leader>doc :call PhpDocSingle()<CR> 
vnoremap <leader>doc :call PhpDocRange()<CR> 
" " 用浅色高亮当前行（只在插入模式下显示，不在普通模式显示，在SecurCRT中是以横线显示）
set cursorcolumn
" autocmd InsertLeave * se nocul
" autocmd InsertEnter * se cul
" autocmd InsertEnter * set cursorcolumn
" autocmd InsertLeave * set cursorcolumn
" TagbarToggle 显示函数列表插件
nmap <Leader>tb :TagbarToggle<CR>
" PHPXdebug调试器
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0
nmap <Leader>d :Bp<return>
"phpqa
" let g:phpqa_messdetector_autorun = 0
" let g:phpqa_codesniffer_autorun = 0
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 1
"状态栏增强"
" let g:airline_theme='light'
" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=0  " buffers at the top as tabs
let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'light'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''

let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" tmuxline config
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'b': '#F',
        \ 'c': '#W',
        \ 'win': ['#I', '#W'],
        \ 'cwin': ['#I', '#W'],
        \ 'x': '#h',
        \ 'y': '%b %d',
        \ 'z': '%R'}
" quickrun
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
            \       "runner/vimproc/updatetime" : 10,
            \       "outputter/buffer/close_on_empty" : 1,
            \ }

" Unite

let g:unite_source_history_yank_enable = 1
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>bw :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>s :<C-u>Unite -buffer-name=grep grep<cr>

" Ignore
call unite#custom#source('file_rec/async,file', 'ignore_pattern', 'bower_components\|dist\|fonts\|node_modules\|maps\|\.png$\|\.jpg$\|\.svg$\|\.gif$')

" Configure Ag and use it instead of grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
            \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ag_working_path_mode="r"
"跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map \h <Plug>(easymotion-linebackward)
map \j <Plug>(easymotion-j)
map \k <Plug>(easymotion-k)
map \l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
"gotags
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
"自动补全
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
            " \ 'default' : ''
            " \ }

" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
    " return neocomplcache#smart_close_popup() . "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" " For cursor moving in insert mode(Not recommended)
" "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" " Or set this.
" "let g:neocomplcache_enable_cursor_hold_i = 1
" " Or set this.
" "let g:neocomplcache_enable_insert_char_pre = 1

" " AutoComplPop like behavior.
" "let g:neocomplcache_enable_auto_select = 1

" " Shell like behavior(not recommended).
" "set completeopt+=longest
" "let g:neocomplcache_enable_auto_select = 1
" "let g:neocomplcache_disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" " Enable heavy omni completion.
" if !exists('g:neocomplcache_force_omni_patterns')
  " let g:neocomplcache_force_omni_patterns = {}
" endif
" " let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" " let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" " let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"phpmanualphp手册
let g:php_manual_online_search_shortcut = '<leader>b'
"ranger
" Compatible with ranger 1.4.2 through 1.6.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RagerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
" Put at the very end of your .vimrc file.
"php语法高亮
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
"vimfiler目录
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_tree_leaf_icon = " "
" let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_file_icon = '-'
" let g:vimfiler_marked_file_icon = '✓'
" let g:vimfiler_readonly_file_icon = '✗'
" let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
" let g:vimfiler_expand_jump_to_first_child = 0
" " let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'
" let g:vimfiler_ignore_pattern = '\.pyc\|\~$\|\.swo$\|\.swp$\|\.git\|\.hg\|\.svn\|\.bzr'
" let g:vimfiler_enable_auto_cd = 1
" let g:vimfiler_quick_look_command = 'gloobus-preview'
" nnoremap <Leader>nt :<C-u>VimFilerExplorer -split -simple -parent -winwidth=45 -toggle -no-quit -auto-cd<CR>
" nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=45 -no-quit -find<CR>
" autocmd FileType vimfiler nunmap <buffer> x
" autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
" autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
" autocmd FileType vimfiler nunmap <buffer> l
" autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
" autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
" autocmd FileType vimfiler nunmap <buffer> <C-l>
" autocmd FileType vimfiler nunmap <buffer> v
" autocmd FileType vimfiler nmap <buffer> <C-R>  <Plug>(vimfiler_redraw_screen)
" " autocmd FileType vimfiler nmap <buffer> f <Plug>(vimfiler_new_file)<Plug>(vimfiler_edit_file)
" autocmd FileType vimfiler nmap <buffer> f <Plug>(vimfiler_new_file)
" autocmd FileType vimfiler nmap <buffer> e <Plug>(vimfiler_edit_file)
" autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
" \ "\<Plug>(vimfiler_expand_tree)",
" \ "\<Plug>(vimfiler_edit_file)")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

function! SaveIfModified()
    if &modified
        :w
    endif
endfunction

" key mapping for error navigation
nnoremap <leader>w :call SaveIfModified()<CR>  
nnoremap <leader>W :call SaveIfModified()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy paste system clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>P "*P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quit help easily
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! QuitWithQ()
    if &buftype == 'help'
        nnoremap <buffer> <silent> q :q<cr>
    endif
endfunction
autocmd FileType help exe QuitWithQ()
" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

"退出不保存
function! QuitNotSave()
    if !unite#util#input_yesno('confirm quit but it not save file?')
        echo 'Canceled.'
        return
    else
        echo 'Doing quit!!!'
        :qa
        echo 'Done!!!'
    endif
endfunction
"自动对齐
function AlignLine(align, ...)
    if a:align != ''
        let alignLine = a:align
        execute 'Align' alignLine 
    endif
endfunction
"保存针对不同文件做检查
function! SaveIfCall()
    if &filetype == 'python'
        execute 'PymodeLint'
        :w
        if !unite#util#input_yesno('confirm you need autopythonmodelintauto file help?')
            echo 'Canceled.'
            return
        else
            execute 'PymodeLintAuto'
            execute 'normal zz'
            :w
        endif
    elseif &filetype == 'php'
        :w
        call PhpCsFixerFixFile()
    else
        :w
    endif
endfunction
function! Choosez(z, ...)
    if a:z != ''
        let zlign = a:z
        execute 'normal' zlign
    endif
endfunction
"快速保存与退出自定义映射快捷键
nnoremap <leader>w :call SaveIfCall()<cr>
nnoremap <leader>wa :wall<cr>
nnoremap <leader>wq :wqa<cr>
nnoremap <leader>vs :vs<cr>
nnoremap <leader>sp :sp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>q :call QuitNotSave()<CR>
map <leader>al :call AlignLine(input("Enter align: "))<CR>
nnoremap <leader>z :call Choosez(input("Enter zt or zz or zb: "))<CR>  
"防止neovim在tmux下的错误
if has('nvim')
    nmap <BS> <C-W>h
endif
"历史纪录
" noremap <leader>hs :Unite file_mru -buffer-name=file_mru<CR>
"快速移动标签
function TabQuickMove(tabLabel, ...)
    let bufferTab = a:tabLabel
    execute 'buffer' bufferTab
endfunction
nnoremap <silent>  tt  :call TabQuickMove(input("Enter tabLabel: "))<CR>
set viewoptions=cursor,folds,slash,unix
"cscope
let g:cscope_open_location = 1
let g:cscope_auto_update = 1
let g:cscope_silent = 1
let g:cscope_split_threshold = 9999
"junkfile
let g:junkfile#directory = '~/.memo'
nnoremap <silent> ,e  :<C-u>Unite junkfile/new junkfile -start-insert<CR>
nnoremap <silent> ,l  :<C-u>Unite junkfile<CR>
nnoremap <silent> ,ju  :jumps<CR>
"webdevicons图标
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 0
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 0
let g:webdevicons_enable_flagship_statusline = 0
let g:WebDevIconsUnicodeDecorateFileNodes = 0
"回到上次光标位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\" norm zz")|else|exe "norm $ norm zz"|endif|endif 
"showfunction
function! Showfunctions()
    execute 'ShowFuncAll' 
    execute 'copen' 
endfunction
nnoremap <Leader>tb :call Showfunctions()<CR>
"vim-rest
let b:vrc_header_content_type = 'application/json; charset=utf-8'
let g:vrc_trigger = '<Leader>rs'
let g:vrc_auto_format_uhex = 1
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
setlocal complete+=t
setlocal formatoptions-=t
if v:version > 702 && !&relativenumber
    setlocal number
endif
setlocal nowrap
setlocal textwidth=79
setlocal commentstring=#%s
setlocal define=^\s*\\(def\\\\|class\\)
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 0
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_rope_ropefolder='.ropeproject'
let g:pymode_rope_completion_bind = '<C-X><C-O>'

let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END
" add jackson
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
" nnoremap / /\v
" vnoremap / /\v
" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> gd gdzz
" Last and next jump should center too.
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#
" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" select all
map <Leader>sa ggVG
" select block
nnoremap <leader>v V`}
"php-cs
" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 1                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

"delete spaces at end of line
autocmd BufWritePre !*.xml silent! %s/[\r \t]\+$//
" retab to replace tab by space when you write
autocmd BufWritePre *.php :set et|retab

autocmd BufNewFile,BufRead *.twig set filetype=twig
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
"deoplete"
set completeopt+=noinsert,noselect
set completeopt-=preview
let g:deoplete#enable_at_startup = 1

hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41

"php"
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.php =
\ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:deoplete#auto_completion_start_length = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = []

"go"
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '/path/to/data_dir'
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
"python"
set omnifunc=jedi#completions
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#force_py_version = 3
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
let g:jedi#max_doc_height = 100
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
