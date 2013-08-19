"使用pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"显示行号
set nu
"显示列号
set ruler
"显示tab和空格
:set listchars=tab:>-,trail:-
:set list

"语法高亮
syntax on

"颜色方案
if has ('gui_running')
  colorscheme desert
else
  colorscheme evening
endif

"打开文件类型检测
filetype on
filetype plugin on
filetype indent on

"设置编码
set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"设置文件行尾格式
set fileformat=unix

"默认的缩进
set sw=2
set expandtab
set tabstop=2
set softtabstop=2

"设置退格键在插入模式下均有效
set backspace=indent,eol,start
"设置状态栏
set statusline=%F\ [BUFN=%n]\ [FENC=%{&fenc}]\ [FT=%{&ft}]\ [FF=%{&ff}]\ [LINE=%l]\ [COL=%c]\ [LPERC=%p]
set laststatus=2

"clang_complete设置
let g:clang_auto_user_options="path, .clang_complete, compile_commands.json"
