" Vim filetype plugin
" Language:Vim
" Maintainer:Limbo <limbonavel@gmail.com>

"Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

"Use vim runtime ftplugin
runtime! $VIMRUNTIME . "/ftplugin/vim.vim"

"call ShowInNavigationWindows("NERDTree")
