set nocompatible " 关闭 vi 兼容模式
filetype off
"---------Vundle Start---------------------
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
"let Vundle manage Vundle
"required! 
Plugin 'gmarik/Vundle.vim'
"My bundles here:
"original repos on GitHub (来自 github  只要写 作者名/项目名)
" Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"代码补全插件
Plugin 'Shougo/neocomplcache'
" Plugin 'Shougo/neocomplete.vim'
"代码注释插件
Plugin 'scrooloose/nerdcommenter'
"目录文件导航
Plugin 'scrooloose/nerdtree'
"Vim 中文Help Doc
Plugin 'asins/vimcdoc'
"Markdown
Plugin 'plasticboy/vim-markdown'
"VIM 显示增强
Plugin 'bling/vim-airline'
"缩进标识/标尺 
Plugin 'Yggdroot/indentLine'
" 颜色
" Plugin 'tomasr/molokai'
"tabline 很赞的插件
Plugin 'mkitt/tabline.vim'
"session 管理插件
Plugin 'vim-scripts/sessionman.vim'
"标签插件 快速定位插件
Plugin 'vim-scripts/Vim-bookmark'
"taglist 查看代码结构
Plugin 'vim-scripts/taglist.vim'
"窗口控制器
Plugin 'vim-scripts/winmanager'
"bufexplorer 管理 打开的文件列表快速切换
"Plugin 'vim-scripts/bufexplorer'
"c
Plugin 'vim-scripts/c.vim'
"Plugin 'fholgado/minibufexpl.vim'
"snipmate
Plugin 'msanders/snipmate.vim'
" vim-scripts repos (来自vim-scripts 直接写 插件名)
"添加注释信息插件
Plugin 'AuthorInfo'
"php debuger
"Plugin 'vim-scripts/DBGp-client'
"Plugin 'vim-scripts/debugger.py'
Plugin 'joonty/vdebug.git'
"Plugin 'brookhong/DBGPavim'

Plugin 'scrooloose/syntastic' "语法错误自动检测
Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'vim-scripts/MatchTag'
Plugin 'vim-scripts/grep.vim'

Plugin 'vim-scripts/jsbeautify'
Plugin 'vim-scripts/delimitMate.vim'
Plugin 'vim-scripts/surround.vim'
Plugin 'vim-scripts/AutoClose.git'
Plugin 'vim-scripts/HTML-AutoCloseTag.git'
Plugin 'vim-scripts/matchit.zip.git'
"快速注释插件无PHP"
Plugin 'onevcat/VVDocumenter-Xcode'
"记录历史打开过的文件"
Plugin 'yegappan/mru'
"自动补全插件"
" Plugin 'vim-scripts/OmniCppComplete'
" Plugin 'Shougo/neocomplcache'
"php快速注释插件"
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'lilydjwg/colorizer'
"对齐
Plugin 'vim-scripts/Align.git'
" non-GitHub repos (自己的git库插件)
"Plugin 'git://git.wincent.com/command-t.git'
"配色
Plugin 'altercation/vim-colors-solarized'
"vim 显示文档中方法变量类名
Plugin 'majutsushi/tagbar'
"phpxdebug-vim调试器
Plugin 'brookhong/DBGPavim'
" Git repos on your local machine (i.e. when working on your own plugin) 
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'wincent/Command-T'
Plugin 'joonty/vim-phpqa'
Plugin 'Shougo/vimproc.vim'
" Plugin 'm2mdas/phpcomplete-extended'
Plugin 'Shougo/unite.vim'
" Plugin 'ervandew/supertab'
Plugin 'powerline/fonts'
"快速运行工具
Plugin 'thinca/vim-quickrun'
"快速查找工具与快速更新文件工具
Plugin 'rking/ag.vim'
"快速文档内定位跳转"
Plugin 'easymotion/vim-easymotion'
"打标记"
Plugin 'kshenoy/vim-signature'
"tab
Plugin 'ervandew/supertab'
"phpManual
Plugin 'alvan/vim-php-manual'
"phpcomplete
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'ryanoasis/vim-devicons'
"
" Bundle help
"Deprecated Names  | New Names
":Bundle            | Plugin
":BundleInstall(!)  | PluginInstall(!), VundleInstall(!)
":BundleUpdate      | PluginUpdate, VundleUpdate
":BundleSearch(!)   | PluginSearch(!), VundleSearch(!)
":BundleClean       | PluginClean(!), VundleClean(!)
":BundleList        | PluginList
call vundle#end()
"---------Vundle  END---------------------

