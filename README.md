# neovim-config

Personal Neovim configuration, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Install

**Windows** (`%LOCALAPPDATA%\nvim`):

```powershell
git clone https://github.com/alperkpszoglu/neovim-config.git "$env:LOCALAPPDATA\nvim"
```

**Linux/macOS** (`~/.config/nvim`):

```sh
git clone https://github.com/alperkpszoglu/neovim-config.git ~/.config/nvim
```

Then launch `nvim` — lazy.nvim will bootstrap itself and install all plugins pinned in `lazy-lock.json`.
