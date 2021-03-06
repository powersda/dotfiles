" Vundle- load plugins
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/vim/bundle/Vundle.vim       " set the runtime path to include Vundle and initialize
call vundle#rc("~/.config/vim/bundle")
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'     
    Plugin 'vimwiki/vimwiki'
    Plugin 'terryma/vim-smooth-scroll'
    Plugin 'tpope/vim-commentary'
call vundle#end()

" Editor Options
syntax enable                   " enable syntax highlighting
filetype plugin on              " enable plugins
set number                      " show line numbers
" set relativenumber              " show relative numbers
set softtabstop=4               " set tabs to have 4 spaces
set autoindent                  " indent when moving to the next line while writing code
set expandtab                   " expand tabs into spaces
set shiftwidth=4                " when using the >> or << commands, shift lines by 4 spaces
set wildmenu                    " show visual autocomplete menu
set viminfo+=n~/.vim/viminfo    " change location of .viminfo
set title                       " set window title
" set backspace=indent,eol,start  " enable backspacing special characters
let python_highlight_all = 1    " enable all Python syntax highlighting features

" vimwiki config
let g:vimwiki_list = [{'path': '~/Notes/Wiki', 
                    \ 'index': 'index',
                    \   'ext': '.txt'}]


" Smooth-scrolling config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2) <CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2) <CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4) <CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4) <CR>

" Netrw config
let g:netrw_liststyle = 3       " Set default file list style
let g:netrw_banner = 0          " Get rid of the banner
let g:netrw_winsize = 15        " Number of columns that netrw will take up
let g:netrw_browse_split = 2    " Change what window netrw opens files in
"let g:netrw_altv = 1            " Change vertical panel to the left side
let g:netrw_preview = 1         " Change preview to vertical split
let g:netrw_keepdir = 0         " Let the netrw cd move with gn command

"If opening Vim on a directory, fill window with file, otherwise open vertically
"if argv(0) ==# '.'
"    let g:netrw_browse_split = 0
"else
"    let g:netrw_browse_split = 4
"endif

