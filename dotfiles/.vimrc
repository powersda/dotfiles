" Editor Options
syntax enable                   " enable syntax highlighting
filetype plugin on              " enable plugins
set number                      " show line numbers
set softtabstop=4               " set tabs to have 4 spaces
set autoindent                  " indent when moving to the next line while writing code
set expandtab                   " expand tabs into spaces
set shiftwidth=4                " when using the >> or << commands, shift lines by 4 spaces
"set showmatch                  " show the matching part of the pair for [] {} and ()
set wildmenu                    " show visual autocomplete menu
let python_highlight_all = 1    " enable all Python syntax highlighting features


" Netrw config
let g:netrw_liststyle = 3       " Set default file list style
let g:netrw_banner = 0          " Get rid of the banner
let g:netrw_winsize = 15        " Number of columns that netrw will take up
"let g:netrw_browse_split = 4    " Change what window netrw opens files in
let g:netrw_altv = 1            " Change vertical panel to the left side
let g:netrw_preview = 1         " Change preview to vertical split
let g:netrw_keepdir = 0         " Let the netrw cd move with gn command

"If opening Vim on a directory, fill window with file, otherwise open vertically
if argv(0) ==# '.'
    let g:netrw_browse_split = 0
else
    let g:netrw_browse_split = 4
endif

