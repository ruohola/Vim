﻿let g:mapleader=' '

" ============= PLUGINS =============

" disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

if has('win32')
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'tpope/vim-surround'                      " edit braces easily
Plug 'tpope/vim-commentary'                    " comment out lines
Plug 'tpope/vim-repeat'                        " repeat plugin commands
Plug 'easymotion/vim-easymotion'               " jump to any position
Plug 'google/vim-searchindex'                  " show [x/y] when searching
Plug 'machakann/vim-highlightedyank'           " highlight yanks
Plug 'markonm/traces.vim'                      " live substitution
Plug 'simnalamburt/vim-mundo'                  " graphical undotree
Plug 'maxbrunsfeld/vim-yankstack'              " remember past yanks
Plug 'vim-scripts/ReplaceWithRegister'         " operator to replace text
Plug 'wellle/targets.vim'                      " more text objects
Plug 'tommcdo/vim-exchange'                    " change two objects
Plug 'terryma/vim-smooth-scroll'               " smooth scrolling
Plug 'Yggdroot/LeaderF'                        " fuzzy finding
Plug 'junegunn/vim-easy-align'                 " align text with motion
Plug 'sheerun/vim-polyglot'                    " better syntax highlighting
Plug 'trevordmiller/nova-vim'                  " nova colorscheme
call plug#end()

" sheerun/vim-polyglot
" Edited line 480, python self and cls highlighting

" Yggdroot/LeaderF
let g:Lf_StlColorscheme='default'
let g:Lf_CursorBlink=0
let g:Lf_UseVersionControlTool=0
let g:Lf_DefaultExternalTool='rg'
let g:Lf_ShowHidden=1
if has('win32')
    let TempFolder = $HOME . '/vimfiles/.temp'
else
    let TempFolder = $HOME . '/.vim/.temp'
endif
let g:Lf_CacheDirectory=TempFolder
let g:Lf_IndexTimeLimit=600
let g:Lf_UseCache=1
let g:Lf_HighlightIndividual=1
let g:Lf_NumberOfHighlight=100
let g:Lf_UseMemoryCache=1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git'],
        \ 'file': []
        \}
let g:Lf_ShortcutF='<Leader>p'
nnoremap <Leader>l :LeaderfLine<CR>
nnoremap <Leader>o :LeaderfLineAll<CR>
nnoremap <Leader>k :LeaderfHelp<CR>
nnoremap <Leader>n :LeaderfBufferAll<CR>
nnoremap <Leader>m :LeaderfMru<CR>

" maxbrunsfeld/vim-yankstack
let g:yankstack_map_keys = 0
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste
call yankstack#setup()

" easymotion/vim-easymotion
let g:EasyMotion_keys='asdghklqwertyuiopzxcvbnmfj'
let g:EasyMotion_do_shade=0
let g:EasyMotion_do_mapping=0
map <Leader>f <Plug>(easymotion-bd-f)
map <Leader>t <Plug>(easymotion-bd-t)

" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration=300

" simnalamburt/vim-mundo
let g:mundo_preview_statusline='Diff'
let g:mundo_tree_statusline='History'
let g:mundo_mirror_graph=0
let g:mundo_return_on_revert=0
let g:mundo_verbose_graph=0
nnoremap <silent> <Leader>2 :MundoToggle<CR>

" junegunn/vim-easy-align
nmap gl <Plug>(EasyAlign)
xmap gl <Plug>(EasyAlign)

" vim-scripts/ReplaceWithRegister
nmap ö <Plug>ReplaceWithRegisterOperator
nmap Ö <Plug>ReplaceWithRegisterOperator$
nmap öö <Plug>ReplaceWithRegisterLine
xmap ö <Plug>ReplaceWithRegisterVisual

" terryma/vim-smooth-scroll
nnoremap <silent> <C-U> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <C-D> :call smooth_scroll#down(&scroll, 0, 2)<CR>
nnoremap <silent> <C-B> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
nnoremap <silent> <C-F> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>



" ============= GENERAL =============

" set these only when vim starts, not when sourcing vimrc
if !exists('g:notfirstopen')
    let g:notfirstopen=1

    " messes up Mundo if loaded again
    set termguicolors
    colorscheme nova

    if has('gui_running')
        set lines=40 columns=120  " initial window size
        if has ('win32')
            set guifont=Consolas:h12  " changing font moves the window
        else
            set guifont=SFMono-Regular:h16  " changing font moves the window
        endif
    endif

    syntax enable
    highlight MatchParen gui=bold,underline guifg=#D18EC2
    highlight IncSearch gui=bold guifg=#A8CE93 guibg=#1E272C
    highlight Todo gui=bold guifg=#DF8C8C
