" Vim global plugin for listing and selecting buffers
" Last Change: 2013 Mar 17
" Maintainer: Limbo <limbonavel@gmail.com>
" License: This file is placed in the public domain.

if exists("g:loaded_buffers")
  finish
endif
let g:loaded_buffers = 1

" save compatible-options
let s:save_cpo = &cpo
" set vim default compatible-options
set cpo&vim

" get buffers to a list
function! s:GetBuffersToList()
  setlocal buftype=nofile
  setlocal modifiable
  setlocal noswapfile
  redir => buffs
  buffers!
  redir END
  let buflist = split(buffs, '\n')
  return buflist
endfunction

" display buffers function
function! s:DisplayBuffers()
  silent let s:curWinNr = winnr()
  silent let s:curBufNr = winbufnr(0)
  execute 'keepalt sp'
  execute "silent keepjumps hide edit [buffers]"
  setlocal buftype=nofile
  setlocal modifiable
  setlocal noswapfile
  setlocal noinsertmode
  silent let buflist = s:GetBuffersToList()
  call setline(1,buflist)
  "map cr to select buffer
  :noremap <buffer> <CR> :call <SID>SelectBuffer()<CR>
  setlocal nomodifiable
endfunction

" select buffer
function! s:SelectBuffer()
  let bufNr = str2nr(getline('.'))
  if (bufNr == bufnr("%"))
    return
  endif
  exec "quit"
  if (s:curBufNr != bufNr)
    exec  s:curWinNr . "wincmd w"
    exec "keepalt keepjumps silent buff!" bufNr
  endif
endfunction

" map C-Tab to display buffers
:noremap <S-Tab> :call <SID>DisplayBuffers()<CR>

" restore compatible-options
let &cpo = s:save_cpo
