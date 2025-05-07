-- Gábor Imolai's Minimal Neovim Setup (2025) for C++, Python, Bash
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

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.cmd.colorscheme("tokyonight-night")

require("config.lazy")
require("config.keymaps")