endif

" Windows settings
if has('win32')

    " use cygwin bash as shell
    let $CHERE_INVOKING=1
    set shell=C:/cygwin64/bin/bash.exe
    set shellcmdflag=--login\ -c
    set shellxquote=\"
    set noshellslash

    " temp file locations
    set viminfo+=n~/vimfiles/.temp/_viminfo
    set undodir=~/vimfiles/.temp/undo
    set backupdir=~/vimfiles/.temp/backup
    set directory=~/vimfiles/.temp/swap
" Unix settings
else
    " temp file locations
    set viminfo+=n~/.vim/.temp/.viminfo
    set undodir=~/.vim/.temp/undo
    set backupdir=~/.vim/.temp/backup
    set directory=~/.vim/.temp/swap
endif
set clipboard=unnamed  " use system clipboard

" GUI specific settings
if has('gui_running')
    set guioptions=
    " Cursor is a vertical bar in insert mode and a block in normal mode.
    set guicursor+=a:blinkon0
    set guicursor+=i-ci:ver20-blinkon0
else
    if $TERM_PROGRAM =~ "iTerm"
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif

" visuals
set cursorline
set number relativenumber
set showmode showcmd
set report=1
set cmdheight=2

" statusline
set laststatus=2                                      " always show statusline
set statusline=                                       " clear statusline
set statusline+=%l                                    " current line number
set statusline+=/%L                                   " total lines
set statusline+=(%p%%)                                " percentage through the file
set statusline+=%4c                                   " cursor column
set statusline+=\|%-4{strwidth(getline('.'))}         " line length
set statusline+=%{&buftype!='terminal'?expand('%:p:h:t').'\\'.expand('%:t'):expand('%')}  " dir\filename.ext
set statusline+=%m                                    " modified flag
set statusline+=%r                                    " read only flag
set statusline+=%=                                    " left/right separator
set statusline+=\ \|\ %{getcwd()}                     " current working directory
set statusline+=\ [%{strlen(&ft)?(&ft\ .\ \',\'):''}  " filetype
set statusline+=%{strlen(&fenc)?(&fenc\ .\ \',\'):''} " file encoding
set statusline+=%{&ff}]                               " line endings
set statusline+=%<                                    " start to truncate here

" line wrapping
set wrap linebreak textwidth=0 wrapmargin=0 formatoptions-=t

" indentation settings
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set smarttab  autoindent    breakindent

" show unwanted whitespace on 'set list'
set nolist listchars=tab:>-,trail:.,nbsp:.

" search settings
set incsearch hlsearch ignorecase smartcase gdefault

" no errorbells
set noerrorbells
augroup NoVisualBells
    autocmd!
    autocmd GUIEnter * set visualbell t_vb=
augroup END

" language settings
let $LANG='en_US'
set fileformats=unix,dos
set encoding=utf-8
scriptencoding utf-8

" mixed settings
set undofile

" remove delay from esc
set timeoutlen=1000
set ttimeoutlen=0

set backspace=indent,eol,start " make backspace behave normally
set hidden                     " switch to another buffer without saving
set autoread                   " update changes to file automatically
set scrolloff=1                " pad cursor row with lines
set splitright                 " open splits to the right
set splitbelow                 " open splits to the bottom
set wildmode=list:longest,full " better tab completion on command line mode
set undolevels=5000            " remember more undo history
set history=1000               " remember more command history
set updatecount=10             " update swap file more often
set matchpairs=(:),{:},[:]     " configure which braces to match
set shortmess=a                " shorter prompt messages
filetype plugin indent on      " auto detect filetype



" ============= MAPPINGS =============

if has('win32')
    " traverse history with alt+,.
    nnoremap ® g,
    nnoremap ¬ g;

    " split navigations (alt+hjkl)
    nnoremap è <C-W><C-H>
    tnoremap è <C-W><C-H>
    tnoremap ê <C-W><C-J>
    nnoremap ê <C-W><C-J>
    nnoremap ë <C-W><C-K>
    tnoremap ë <C-W><C-K>
    nnoremap ì <C-W><C-L>
    tnoremap ì <C-W><C-L>

    " cycle buffers (alt+nm)
    nnoremap <silent> î :bprev<CR>
    tnoremap <silent> î <C-W>:bprev<CR>
    nnoremap <silent> í :bnext<CR>
    tnoremap <silent> í <C-W>:bnext<CR>

    " cycle tabs (alt+ui)
    nnoremap <silent>õ :tabprevious<CR>
    tnoremap <silent>õ <C-W>:tabprevious<CR>
    nnoremap <silent>é :tabnext<CR>
    tnoremap <silent>é <C-W>:tabnext<CR>

    " toggle fullscreen
    nnoremap <silent> <Leader>0 :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

    " unmap push-to-talk key
    map <F13> <Nop>
    map! <F13> <Nop>
else
    " traverse history with alt+,.
    nnoremap ′ g,
    nnoremap … g;

    " split navigations (alt+hjkl)
    nnoremap ← <C-W><C-H>
    tnoremap ← <C-W><C-H>
    tnoremap ↓ <C-W><C-J>
    nnoremap ↓ <C-W><C-J>
    nnoremap ↑ <C-W><C-K>
    tnoremap ↑ <C-W><C-K>
    nnoremap → <C-W><C-L>
    tnoremap → <C-W><C-L>

    " cycle buffers (alt+nm)
    nnoremap <silent> № :bprev<CR>
    tnoremap <silent> № <C-W>:bprev<CR>
    nnoremap <silent> µ :bnext<CR>
    tnoremap <silent> µ <C-W>:bnext<CR>

    " cycle tabs (alt+ui)
    nnoremap <silent>ü :tabprevious<CR>
    tnoremap <silent>ü <C-W>:tabprevious<CR>
    nnoremap <silent>↔︎ :tabnext<CR>
    tnoremap <silent>↔︎ <C-W>:tabnext<CR>
endif

" makes these easier to use
noremap , :
tnoremap <C-W>, <C-W>:
noremap : ;
noremap ; ,
augroup QMappings
    autocmd!
    autocmd FileType * if &l:buftype !=# 'nofile' |nnoremap <buffer> <silent> q, q:| endif
    autocmd FileType * if &l:buftype ==# 'nofile' |nnoremap <buffer> <silent> q :q<CR>| endif
augroup END


" make Y behave the same way as D and C
nnoremap Y y$

" makes v and V more consistent with other commands
nnoremap vv V
nnoremap V <C-V>$

" makes S more useful
nnoremap S ciw

" search for selected text
xnoremap <Leader>/ "zy/\V<C-R>=escape(@z,'/\')<CR><CR>

" navigate quickfix list and vimgrep
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Up> :cprev<CR>
nnoremap <silent> <C-Down> :cnfile<CR><C-G>
nnoremap <silent> <C-Up> :cpfile<CR><C-G>

" capitalize word under/before under cursor
inoremap <C-J> <Esc>mzbgUiw`za

" make C-U and C-W and CR undoable
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
inoremap <CR> <C-G>u<CR>

" change enter behaviour
augroup EnterMappings
    autocmd!
    " Complex but works
    autocmd BufEnter * if &l:buftype ==# ''
            \| nnoremap <buffer> <CR> o<Esc>
            \| nnoremap <buffer> <S-Enter> O<Esc>
            \| nnoremap <buffer> <silent> <C-Enter> :<C-U>call <SID>BlankDown(v:count1)<CR>
            \| nnoremap <buffer> <silent> <C-S-Enter> :<C-U>call <SID>BlankUp(v:count1)<CR>
            \| nnoremap <buffer> <Leader><CR> a<CR><Esc>
            \| endif
    autocmd BufWinEnter * if &l:buftype ==# 'quickfix'
            \| unmap <buffer> <CR>
            \| endif
augroup END

" move CTRL-I, since tab is taken
nnoremap <C-K> <C-I>

" better way to indent
nnoremap <BS> <<
nnoremap <TAB> >>
xnoremap <BS> <gv
xnoremap <TAB> >gv

" persistent visuals
xnoremap > >gv
xnoremap < <gv
xnoremap <C-X> <C-X>gv
xnoremap <C-A> <C-A>gv

" Q plays back q macro
nnoremap Q @q

" don't copy to clipboard when deleting with <Leader>d
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
xnoremap <Leader>d "_d

" clear highlights
if has('gui_running')
    nnoremap <silent> <Esc> <Esc>:noh<CR>
else
    augroup ClearHighlights
        autocmd!
        autocmd TermResponse * nnoremap <silent> <Esc> <Esc>:noh<CR>|nnoremap <Esc>[ <Esc>[
    augroup END
endif

" open vimrc
nnoremap <silent> <Leader>vr :tabe<BAR>tabm<BAR>e $MYVIMRC<CR>

" close current buffer
nnoremap <silent> <Leader>b :call DeleteCurBufferNotCloseWindow()<CR>

" change working directory to current file's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>



" ============= COMMANDS =============

" vim-plug commands
command! PI w | PlugInstall
command! PC w | PlugClean!
command! PU w | PlugUpdate | PlugUpgrade

" source vimrc
command! SO so $MYVIMRC

" count lines in file
command! WC %s/^\s*\w\+//n | noh

" Count all .py files lines, have to have terminal open in tab 1 for this to work.
command! PL write|tabn 1|call <SID>RunCommandInSplitTerm("grep -vc '^\\s*$' *.py && echo -n 'total:' && grep -v '^\\s*$' *.py | wc -l")



" ============= FUNCTIONS =============

" https://github.com/dhleong/dots/blob/master/.vim/init/terminal.vim
function! s:RunCommandInSplitTerm(command) abort
    write
    let winSize = float2nr(0.3 * winheight('$'))
    let mainBuf = bufnr('%')
    let termBufNr = get(b:, '_run_term', -1)
    let termWinNr = bufwinnr(termBufNr)

    if termWinNr == -1
        exe 'below split | resize ' . winSize
        let termBufNr = term_start('bash -l', {
                    \ 'curwin': 1,
                    \ 'term_finish': 'close',
                    \ })
        call setbufvar(mainBuf, '_run_term', termBufNr)
    else
        exe termWinNr . 'wincmd w'
    endif

    let mainWin = bufwinnr(mainBuf)
    call term_sendkeys(termBufNr, a:command . '')
    exe "normal \<C-W>p"
endfunction


" https://stackoverflow.com/a/44950143
func! DeleteCurBufferNotCloseWindow() abort
    if &modified
        echohl ErrorMsg
        echom 'E89: no write since last change'
        echohl None
    elseif winnr('$') == 1
        bd
    else  " multiple window
        let oldbuf = bufnr('%')
        let oldwin = winnr()
        while 1   " all windows that display oldbuf will remain open
            if buflisted(bufnr('#'))
                b#
            else
                bn
                let curbuf = bufnr('%')
                if curbuf == oldbuf
                    enew    " oldbuf is the only buffer, create one
                endif
            endif
            let win = bufwinnr(oldbuf)
            if win == -1
                break
            else        " there are other window that display oldbuf
                exec win 'wincmd w'
            endif
        endwhile
        " delete oldbuf and restore window to oldwin
        exec oldbuf 'bd'
        exec oldwin 'wincmd w'
    endif
endfunc


function! s:BlankUp(count) abort
    norm! mz
    for i in range(1, a:count)
        norm! O
    endfor
    norm! `z
endfunction


function! s:BlankDown(count) abort
    norm! mz
    for i in range(1, a:count)
        norm! o
    endfor
    norm! `z
endfunction


function! s:PutXXX(count) abort
    norm! mz
    for i in range(1, a:count)
        norm! A  # XXXj
    endfor
    norm! `z
endfunction

function! s:NoXXX(count) abort
    norm! mz
    for i in range(1, a:count)
        norm! $F#gEl"_Dj
    endfor
    norm! `z
endfunction



" ============= AUTOCMD =============

" config for python files
" TODO: pistä run command vaihtamaan pois terminaalista, esim oik puol splittiin
" Last <BAR>:<CR> in run python command mapping maybe removes 'ml_get: invalid lnum' error
augroup Python
    autocmd!
    autocmd FileType python nnoremap <buffer> <silent> <Leader>5
                \ :write<BAR>:tabn 1<BAR>:call <SID>RunCommandInSplitTerm('python ' . shellescape(expand('%:p')))<CR><BAR>:<CR>
                \|nnoremap <buffer> <Leader>' o""""""<Esc>hhi
                \|nnoremap <buffer> <Leader>x :<C-U>call <SID>PutXXX(v:count1)<CR>
                \|nnoremap <buffer> <Leader>z :<C-U>call <SID>NoXXX(v:count1)<CR>
augroup END


" toggle relative numbers between modes
augroup LineNumbers
    autocmd!
    autocmd WinEnter,FocusGained,InsertLeave * if &l:buftype !=# 'nofile' && &l:buftype !=# 'nowrite' |set relativenumber|endif
    autocmd WinLeave,FocusLost,InsertEnter * if &l:buftype !=# 'nofile' && &l:buftype !=# 'nowrite' |set norelativenumber|endif
augroup END


" source vimrc when it's saved
augroup ReloadVimrc
    autocmd!
    autocmd BufWritePost *vimrc so $MYVIMRC
augroup END


" configure opening of help windows
augroup HelpOpen
    autocmd!
    autocmd BufRead *.txt if &buftype ==? 'help'
                    \|set number
                    \|set relativenumber
                    \|exe "normal \<C-W>T"
                \|endif
augroup END


" clear trailing whitespace on save
augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre *vimrc :%s/\s\+$//e
augroup END



" ============= REGISTERS =============

" clear the search register for no highlighting
let @/=''
" macro to add a plugin
let @p='gg/call plug#end()OPlug ''+'' " glip-"nkA '
