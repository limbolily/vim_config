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
endfunction

function! s:VimInitialize()
  call s:InitializeTagList()
  call windows#ShowInNavigationWindows(s:tag_list_buffer_name, 1)
  call s:KeyMaps()
endfunction

autocmd BufWinEnter *.vim nested call s:VimInitialize()
