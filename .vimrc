set nocompatible              " be iMproved
filetype off                  " required!

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
"
" let Vundle manage Vundle
" " required! 
" Bundle 'gmarik/vundle'
"
" " 可以通过以下四种方式指定插件的来源
" " a)
" 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
" Bundle 'L9'
"
" “ b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
"
" " c) 指定非Github的Git仓库的插件，需要使用git地址
" Bundle 'git://git.wincent.com/command-t.git'
"
" " d) 指定本地Git仓库中的插件
" Bundle 'file:///Users/gmarik/path/to/plugin'
"
" filetype plugin indent on     " required!
" source ~/.vim/plugins.vim
source ~/.vim/neoplugins.vim
"=============用户自定义变量=====================
let g:u_name = 'sky' "user name
let g:u_email = 'aslijiasheng@gmail.com' "email
let u_path = '~/.tmp' "vim tmp 目录
let u_swap_path=u_path.'/vim/swap' "vim swap 交换文件存放目录
let g:u_undo_path=u_path.'/vim/undo' "vim undo (撤销操作 文件保存路径) 
"================用户自定义变量结束===================
filetype plugin indent on " 开启插件
syntax on " 自动语法高亮
let mapleader = ","
nnoremap \ ,
syntax enable
" set background=dark
set background=dark
" let g:solarized_termcolors=256
colorscheme solarized
" colorscheme molokai "设定配色方案
"set cuc " 设置标尺来显示代码对齐
"set list " 显示行尾换行符号
"set cc=80
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set autoindent "自动缩进
set autoread " 设置当文件被改动时自动载入
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set expandtab "空格代替 Tab
set tabstop=4 " 设定 tab 长度为 4
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set nobackup " 覆盖文件时不备份
set tags=tags; " tags 插件
"set autochdir " 改变vim tgas 的当前目录
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在采用的模式有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set guioptions-=l
set guioptions-=r
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 总是显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\  " 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
set foldlevel=3 " 设置折叠层数为
set history=1000
set clipboard+=unnamed
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
" noremap <leader>nt :NERDTreeToggle<CR>:NERDTreeMirror<CR>
" let NERDTreeShowBookmarks=1
" let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
" let NERDTreeMouseMode=2
" let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1
" let g:nerdtree_tabs_open_on_gui_startup=0
"Nerdtree 目录导航插件配置结束
"
"sessionman 配置开始
"set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
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
"let g:Powerline_symbols = 'fancy'
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
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
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
map ,j <Plug>(easymotion-j)
map ,k <Plug>(easymotion-k)
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
"webdevicons图标
set laststatus=2
set showtabline=2
set guioptions-=e
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_unite = 0
let g:webdevicons_enable_vimfiler = 0
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 0
let g:webdevicons_enable_flagship_statusline = 0
let g:WebDevIconsUnicodeDecorateFileNodes = 0
"vimfiler目录
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
" let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'
let g:vimfiler_ignore_pattern = '\.pyc\|\~$\|\.swo$\|\.swp$\|\.git\|\.hg\|\.svn\|\.bzr'
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_quick_look_command = 'gloobus-preview'
nnoremap <Leader>nt :<C-u>VimFilerExplorer -split -simple -parent -winwidth=45 -toggle -no-quit -auto-cd<CR>
nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=45 -no-quit -find<CR>
autocmd FileType vimfiler nunmap <buffer> x
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <buffer> f <Plug>(vimfiler_new_file)<Plug>(vimfiler_edit_file)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")
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
nnoremap <leader>[ :call SaveIfModified()<CR>  
nnoremap <leader>] :call SaveIfModified()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy paste system clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>y "*y
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
map <silent>  tt  :call TabQuickMove(input("Enter tabLabel: "))<CR>
"颜色高亮配置
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
