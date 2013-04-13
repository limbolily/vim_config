let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Imap_UsePlaceHolders = 0

"with this,latex-suite will not add extra braces.
set backspace+=start

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

set sw=2
set tabstop=2
set softtabstop=2
set expandtab

" add env key mapping
call IMAP('EDF', "\\begin{defin}\\label{def:<++>}\n<++>\n\\end{defin}", 'tex')
call IMAP('EAX', "\\begin{axiom}\\label{axi:<++>}\n<++>\n\\end{axiom}", 'tex')
call IMAP('ETH', "\\begin{theo}\\label{the:<++>}\n<++>\n\\end{theo}", 'tex')
call IMAP('ELE', "\\begin{lemm}\\label{lem:<++>}\n<++>\n\\end{lemm}", 'tex')
call IMAP('EIN', "\\begin{inference}\\label{inf:<++>}\n<++>\n\\end{inference}", 'tex')
call IMAP('EXM', "\\begin{examp}\\label{exa:<++>}\n<++>\n\\end{examp}", 'tex')
call IMAP('EXC', "\\begin{exercise}\\label{exe:<++>}\n<++>\n\\end{exercise}", 'tex')
call IMAP('EPR', "\\begin{pro}\\label{pro:<++>}\n<++>\n\\end{pro}", 'tex')
call IMAP('ESO', "\\begin{solution}\\label{sol:<++>}\n<++>\n\\end{solution}", 'tex')
call IMAP('FIG', "\\begin{figure}\n\\caption{<++ ++>}\n\\label{fig:<++ ++>}\n\\begin{center}\n\\includegraphics{img/<++ ++>}\n\\end{center}\n\\end{figure}\n", 'tex')
