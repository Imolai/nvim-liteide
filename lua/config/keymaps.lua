-- Neovim Lite IDE
-- git clone https://github.com/Imolai/nvim-liteide.git ~/.config/nvim
-- config.keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local cmd = vim.cmd
local opts = { noremap = true, silent = true }

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Git
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
keymap("n", "<leader>ga", ":G add<CR>", opts)
keymap("n", "<leader>gc", ":G commit<CR>", opts)
keymap("n", "<leader>gp", ":G push<CR>", opts)
keymap("n", "<leader>gl", ":G pull<CR>", opts)
-- Navigation
-- English: ]c
-- keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "úc", "<cmd>Gitsigns next_hunk<CR>", opts)
-- English: [c
-- keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "őc", "<cmd>Gitsigns prev_hunk<CR>", opts)

-- Actions
keymap("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
keymap("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
keymap("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
keymap("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")

-- Terminal
keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", opts)
-- English: <C-\\><C-n>
cmd([[tnoremap <Esc> <C-\><C-n>]])

-- DAP
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", opts)

-- Formatting
keymap("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, opts)

-- Diagnostics
keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
keymap("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
keymap("n", "<leader>ds", function() require("telescope.builtin").diagnostics() end, opts)

-- Markdown Glow
keymap("n", "<leader>md", ":Glow<CR>", opts)

