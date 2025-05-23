-- Neovim Lite IDE
-- git clone https://github.com/Imolai/nvim-liteide.git ~/.config/nvim
-- init

-- Disable unused providers for speed
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup with lazy.nvim
require("lazy").setup({
  -- Base LSP tools
  { "williamboman/mason.nvim" },            -- LSP/DAP/formatter manager
  { "williamboman/mason-lspconfig.nvim" },  -- Mason + LSP integration
  { "jay-babu/mason-nvim-dap.nvim" },       -- Mason + DAP integration
  { "neovim/nvim-lspconfig" },              -- Built-in LSP setup
  -- Autocompletion
  { "hrsh7th/nvim-cmp" },                   -- Completion engine
  { "hrsh7th/cmp-nvim-lsp" },               -- Completion from LSP
  { "hrsh7th/cmp-buffer" },                 -- Completion from buffer
  { "hrsh7th/cmp-path" },                   -- Path completion
  { "hrsh7th/cmp-cmdline" },                -- Command line completion
  -- Formatting and linting
  { "stevearc/conform.nvim" },              -- Formatter engine
  { "mfussenegger/nvim-lint" },             -- Lightweight linter plugin
  -- Debugging (DAP)
  { "mfussenegger/nvim-dap" },              -- Core DAP client
  { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },  -- DAP UI
  { "theHamsta/nvim-dap-virtual-text" },    -- Inline debug values
  -- Search, fuzzy finder and syntax highlighting
  { "nvim-telescope/telescope.nvim", dependencies = {  -- Find, Filter, Preview, Pick
      "nvim-lua/plenary.nvim",                         -- Lua utils for Telescope
      { "nvim-treesitter/nvim-treesitter",             -- Syntax and indent parser
        build = ":TSUpdate",
        opts = {
          ensure_installed = { "bash", "python", "cpp" },
          highlight = { enable = true },
          indent = { enable = true },
        },
      },
    }
  },
  -- Git integration
  { "tpope/vim-fugitive" },                       -- Git CLI interface in Vim
  { "lewis6991/gitsigns.nvim" },                  -- Git signs in the gutter
  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*" },   -- Integrated floating terminal
  -- Folder tree plugin and icons
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
      "MunifTanjim/nui.nvim",
    },
  },
  { "nvim-tree/nvim-web-devicons", lazy = true }, -- safe to include even if used elsewhere
  -- Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },  -- A clean, dark Neovim theme
  -- UX Enhancements
  -- { "echasnovski/mini.pairs", version = false },  -- Auto closing brackets, quotes
  { "echasnovski/mini.icons", version = false },  -- Icon definitions
  { "nvim-lualine/lualine.nvim" },                -- Modern statusline
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }, -- Markdown preview for glow
})

-- Load configuration modules
require("config.options")
require("config.lazy")
require("config.keymaps")

