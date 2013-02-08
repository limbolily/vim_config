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
colorscheme evening

"制表符宽度
set tabstop=4

"空格代替tab的宽度
set softtabstop=4

"打开文件类型检测
filetype on
filetype plugin on
filetype indent on

"设置编码
set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
