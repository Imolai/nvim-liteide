-- Gabor's Neovim Lite IDE Setup for C++, Python, Bash
-- git clone https://github.com/Imolai/nvim-liteide.git ~/.config/nvim
-- init

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jay-babu/mason-nvim-dap.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "stevearc/conform.nvim" },
  { "mfussenegger/nvim-lint" },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope.nvim", dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
          ensure_installed = { "bash", "python", "cpp" },
          highlight = { enable = true },
          indent = { enable = true },
        },
      },
    }
  },
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },
  { "akinsho/toggleterm.nvim", version = "*" },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
})

require("config.options")
require("config.lazy")
require("config.keymaps")

