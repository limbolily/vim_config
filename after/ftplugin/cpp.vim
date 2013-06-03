"设定缩进
set cindent
set sw=2

"使用空格代替tab
set expandtab
set softtabstop=2

"启用vimgdb
ru macros/gdb_mappings.vim

"doxygen说明注释
inoremap /** /**<CR><CR><Backspace>/<Esc>ka<Space><Space>

"缩进选项
set cinoptions=:0,Ls,g0,t0,cs,Cs,(0,Ws

"若光标所在位置到行尾都是空字符，则返回第一个参数，否则返回第二个参数
:function! NonNullEndSelect(arg1, arg2)
:  let pos = match(getline("."),'\S\s*$',col(".")-1)
:  if pos < 0
:    let ret = a:arg1
:  else
:    let ret = a:arg2
:  endif
:  return ret
:endfunction

"若光标所在行都是空字符，则返回第一个参数，否则返回第二个参数
:function! NullBeginSelect(arg1, arg2)
:  let pos = match(getline("."), '\S')
:  if pos < 0
:    let ret = a:arg1
:  else 
:    let ret = a:arg2
:  endif
:  return ret
:endfunction

"映射{，如果光标所在行都是空字符则映射为{<CR>}
"如果光标所在位置到行尾都是空字符则映射为{},否则映射为{
:inoremap <expr> { NullBeginSelect('{<CR>}<Esc>O', NonNullEndSelect('{}<Esc>i','{'))
