set nocompatible " 关闭 vi 兼容模式
filetype off
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
"let Vundle manage Vundle
"required! 
NeoBundle 'gmarik/Vundle.vim'
"My bundles here:
"original repos on GitHub (来自 github  只要写 作者名/项目名)
" NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
"代码补全插件
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neocomplete.vim'
"代码注释插件
NeoBundle 'scrooloose/nerdcommenter'
"目录文件导航
NeoBundle 'scrooloose/nerdtree'
"Vim 中文Help Doc
NeoBundle 'asins/vimcdoc'
"Markdown
NeoBundle 'plasticboy/vim-markdown'
"VIM 显示增强
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
"缩进标识/标尺 
NeoBundle 'Yggdroot/indentLine'
" 颜色
NeoBundle 'tomasr/molokai'
"tabline 很赞的插件
NeoBundle 'mkitt/tabline.vim'
"session 管理插件
NeoBundle 'vim-scripts/sessionman.vim'
"标签插件 快速定位插件
" NeoBundle 'vim-scripts/Vim-bookmark'
NeoBundle 'MattesGroeger/vim-bookmarks'
"选择模式下分屏
NeoBundle 'wellle/visual-split.vim'
"taglist 查看代码结构
NeoBundle 'vim-scripts/taglist.vim'
"窗口控制器
NeoBundle 'vim-scripts/winmanager'
"bufexplorer 管理 打开的文件列表快速切换
"NeoBundle 'vim-scripts/bufexplorer'
"c
NeoBundle 'vim-scripts/c.vim'
"NeoBundle 'fholgado/minibufexpl.vim'
"snipmate
NeoBundle 'msanders/snipmate.vim'
" vim-scripts repos (来自vim-scripts 直接写 插件名)
"添加注释信息插件
NeoBundle 'AuthorInfo'
"php debuger
"NeoBundle 'vim-scripts/DBGp-client'
"NeoBundle 'vim-scripts/debugger.py'
NeoBundle 'joonty/vdebug.git'
"NeoBundle 'brookhong/DBGPavim'

NeoBundle 'scrooloose/syntastic' "语法错误自动检测
NeoBundle 'vim-scripts/minibufexpl.vim'
NeoBundle 'vim-scripts/MatchTag'
NeoBundle 'vim-scripts/grep.vim'

NeoBundle 'vim-scripts/jsbeautify'
NeoBundle 'vim-scripts/delimitMate.vim'
NeoBundle 'vim-scripts/surround.vim'
NeoBundle 'vim-scripts/AutoClose.git'
NeoBundle 'vim-scripts/HTML-AutoCloseTag.git'
NeoBundle 'vim-scripts/matchit.zip.git'
"快速注释插件无PHP"
NeoBundle 'onevcat/VVDocumenter-Xcode'
"记录历史打开过的文件"
NeoBundle 'yegappan/mru'
"自动补全插件"
" NeoBundle 'vim-scripts/OmniCppComplete'
" NeoBundle 'Shougo/neocomplcache'
"php快速注释插件"
NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
NeoBundle 'lilydjwg/colorizer'
"对齐
NeoBundle 'vim-scripts/Align.git'
" non-GitHub repos (自己的git库插件)
"配色
NeoBundle 'altercation/vim-colors-solarized'
"vim 显示文档中方法变量类名
NeoBundle 'majutsushi/tagbar'
"phpxdebug-vim调试器
NeoBundle 'brookhong/DBGPavim'
" Git repos on your local machine (i.e. when working on your own plugin) 
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'fatih/vim-go'
NeoBundle 'wincent/Command-T'
NeoBundle 'joonty/vim-phpqa'
NeoBundle 'Shougo/vimproc.vim'
" NeoBundle 'm2mdas/phpcomplete-extended'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'powerline/fonts'
"快速运行工具
NeoBundle 'thinca/vim-quickrun'
"快速查找工具与快速更新文件工具
NeoBundle 'rking/ag.vim'
"快速文档内定位跳转"
NeoBundle 'easymotion/vim-easymotion'
"打标记"
NeoBundle 'kshenoy/vim-signature'
"tab
NeoBundle 'ervandew/supertab'
"phpManual
NeoBundle 'alvan/vim-php-manual'
"phpcomplete
NeoBundle 'shawncplus/phpcomplete.vim'
"php语法高亮
NeoBundle 'StanAngeloff/php.vim'
"强大的文件浏览器
NeoBundle 'Shougo/vimfiler.vim'
"vim异步插件
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
"历史
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'tpope/vim-dispatch'
"主题
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'ahawkins/vim-candy'
"创建备忘录插件
NeoBundle 'Shougo/junkfile.vim'
"showfunctionall
NeoBundle 'mtglsk/showfunc'
NeoBundle 'Yggdroot/vim-mark'
NeoBundle 'diepm/vim-rest-console'
"debug vim plugin"
NeoBundle 'albfan/vim-breakpts'
NeoBundle 'vim-scripts/genutils'
"python plugin
NeoBundle 'klen/python-mode'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'carlitux/deoplete-ternjs', { 'build': { 'mac': 'npm install -g tern', 'unix': 'npm install -g tern' }}
NeoBundle 'zchee/deoplete-jedi'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
" NeoBundle 'ryanoasis/vim-devicons'
" NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'AlexMax/.vim'
" NeoBundle 'roxma/SimpleAutoComplPop'
NeoBundle 'aceofall/gtags.vim'
NeoBundle 'sjl/gundo.vim'
" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'digitaltoad/vim-pug'
" Required:
call neobundle#end()

" Required:
