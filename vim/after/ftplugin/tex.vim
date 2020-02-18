setlocal textwidth=80
setlocal formatoptions=jt
setlocal nowrap

" change eol comment to line comment and vice versa
nnoremap <buffer> ä :set nohlsearch<CR>$?\v%<CR>gEl"_d/\v\%<CR>"qDO<C-R>q<Esc>^:set hlsearch<BAR>noh<CR>
nnoremap <nowait> <buffer> <Leader>c a\cite{}<Left>
nnoremap <nowait> <buffer> <Leader>s a\cite[s.~]{}<Left><Left><Left>
nnoremap <nowait> <buffer> <Leader>i a\textit{}<Left>
nnoremap <nowait> <buffer> <Leader>e a (engl. \textit{})<Left><Left>
nnoremap <nowait> <buffer> <Leader>t a\texttt{}<Left>
nnoremap <nowait> <buffer> <Leader>b o\begin{verbatim}<Enter>\end{verbatim}<Esc>O

setlocal tabstop=8 softtabstop=4 shiftwidth=4 expandtab
setlocal smarttab  autoindent    breakindent

nnoremap <nowait> <buffer> <Leader>p :LLPStartPreview<CR>
nnoremap <nowait> <buffer> <Leader>re Go<Esc>o@misc{,<CR>title = {{}},<CR>note = {<CR>}<CR>}<Esc>4k$h
command! SOT so ~/.vim/after/ftplugin/tex.vim


augroup MakeKandi
    autocmd!
    autocmd BufWritePost kandi.tex silent make -C ~/yliopisto/kandi
augroup END
