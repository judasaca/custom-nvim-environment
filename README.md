# custom-nvim-environment

My Neovim configuration, built on [lazy.nvim](https://github.com/folke/lazy.nvim) with Mason for language servers.

These instructions are for **Ubuntu** (tested on 26.04, x86_64).

## Requirements

- Neovim **0.11 or newer**. The config uses `vim.lsp.config` / `vim.lsp.enable`, which older versions don't have.
- `git`, `curl`, `unzip`
- `gcc` and `make`: build `telescope-fzf-native` and the treesitter parsers
- `ripgrep`: Telescope live grep
- `fd`: Telescope and venv-selector
- `lazygit`: `<leader>lg`
- Node.js and npm: Mason installs many LSPs and prettier through npm. [nvm](https://github.com/nvm-sh/nvm) works fine.
- Python 3 with `venv`: Mason installs pyright, ruff and mypy into virtualenvs
- `xclip`: system clipboard support

## Setup

### 1. Install system packages

```bash
sudo apt update
sudo apt install -y git curl unzip build-essential ripgrep fd-find lazygit python3-venv xclip
```

Ubuntu names the `fd` binary `fdfind`. Link it as `fd`, because venv-selector calls `fd` directly:

```bash
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd
```

### 2. Install Neovim

Ubuntu's packaged Neovim may be too old, so install the official release into your home directory (no sudo needed):

```bash
mkdir -p ~/.local/opt ~/.local/bin
cd ~/.local/opt
curl -fsSLo nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf nvim-linux-x86_64 && tar xzf nvim.tar.gz && rm nvim.tar.gz
ln -sf ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
nvim --version | head -1
```

To upgrade later, run the same commands again.

`~/.local/bin` must be on your `PATH`. Ubuntu's default `~/.profile` adds it if the directory exists when you log in. Otherwise, add this to `~/.bashrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### 3. Clone the config

Move any existing config out of the way first:

```bash
[ -e ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/judasaca/custom-nvim-environment.git ~/.config/nvim
```

### 4. Install plugins and treesitter parsers

The first launch bootstraps lazy.nvim on its own. To install every plugin at the versions pinned in `lazy-lock.json` in one go:

```bash
nvim --headless "+Lazy! restore" +qa
```

This also compiles the treesitter parsers listed in `lua/plugins/treesitter.lua`.

### 5. Install language servers and tools

The LSPs in `lua/plugins/lsp-config.lua` (`ensure_installed`) install automatically the first time you start Neovim. Wait until Mason finishes; `:Mason` shows progress.

Some tools are used by the config but aren't in `ensure_installed`, so install them by hand from inside Neovim:

```vim
:MasonInstall pyright ruff prettier stylua mypy
```

- `pyright`, `ruff`: Python LSPs (enabled in `lsp-config.lua`)
- `prettier`, `ruff`: formatters for conform.nvim (`formatting.lua`)
- `stylua`, `prettier`, `mypy`: used by none-ls (`none-ls.lua`)

### 6. Make `vim` open Neovim (optional)

Running `vim` starts Ubuntu's Vim, which doesn't read this config. To make `vim`/`vi` open Neovim and make it the default editor (for `git commit` and similar), add this to `~/.bash_aliases`:

```bash
alias vim='nvim'
alias vi='nvim'
export EDITOR=nvim
export VISUAL=nvim
```

If `~/.bashrc` sets `EDITOR` itself (for example `export EDITOR='vim'`), change it there too. `~/.bashrc` loads `~/.bash_aliases` partway through, so a later line overrides it.

Then run `source ~/.bashrc` or open a new terminal.

The aliases don't apply under `sudo`. To edit a root-owned file with this config, use `sudoedit <file>`.

### 7. Sign in to Copilot

```vim
:Copilot setup
```

## Checking the install

```vim
:checkhealth
:Lazy
:Mason
```

`:checkhealth lazy` warns that luarocks isn't installed. You can ignore it, because no plugin here needs luarocks.

## Known issues

- **sqlls crashes on start.** The `sql-language-server` package in Mason fails with `ERR_PACKAGE_PATH_NOT_EXPORTED` because of a broken dependency upstream, and the package looks unmaintained. Only SQL files are affected. Remove `"sqlls"` from `ensure_installed` or swap in another SQL server if it bothers you.
- **npm skips sqlite3's install script** while installing sqlls. That only matters for SQLite connections in sqlls.
