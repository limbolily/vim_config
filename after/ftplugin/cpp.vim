function! s:SetOptions()
  set cindent
  set cinoptions=:0,Ls,g0,t0,cs,Cs,(0,Ws
  if line('$') == 1 && getline(1) == ''
    set bomb
  endif
endfunction

"return arg1 if all null characters from cursor to the end of line
function! NonNullEndSelect(arg1, arg2)
  let pos = match(getline("."),'\S\s*$',col(".")-1)
  if pos < 0
    let ret = a:arg1
  else
    let ret = a:arg2
  endif
  return ret
endfunction

"return arg1 if all null characters with in the current line.
function! NullBeginSelect(arg1, arg2)
  let pos = match(getline("."), '\S')
  if pos < 0
    let ret = a:arg1
  else
    let ret = a:arg2
  endif
  return ret
endfunction

let s:tag_list_buffer_name = "__Tag_List__"
function! s:InitializeTagList()
  if (bufnr(s:tag_list_buffer_name) == -1)
    TlistToggle
    execute bufwinnr(s:tag_list_buffer_name) . "wincmd w"
    setlocal bufhidden=hide
    quit
  endif
endfunction

function! s:KeyMaps()
  execute "nnoremap <Leader>tl :call windows#ShowInNavigationWindows(\"" .
    \s:tag_list_buffer_name . "\", 1)<CR>"
  execute "inoremap <expr> { NullBeginSelect(\'{<CR>}<Esc>O\', " .
         \"NonNullEndSelect(\'{}<Esc>i\',\'{\'))"
  execute "inoremap /** /**<CR><CR><Backspace>/<Esc>ka<Space><Space>"
endfunction

function! s:CppInitialize()
  call s:SetOptions()
  call s:InitializeTagList()
  call windows#ShowInNavigationWindows(s:tag_list_buffer_name, 1)
  call s:KeyMaps()
endfunction

autocmd BufWinEnter *.h,*.hpp,*.hxx,*.c,*.cpp,*.cxx,*.cc nested
  \ call s:CppInitialize()
