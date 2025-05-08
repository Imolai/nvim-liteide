-- Neovim Lite IDE
-- git clone https://github.com/Imolai/nvim-liteide.git ~/.config/nvim
-- config.options

-- Interface: line numbers, cursor, columns
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.colorcolumn = "+1"
vim.opt.showmatch = true
vim.opt.matchpairs = "(:),{:},[:],<:>"

-- Indentation and tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Encoding and editing
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.undolevels = 99999
vim.opt.textwidth = 79
vim.opt.backspace = { "indent", "eol", "start" }

-- Displaying whitespace
vim.opt.list = true
vim.opt.listchars = { tab = ">-", space = "˙", eol = "$" }

-- File handling: backups, swap, clipboard
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = "unnamedplus"

-- UI preferences
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Colorscheme
vim.cmd.colorscheme("tokyonight-night")

