
# Neovim Lite IDE

A minimalist yet full-featured [Neovim](https://neovim.io) IDE for **C++ /
Python / Bash**, optimized for **Hungarian keyboard layouts** and
designed to be faster and more customizable than VSCode.

This is an independent minimalist Neovim setup. Not affiliated with any other
similarly named distributions.

> Note: Hungarian support is not annoying, and it's easy to reset:

```text
-- English: ]c
-- keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "úc", "<cmd>Gitsigns next_hunk<CR>", opts)
-- English: [c
-- keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "őc", "<cmd>Gitsigns prev_hunk<CR>", opts)
-- English: <C-\\><C-n>
cmd([[tnoremap <Esc> <C-\><C-n>]])
```

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [⚙️ Features](#-features)
- [⌨️ Keybindings (Hungarian keyboard friendly)](#-keybindings-hungarian-keyboard-friendly)
  - [🔍 Search & Navigation (Telescope)](#-search--navigation-telescope)
  - [💡 LSP Actions (Go to, Hover, Format)](#-lsp-actions-go-to-hover-format)
  - [🧪 Diagnostics](#-diagnostics)
  - [🐞 Debugging (nvim-dap)](#-debugging-nvim-dap)
  - [🧠 Git – Fugitive & Gitsigns](#-git--fugitive--gitsigns)
    - [➕ Gitsigns (inline Git changes)](#-gitsigns-inline-git-changes)
    - [📄 `:Git` buffer mappings (normal mode)](#-git-buffer-mappings-normal-mode)
  - [🔁 Terminal](#-terminal)
- [🧪 Health Check](#-health-check)
- [📥 Installation](#-installation)
- [📦 Plugins used](#-plugins-used)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ⚙️ Features

| Area                    | Description                                                                       |
| ----------------------- | --------------------------------------------------------------------------------- |
| 🔌 Plugin Manager       | [`lazy.nvim`](https://github.com/folke/lazy.nvim) – fast, async, stable           |
| 💡 LSP Support          | Automatic setup via Mason: `clangd`, `pyright`, `bashls`                          |
| 🧪 Linter               | `nvim-lint`: `cpplint`, `pylint`, `shellcheck`                                    |
| 🧼 Formatter            | `conform.nvim`: `clang-format`, `black`, `shfmt`                                  |
| 🪝 Completion Engine    | `nvim-cmp` + `cmp-nvim-lsp` + `LuaSnip`                                           |
| 🐞 Debugger (DAP)       | `nvim-dap`, `nvim-dap-ui`, `debugpy`, `codelldb`                                  |
| 🔍 File Search & UI     | `Telescope` + `Treesitter` support                                                |
| 🌈 Colorscheme          | `tokyonight-night`                                                                |
| 🔧 Health Check         | Custom `:checkhealth mytools` – verifies tools like `black`, `clang-format`, etc. |
| 🧠 Git Support          | `vim-fugitive` (status, diff, commits) + `gitsigns.nvim` (inline indicators)      |
| 🔁 Terminal Integration | `toggleterm.nvim` – in-editor floating terminal                                   |
| 🗂 File Explorer        | `neo-tree.nvim` – modern sidebar folder tree with icons                           |
| 🔘 Completion Toggle    | `<leader>ce` toggles autocompletion via `nvim-cmp`                                |

## ⌨️ Keybindings (Hungarian keyboard friendly)

*These mappings improve daily comfort for Hungarian layouts, where `[`, `]`,
`\` are **AltGr** combinations.*

### 🔍 Search & Navigation (Telescope)

| Keybind      | Description                 |
| ------------ | --------------------------- |
| `<leader>ff` | Find file                   |
| `<leader>fg` | Live grep (text search)     |
| `<leader>fb` | List open buffers           |
| `<leader>fh` | Search help topics          |
| `<leader>e`  | Toggle file tree (Neo-tree) |

### ⚙️ Editor Enhancements

| Keybind      | Description                          |
| ------------ | ------------------------------------ |
| `<leader>ce` | Toggle autocompletion on/off         |

### 💡 LSP Actions (Go to, Hover, Format)

| Keybind          | Description                     |
| ---------------- | ------------------------------- |
| `gd`, `gD`, `gr` | Jump to definition / references |
| `K`              | Show hover documentation        |
| `<leader>f`      | Format file                     |
| `:LspInfo`       | Show active language servers    |

### 🧪 Diagnostics

| Keybind      | Description                       |
| ------------ | --------------------------------- |
| `<leader>d`  | Floating diagnostics              |
| `<leader>dl` | Send diagnostics to quickfix list |
| `<leader>ds` | Search diagnostics via Telescope  |

### 🐞 Debugging (nvim-dap)

| Keybind      | Description              |
| ------------ | ------------------------ |
| `<F5>`       | Start/Continue debugging |
| `<F10>`      | Step over                |
| `<F11>`      | Step into                |
| `<F12>`      | Step out                 |
| `<leader>b`  | Toggle breakpoint        |
| `<leader>dr` | Toggle REPL              |
| `<leader>du` | Toggle debug UI          |

### 🧠 Git – Fugitive & Gitsigns

| Keybind      | Description                      |
| ------------ | -------------------------------- |
| `<leader>gs` | Git status (opens `:Git` buffer) |
| `<leader>gd` | Show diff split                  |
| `<leader>ga` | Git add                          |
| `<leader>gc` | Git commit                       |
| `<leader>gp` | Git push                         |
| `<leader>gl` | Git pull                         |

#### ➕ Gitsigns (inline Git changes)

| Keybind      | Description                                             |
| ------------ | ------------------------------------------------------- |
| `úc`, `őc`   | Next / previous Git hunk *(Hungarian keys for ]c, \[c)* |
| `<leader>hs` | Stage hunk                                              |
| `<leader>hr` | Reset hunk                                              |
| `<leader>hp` | Preview hunk                                            |
| `<leader>hb` | Blame current line                                      |
| `<leader>hu` | Undo staged hunk                                        |
| `<leader>hd` | Diff current file                                       |

#### 📄 `:Git` buffer mappings (normal mode)

| Key       | Action                            |
| --------- | --------------------------------- |
| `s`       | Stage change                      |
| `u`       | Unstage                           |
| `=`       | Show diff                         |
| `dp`      | Apply patch                       |
| `cc`      | Commit message editor             |
| `gq`      | Rewrap commit message             |
| `:Gwrite` | Stage current buffer (`git add`)  |
| `:Gread`  | Discard changes in current buffer |

### 🔁 Terminal

| Keybind                 | Description                         |
| ----------------------- | ----------------------------------- |
| `<leader>tt`            | Toggle floating terminal            |
| `<Esc>` *(in terminal)* | Exit to normal mode (`<C-\\><C-n>`) |

## 🧪 Health Check

Run health check generally:

```vim
:checkhealth
```

Or run this to check tool availability:

```vim
:checkhealth mytools
```

Or install all tools with:

```vim
:MasonInstallAll
```

## 📥 Installation

1. Save the previous Neovim configurations:

```bash
mv ~/.config/nvim{,.bak} ~/.local/share/nvim{,.bak} ~/.local/state/nvim{,.bak} ~/.cache/nvim{,.bak}
```

  Or clean them completely:

```bash
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

2. Clone the config into your Neovim directory:

```bash
git clone https://github.com/Imolai/nvim-liteide.git ~/.config/nvim
```

3. Then launch Neovim:

```bash
nvim
```

4. On the first run:

- The [`lazy.nvim`](https://github.com/folke/lazy.nvim) plugin manager will install itself.
- All required plugins will be automatically downloaded and configured.
- The `Mason` package manager will prepare your language servers and debuggers.

  After a few seconds, you're ready to go with a full-featured IDE for:

- **C++** via `clangd` + `clang-format` + `cpplint`
- **Python** via `pyright` + `black` + `pylint`
- **Bash** via `bashls` + `shfmt` + `shellcheck`

5. Final cleanup (optional):

```bash
rm -rf ~/.config/nvim/.git
```

## 📦 Plugins used

| Plugin                  | Purpose                            |
| ----------------------- | ---------------------------------- |
| `lazy.nvim`             | Plugin manager                     |
| `telescope.nvim`        | Fuzzy finder / search              |
| `plenary.nvim`          | Dependency for Telescope           |
| `nvim-treesitter`       | Syntax highlighting + folding      |
| `nvim-lspconfig`        | LSP client configuration           |
| `mason.nvim`            | LSP / DAP / Formatter installer    |
| `mason-lspconfig.nvim`  | Connects Mason to LSP config       |
| `mason-nvim-dap.nvim`   | Connects Mason to DAP              |
| `nvim-cmp`              | Autocompletion engine              |
| `cmp-nvim-lsp`          | LSP completions                    |
| `cmp-buffer`            | Buffer word completions            |
| `cmp-path`              | Path completions                   |
| `cmp-cmdline`           | Command-line completions           |
| `conform.nvim`          | Code formatting                    |
| `nvim-lint`             | Linting engine                     |
| `nvim-dap`              | Debugger (DAP core)                |
| `nvim-dap-ui`           | DAP UI overlay                     |
| `nvim-dap-virtual-text` | Inline variable display in debug   |
| `nvim-nio`              | DAP-UI async backend               |
| `vim-fugitive`          | Git CLI and commit UI integration  |
| `gitsigns.nvim`         | Git line markers                   |
| `toggleterm.nvim`       | Floating terminal in-editor        |
| `tokyonight.nvim`       | Colorscheme                        |
| `neo-tree.nvim`         | Folder tree explorer               |
| `nui.nvim`              | UI framework (Neo-tree dependency) |
| `nvim-web-devicons`     | File icons                         |

