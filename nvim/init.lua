------------------------
--     OPTIONS        --
------------------------
require("vim._core.ui2").enable({})                -- Use UIv2 until its mainlined

vim.o.clipboard = "unnamedplus"                    -- allows neovim to access the system clipboard
vim.o.conceallevel = 0                             -- so that `` is visible in markdown files
vim.o.fileencoding = "utf-8"                       -- the encoding written to a file
vim.o.hlsearch = true                              -- highlight all matches on previous search pattern
vim.o.ignorecase = true                            -- ignore case in search patterns
vim.o.smartcase = true                             -- case insensitive searchs if all lowercase, otherwise case sensitive
vim.o.mouse = "a"                                  -- allow the mouse to be used in neovim
vim.o.showmode = false                             -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 1                              -- always show tabs (1: only if multiple tabs)
vim.o.smartindent = true                           -- make indenting smarter again
vim.o.splitbelow = true                            -- force all horizontal splits to go below current window
vim.o.splitright = true                            -- force all vertical splits to go to the right of current window
vim.o.swapfile = false                             -- creates a swapfile
vim.o.termguicolors = true                         -- set term gui colors (most terminals support this)
vim.o.undofile = true                              -- enable persistent undo
vim.o.updatetime = 300                             -- faster completion (4000ms default)
vim.o.expandtab = true                             -- convert tabs to spaces
vim.o.shiftwidth = 4                               -- the number of spaces used for << and >> commands
vim.o.tabstop = 4                                  -- the number of spaces to replace tabs with
vim.o.softtabstop = 4                              -- the number of spaces to insert when TAB is pressed
vim.o.number = true                                -- set numbered lines
vim.o.relativenumber = true                        -- set relative numbered lines
vim.o.numberwidth = 2                              -- Minimum width of number column
vim.o.signcolumn = "yes"                           -- always show the sign column
vim.o.wrap = false                                 -- display lines as one long line
vim.o.breakindent = true                           -- preserve indentation during line wrap
vim.o.linebreak = true                             -- if wrap enabled, wrap at specificed character (breakat)
vim.o.breakat = " "                                -- wrap on this character
vim.o.title = true                                 -- change title of window to file name
vim.o.errorbells = false                           -- no annoying error beeps
vim.o.guicursor = ""                               -- stop neovim from changing terminal cursor
vim.o.laststatus = 3                               -- global statusline
vim.o.cmdheight = 0                                -- command height
vim.o.scrolloff = 8                                -- keep 8 lines above bottom of buffer
vim.o.list = true                                  -- display symbols for whitespace characters
vim.o.foldlevel = 99                               -- Open all folds on file open
vim.o.foldmethod = "expr"                          -- Fold according to an expression
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Let treesitter determine folds
vim.o.foldtext = ""                                -- Clears fold line count message
vim.o.fillchars = "fold: "                         -- Changes fold chars to whitespace
vim.o.autocomplete = false                         -- Native autocompletion
vim.o.completeopt = "menuone,noselect"             -- Native autocomplete options
vim.o.pumheight = 10                               -- pop up menu height
vim.o.pumborder = "rounded"
vim.o.winborder = "rounded"

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------------------------
--   BASIC KEYMAPS    --
------------------------
-- Misc
vim.keymap.set("n", "<CR>", "<cmd>nohlsearch<CR>")

-- Navigate buffers
vim.keymap.set("n", "<C-h>", ":bprevious<CR>")
vim.keymap.set("n", "<C-l>", ":bnext<CR>")
vim.keymap.set("n", "<C-j>", ":tabnext<CR>")
vim.keymap.set("n", "<C-k>", ":tabprevious<CR>")

-- Resize Windows
vim.keymap.set("n", "<C-S-j>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-k>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-h>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-l>", ":vertical resize +2<CR>")

------------------------
-- BASIC AUTOCOMMANDS --
------------------------
-- Highlight text when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

------------------------
--      PLUGINS       --
------------------------
vim.pack.add({
    -- LSP and completion
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },

    -- Appearance
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/karb94/neoscroll.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    -- Navigation
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-mini/mini.pick" },

    -- Utility
    { src = "https://github.com/nvim-mini/mini.ai" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/kylechui/nvim-surround" },
})

require("lualine").setup()
require("tokyonight").setup({ transparent = true })
require("neoscroll").setup()
require("mini.icons").setup()
require("nvim-highlight-colors").setup()
require("gitsigns").setup()
require("mini.ai").setup()
require("nvim-surround").setup()
require("mini.pick").setup()
require("mini.pairs").setup()
require("oil").setup({ columns = { "size", "mtime", "icon" }, view_options = { show_hidden = true } })

vim.keymap.set('n', '-', ':Oil --float --preview <CR>', { desc = 'Oil'})
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>", { desc = 'Finder - find files' })
vim.keymap.set('n', '<leader>fg', ":Pick grep_live<CR>", { desc = 'Finder - live grep' })
vim.keymap.set('n', '<leader>fb', ":Pick buffers<CR>",{ desc = 'Finder - buffers' })
vim.cmd.colorscheme({ 'tokyonight' })

------------------------
--        LSP         --
------------------------
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    severity_sort = true,
    float = { border = "rounded" },
})

require("mason").setup()
require("mason-lspconfig").setup()
vim.lsp.config('lua_ls', { settings = { Lua = { workspace = { library = { vim.env.VIMRUNTIME } }, } } })

-- <C-space>, <C-n>, <C-p>
require("blink.cmp").setup({
    keymap = { preset = 'super-tab' },
    signature = { enabled = true },
    completion = {
        -- ghost_text = { enabled = true },
        trigger = { show_in_snippet = false },
        accept = { auto_brackets = { enabled = true }, },
        list = { selection = { auto_insert = false, preselect = true } },
        menu = { auto_show = false },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
    }
})
