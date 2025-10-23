# 💤 My Neovim Setup

A modern, fast, and aesthetic Neovim configuration — built around **lazy.nvim**, **Catppuccin**, and the latest Neovim (≥ 0.11) LSP APIs.

Designed for:
- 🐍 Python and ⚙️ Lua development  
- Full LSP + autocompletion + snippets  
- Aesthetic UI (Catppuccin, Alpha, Lualine, Neo-tree, Telescope)  
- Seamless terminal workflow with tmux and Powerlevel10k  

---

## 🧩 Requirements

### Core Dependencies

| Tool | Description | Install Command (macOS) |
|-------|--------------|--------------------------|
| **Neovim ≥ 0.11.0** | Required for new LSP API | `brew install neovim` |
| **Git** | Plugin manager dependency | `brew install git` |
| **Node.js** | Needed by some LSPs | `brew install node` |
| **Python 3** | For `pylsp` and Python tooling | `brew install python` |
| **pipx** *(recommended)* | To isolate Python tools | `brew install pipx` |
| **ripgrep (`rg`)** | Used by Telescope live grep | `brew install ripgrep` |
| **fd** | Used by Telescope file finder | `brew install fd` |
| **Nerd Font** | For icons (Lualine, Alpha, Neo-tree) | `brew install font-jetbrains-mono-nerd-font` |

---

## 💻 Terminal & Shell Setup

| Tool | Purpose | Notes |
|------|----------|-------|
| **iTerm2** | Terminal with transparency & blur | Set opacity under *Preferences → Profiles → Window* |
| **tmux** | Terminal multiplexer | `brew install tmux` |
| **Powerlevel10k** | Shell prompt theme | `brew install romkatv/powerlevel10k/powerlevel10k` |
| **Catppuccin** | Matching theme for tmux, iTerm, and Neovim | `git clone https://github.com/catppuccin/tmux ~/.tmux/plugins/tmux` |

---

## ⚙️ Neovim Plugin Stack

This setup uses **lazy.nvim** as the plugin manager.  
Major components include:

| Plugin | Purpose |
|---------|----------|
| 💤 folke/lazy.nvim | Plugin manager |
| 🎨 catppuccin/nvim | Colorscheme |
| 📁 nvim-neo-tree/neo-tree.nvim | File explorer |
| 🔍 nvim-telescope/telescope.nvim | Fuzzy finder |
| 🌲 nvim-treesitter/nvim-treesitter | Syntax highlighting |
| 💻 neovim/nvim-lspconfig | LSP setup |
| ⚙️ mason.nvim + mason-lspconfig.nvim | Manage LSP servers |
| 🧠 hrsh7th/nvim-cmp | Autocompletion engine |
| 💬 hrsh7th/cmp-nvim-lsp | LSP completion source |
| 📦 hrsh7th/cmp-buffer, cmp-path, cmp-luasnip | Additional completion sources |
| ✂️ L3MON4D3/LuaSnip | Snippet engine |
| 📚 rafamadriz/friendly-snippets | Community snippet library |
| 🏁 goolord/alpha-nvim | Startup dashboard |
| 📊 nvim-lualine/lualine.nvim | Statusline |
| 🖼️ nvim-web-devicons | File icons |

---

## 🧠 LSP + Formatter Setup

All LSPs are installed and managed via **mason.nvim**.

| Language | LSP Server | Formatter / Linter |
|-----------|-------------|--------------------|
| **Python** | pylsp | black, isort, flake8 |
| **Lua** | lua_ls | built-in diagnostics & formatting |

### Manual Installation

In Neovim:
```:Mason```

Or via pipx:
```pipx install "python-lsp-server[all]"```

---

## 🚀 Installation

1. **Install dependencies**
```
brew install neovim git node python ripgrep fd tmux
brew install font-jetbrains-mono-nerd-font
```
2. **Clone this config**
```git clone https://github.com/ -> <your-username>/nvim ~/.config/nvim```
3. **Start Neovim**
```nvim``` (Lazy.nvim will automatically install all plugins on first launch.)

---

## 🧪 Verification

Once setup is complete, check everything:
```
:checkhealth
:Lazy
:Mason
:Telescope find_files
:Neotree
:Alpha
```

You should see:
- Green/yellow Alpha dashboard
- Working LSP diagnostics and inline messages
- Autocompletion from nvim-cmp + LuaSnip
- Catppuccin theme
