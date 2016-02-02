set nocompatible              " be iMproved, required
filetype off                  " required

"NeoBundle Scripts-----------------------------
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    "Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"set rtp+=~/.vim/bundle/vundle/
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#rc()
"
" let Vundle manage Vundle
" " required! 
" Bundle 'gmarik/vundle'
"
" " 可以通过以下四种方式指定插件的来源
" " a"
" 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
" Bundle 'L9'
"
" “ b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
"
" " c" 指定非Github的Git仓库的插件，需要使用git地址
" Bundle 'git://git.wincent.com/command-t.git'
"
" " d) 指定本地Git仓库中的插件
" Bundle 'file:///Users/gmarik/path/to/plugin'
"
" filetype plugin indent on     required!
source ~/.vim/neoplugins.vim
"导入外部vim文件
source ~/.vim/jackson/normal.vim
source ~/.vim/jackson/plugin.vim
source ~/.vim/jackson/highlight.vim
source ~/.vim/jackson/bookmark.vim
source ~/.vim/jackson/cscope_maps.vim
