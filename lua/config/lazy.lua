-- Neovim Lite IDE
-- git clone https://github.com/Imolai/nvim-liteide.git ~/.config/nvim
-- config.lazy

-- Mason setup for managing external tools like LSPs and DAPs
require("mason").setup()
-- Ensure specific language servers are installed and configured
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "bashls" },
  automatic_installation = true,
})
-- Ensure debug adapters are installed
require("mason-nvim-dap").setup({
  ensure_installed = { "codelldb" },
  automatic_installation = true,
})

-- DAP (debugger) configuration
local dap = require("dap")
-- DAP for Python
dap.adapters.python = {
  type = "executable",
  command = vim.fn.exepath("python3"),
  args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath("python3")
    end,
  },
}
-- DAP for C++
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.cpp = {
  {
    name = "Launch executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- Set up LSP servers with capabilities for completion
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.bashls.setup({ capabilities = capabilities })

-- nvim-cmp setup for autocompletion
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  }),
})

-- Set up Conform for code formatting by filetype
require("conform").setup({
  formatters_by_ft = {
    cpp = { "clang_format" },
    c = { "clang_format" },
    python = { "black" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
})

-- Configure linters with nvim-lint
require("lint").linters_by_ft = {
  cpp = { "cpplint" },
  python = { "pylint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
}

-- Auto-run linter on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function() require("lint").try_lint() end,
})

-- UI and utility setups
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require("toggleterm").setup()
require("telescope").setup({})

-- Gitsigns configuration for inline git change markers
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "-" },
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end
  end
})

-- Enable mini.pairs for automatic closing pairs
require("mini.pairs").setup()

-- Setup lualine statusline with minimal separators
require("lualine").setup({
  options = {
    theme = "tokyonight",
    section_separators = "",
    component_separators = "|",
  },
})

