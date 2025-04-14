------------------------
--     OPTIONS        --
------------------------
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "fuzzy", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- case insensitive searchs if all lowercase, otherwise case sensitive
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1                         -- always show tabs (1: only if multiple tabs)
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces used for << and >> commands
vim.opt.tabstop = 4                             -- the number of spaces to replace tabs with
vim.opt.softtabstop = 4                         -- the number of spaces to insert when TAB is pressed
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 2                         -- Minimum width of number column
vim.opt.signcolumn = "yes"                      -- always show the sign column
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.breakindent = true                      -- preserve indentation during line wrap 
vim.opt.linebreak = true                        -- if wrap enabled, wrap at specificed character (breakat)
vim.opt.breakat = " "                           -- wrap on this character
vim.opt.title = true                            -- change title of window to file name
vim.opt.errorbells = false                      -- no annoying error beeps
vim.opt.guicursor = ""                          -- stop neovim from changing terminal cursor
vim.opt.laststatus = 3                          -- global statusline
vim.opt.cmdheight = 1                           -- command height
vim.opt.scrolloff = 8                           -- keep 8 lines above bottom of buffer
vim.opt.list = true                             -- display symbols for whitespace characters
vim.opt.foldlevel = 99                          -- Open all folds on file open
vim.opt.foldmethod = "expr"                     -- Fold according to an expression
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Let treesitter determine folds
vim.opt.foldtext = ""                           -- Clears fold line count message
vim.opt.fillchars:append({fold = " "})          -- Changes fold chars to whitespace

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd('cabbrev ai CodeCompanion')
vim.cmd('cabbrev vimai CodeCompanionCmd')

------------------------
--   BASIC KEYMAPS    --
------------------------
-- Misc
vim.keymap.set("n", "<CR>", "<cmd>nohlsearch<CR>")

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

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
-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." }, }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load Plugins
require('lazy').setup({
  -- Language Support
  { 'williamboman/mason.nvim', opts = {} },
  { 'neovim/nvim-lspconfig' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        auto_install = true,
        incremental_selection = { enable = true },
        indent = { enable = true },
        highlight = { enable = true }
      }
  },
  { "folke/lazydev.nvim", ft = "lua", opts = {
    library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, }
  }},
  { 'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'super-tab' },
      signature = { enabled = true },
      completion = {
        -- ghost_text = { enabled = true },
        trigger = { show_in_snippet = false },
        accept = { auto_brackets = { enabled = true }, },
        list = { selection = { auto_insert = false, preselect = true } },
        menu = { auto_show = false }
      }
    }
  },

  -- Navigation
  { 'karb94/neoscroll.nvim', opts = {} },
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>fs", ":Telescope <CR>"},
      { "<leader>ff", ":Telescope find_files<CR>"},
      { "<leader>fg", ":Telescope live_grep<CR>"},
      { "<leader>fb", ":Telescope buffers<CR>"},
      { "<leader>fh", ":Telescope help_tags<CR>"},
    }
  },
  { 'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = { { "-", ":Oil --float --preview . <CR>" } },
    opts = {
      columns = { "size", "mtime", "icon" },
      view_options = { show_hidden = true }
    },
  },

  -- AI
  { 'olimorris/codecompanion.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
    cmd = { "CodeCompanion", "CodeCompanionCmd" },
    keys = {
      { "<Leader>fa", ":CodeCompanionActions<CR>", mode = { "n", "v" } },
      { "<Leader>a", ":CodeCompanionChat Toggle<CR>", mode = { "n", "v" } },
      { "ga", ":CodeCompanionChat Add<CR>", mode = { "v" } },
    },
    opts = {
      adapters = {
        opts = { show_defaults = false },
        openai = function() return require("codecompanion.adapters").extend("openai", {
            env = { api_key = "cmd:grep '^OPENAI_API_KEY=' ~/.env | cut -d'=' -f2" }
          }) end,
      },
      strategies = {
        chat = { adapter = "openai" },
        inline = { adapter = "openai" }
      },
      display = {
        action_palette = { provider = "telescope" },
        diff = { enabled = false }
      }
    }
  },

  -- Misc
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  { 'echasnovski/mini.ai', version = '*', opts = {} },
  { 'catgoose/nvim-colorizer.lua', event = "BufReadPre", opts = {} },
  { 'lewis6991/gitsigns.nvim', opts = {} },
  { 'nvim-lualine/lualine.nvim', opts = {} },

  -- Colourschemes
  { "folke/tokyonight.nvim", priority = 1000, opts = { transparent = true } },
  { 'sainnhe/sonokai',
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_transparent_background = 1
    end
  }
})

-- Set colourscheme
if not pcall(vim.cmd.colorscheme, { 'tokyonight' }) then
  vim.cmd.colorscheme({ 'default' })
end

------------------------
--        LSP         --
------------------------
vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  severity_sort = true
})

-- Setup and enable language servers
local lspconfig = require("lspconfig")
local lsps = { "lua_ls", "pyright" }
for _, lsp in pairs(lsps) do
  lspconfig[lsp].setup({})
end
