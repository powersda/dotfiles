" General
set nocompatible		        " disable compatibility to vi
set title				        " set window title
set noerrorbells                " no beeping!
set backspace=indent,eol,start  " allow backspacing over special characters
set termguicolors               " enables 24-bit colour support

" Text rendering
set encoding=UTF-8              " ensure UTF-8 encoding for special characters
set linebreak                   " avoid wrapping line in the middle of a world
set wrap                        " enable line wrapping

" Searching
set ignorecase			        " case insensitive matching
set smartcase                   " case sensitive matching if uppercase included
set hlsearch			        " highlight search results

" Tabs and indenting
set tabstop=4			        " tab characters are 4 columns wide
set softtabstop=4		        " insert mode tabs move the cursor 4 columns
set expandtab			        " tab characters are expanded to spaces
set shiftwidth=4		        " width for autoindents
set autoindent			        " autoindent lines to previous line indentation

" Line Numbers
set number				        " line numbers
set relativenumber              " use numbers relative to current line

" Autocompletion
set wildmenu			        " show visual autocomplete menu
set wildmode=longest:full,full  " autocomplete to longest common match, then open wildmenu and cycle
set wildoptions=pum             " vertical wildmenu

syntax on				        " syntax highlighting
filetype plugin indent on		" enable plugins

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vimwiki/vimwiki'				" Vim Wiki
    Plug 'terryma/vim-smooth-scroll'	" Smooth scrolling animations
    Plug 'tpope/vim-commentary'			" Commenting action
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
    Plug 'sainnhe/sonokai'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'hoob3rt/lualine.nvim'
call plug#end()

" vimwiki config
let g:vimwiki_list = [{'path': '~/.local/share/wiki', 
                    \ 'index': 'index',
                    \   'ext': '.txt'}]

" indentLine config
let g:indent_blankline_char = '│'
let g:indent_blankline_show_trailing_blankline_indent = v:false

" colour scheme config
let g:sonokai_style = "default"
let g:sonokai_disable_italic_comment= v:false
let g:sonokai_enable_italic= v:false
let g:sonokai_transparent_background = v:true
let g:sonokai_menu_selection_background = 'green'
let g:sonokai_better_performance = v:true
colorscheme sonokai

" Smooth-scrolling config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2) <CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2) <CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4) <CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4) <CR>

" nvim-tree config
let g:nvim_tree_width = 35 "30 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 1 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 1 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 1 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {'git': 1, 'folders': 1, 'files': 1, 'folder_arrows': 0}
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" lualine config

:lua require'lualine'.setup {
            \ options = {
                \ icons_enabled = true,
                \ theme = "material",
                \ component_separators = {'', ''},
                \ section_separators = {'', ''},
                \ disabled_filetypes = {}
                \ },
            \ sections = {
                \ lualine_a = {'mode'},
                \ lualine_b = {'branch'},
                \ lualine_c = {'filename'},
                \ lualine_x = {'encoding', 'fileformat', 'filetype'},
                \ lualine_y = {'progress'},
                \ lualine_z = {'location'}
                \ },
            \ inactive_sections = {
                \ lualine_a = {},
                \ lualine_b = {},
                \ lualine_c = {'filename'},
                \ lualine_x = {'location'},
                \ lualine_y = {},
                \ lualine_z = {}
                \ },
            \ tabline = {},
            \ extensions = {'nvim-tree'}
                \ }
