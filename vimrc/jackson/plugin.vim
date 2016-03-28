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
hi CursorLine  cterm=underline ctermbg=black ctermfg=none guibg=Grey40 gui=underline guifg=white term=underline
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
let g:airline_theme='light'
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
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : ''
            \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
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
" autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
" " autocmd FileType vimfiler nmap <buffer> f <Plug>(vimfiler_new_file)<Plug>(vimfiler_edit_file)
" autocmd FileType vimfiler nmap <buffer> f <Plug>(vimfiler_new_file)
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
"快速保存与退出自定义映射快捷键
nnoremap <leader>w :w<cr>
nnoremap <leader>wa :wall<cr>
nnoremap <leader>wq :wqa<cr>
nnoremap <leader>vs :vs<cr>
nnoremap <leader>sp :sp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>q :call QuitNotSave()<CR>
map <leader>al :call AlignLine(input("Enter align: "))<CR>
"防止neovim在tmux下的错误
if has('nvim')
    nmap <BS> <C-W>h
endif
"历史纪录
" noremap <leader>h :Unite file_mru -buffer-name=file_mru<CR>
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
" let g:airline_powerline_fonts = 1
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_nerdtree = 0
" let g:webdevicons_enable_unite = 0
" let g:webdevicons_enable_vimfiler = 0
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
" let g:webdevicons_enable_ctrlp = 0
" let g:webdevicons_enable_flagship_statusline = 0
" let g:WebDevIconsUnicodeDecorateFileNodes = 0
"回到上次光标位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
"showfunction
function! Showfunctions()
    execute 'ShowFuncAll' 
    execute 'copen' 
endfunction
nnoremap <Leader>tb :call Showfunctions()<CR>
