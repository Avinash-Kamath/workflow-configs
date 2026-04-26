# Workflow Configs

Personal development environment configs — Neovim, Lazygit, and Git.

## What's Here

| Directory | Config | System path |
|-----------|--------|-------------|
| `nvim/` | Neovim | `~/.config/nvim` |
| `lazygit/` | Lazygit TUI | `~/Library/Application Support/lazygit/config.yml` |
| `git/` | Git (delta pager) | `~/.gitconfig` |

## Neovim

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with custom plugins in `nvim/lua/custom/plugins/`:

| Plugin | Purpose |
|--------|---------|
| baleia.nvim | ANSI colour rendering in DAP repl |
| bufferline.nvim | Tab-like buffer line |
| copilot.lua | GitHub Copilot |
| dap-breakpoints | Persistent DAP breakpoints |
| dap-python | Python debug adapter |
| devicons | File type icons |
| go.lua | Go development |
| illuminate | Highlight word under cursor |
| persistence | Session persistence |
| satellite.nvim | Scrollbar with error/warning bands |
| toggleterm.nvim | Floating/split terminal + lazygit launcher |
| trouble.nvim | Better diagnostics list |
| nvim-ufo | Better code folding with fold counts |

Plugin manager: lazy.nvim. Versions pinned in `nvim/lazy-lock.json`.

## Fresh Machine Setup

### Prerequisites

```bash
brew install neovim
brew install git-delta       # side-by-side diffs with syntax highlighting
brew install lazygit          # git TUI (opened via <leader>tg in Neovim)
brew install --cask font-jetbrains-mono-nerd-font  # for Neovide GUI
```

### Install

```bash
git clone https://github.com/Avinash-Kamath/workflow-configs.git ~/workflow-configs
cd ~/workflow-configs
chmod +x setup.sh
./setup.sh
```

Then open Neovim and run `:Lazy sync` to install all plugins.

### What `setup.sh` does

Creates symlinks from system config locations to this repo:

| Repo path | System location |
|-----------|----------------|
| `nvim/` | `~/.config/nvim` |
| `lazygit/config.yml` | `~/Library/Application Support/lazygit/config.yml` |
| `git/gitconfig` | `~/.gitconfig` |

Existing configs are backed up with a `.backup` suffix before linking.

## Note

`git/gitconfig` contains a user email address. Review and update the `[user]` section if you fork this repo.
