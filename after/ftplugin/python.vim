function! s:SetOptions()
  set sw=2
  set expandtab
  set tabstop=2
  set softtabstop=2
endfunction

let s:nerd_tree_buffer_name = "NERD_tree_1"
let s:tag_list_buffer_name = "__Tag_List__"
function! s:InitializeNerdTree()
  if (bufnr(s:nerd_tree_buffer_name) == -1)
    NERDTree
    quit
  endif
endfunction

function! s:InitializeTagList()
  if (bufnr(s:tag_list_buffer_name) == -1)
    TlistToggle
    execute bufwinnr(s:tag_list_buffer_name) . "wincmd w"
    setlocal bufhidden=hide
    quit
  endif
endfunction

function! s:KeyMaps()
  execute "nnoremap <Leader>nt :call windows#ShowInNavigationWindows(\"" .
    \s:nerd_tree_buffer_name . "\", 0)<CR>"
  execute "nnoremap <Leader>tl :call windows#ShowInNavigationWindows(\"" .
    \s:tag_list_buffer_name . "\", 1)<CR>"
  execute "nnoremap <Leader>ne :call windows#ShowInEditionWindows(\"" .
    \bufname(winbufnr(0)) . "\")<CR>"
endfunction

function! s:PythonInitialize()
  call s:SetOptions()
  call s:InitializeNerdTree()
  call s:InitializeTagList()
  call windows#ShowInNavigationWindows(s:nerd_tree_buffer_name, 0)
  call windows#ShowInNavigationWindows(s:tag_list_buffer_name, 1)
  call s:KeyMaps()
endfunction

autocmd BufWinEnter *.py nested
  \ call s:PythonInitialize()
