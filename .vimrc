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
  colorscheme torte
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

"设置不使用swapfile
set noswapfile

"设置高亮显示当前行
set cursorline

"windows initialization
call windows#Initialize()

"tag list option
let Tlist_Show_One_File = 1

"YCM Mapping
nnoremap <Leader>gh :YcmCompleter GoToInclude<CR>
nnoremap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gD :YcmCompleter GoToDefinition<CR>

"vimtex setting
let g:tex_flavor = 'latex'

if has("mac")
  let g:vimtex_view_general_viewer
    \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
endif

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
      \ ]

"YCM Mapping
nnoremap <Leader>gh :YcmCompleter GoToInclude<CR>
nnoremap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gD :YcmCompleter GoToDefinition<CR>

"vimtex setting
let g:tex_flavor = 'latex'

if has("mac")
  let g:vimtex_view_general_viewer
    \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
endif

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
      \ ]

"Init nerd tree
let s:nerd_tree_buffer_name = "NERD_tree_1"
function! s:InitializeNerdTree()
  if (bufnr(s:nerd_tree_buffer_name) == -1)
    NERDTree
    quit
  endif
endfunction

function! s:KeyMaps()
  execute "nnoremap <Leader>nt :call windows#ShowInNavigationWindows(\'" .
    \s:nerd_tree_buffer_name . "\', 0)<CR>"
  execute "nnoremap <Leader>ne :call windows#ShowInEditionWindows(\'" .
    \bufname(winbufnr(0)) . "\')<CR>"
  execute "nnoremap <Leader>nr :call windows#ShowInEditionWindows(\'" .
    \bufname(winbufnr(0)) . "\', \'%\')<CR>"
endfunction

function! s:Initialize()
  call s:InitializeNerdTree()
  call windows#ShowInNavigationWindows(s:nerd_tree_buffer_name, 0)
  call s:KeyMaps()
endfunction

autocmd BufWinEnter *
  \ call s:Initialize()
