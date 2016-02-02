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
" colorscheme vividchalk
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
