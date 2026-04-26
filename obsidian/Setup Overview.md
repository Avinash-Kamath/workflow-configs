---
tags: [neovim, setup, kickstart]
---

# Neovim Setup Overview

## What I'm Using

**Config**: [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — a minimal, single-file starting config you can read line by line and understand completely.

**Config location**: `~/.config/nvim/init.lua`

**Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) — auto-installed on first launch.

---

## Key Settings

| Setting | Value | What it does |
|---|---|---|
| Leader key | `<Space>` | Prefix for most custom keymaps |
| Line numbers | On | Shows line numbers |
| Relative numbers | Off (commented) | Can enable with `vim.o.relativenumber = true` |
| Mouse | Enabled | Useful for resizing splits |
| Clipboard | OS synced | Copy/paste works with system clipboard |
| Undo file | On | Undo history persists after closing a file |
| Nerd Font | **false** | Change to `true` once you install a Nerd Font |
| Colorscheme | tokyonight-night | |
| Scroll offset | 10 lines | Keeps 10 lines visible above/below cursor |

---

## Installed Plugins

See [[Plugins]] for details on each plugin.

| Plugin | Purpose |
|---|---|
| lazy.nvim | Plugin manager |
| guess-indent | Auto-detects indentation style |
| gitsigns | Git change indicators in the gutter |
| which-key | Shows available keymaps as you type |
| telescope | Fuzzy finder for files, grep, LSP, help |
| nvim-lspconfig | Language Server Protocol (code intelligence) |
| mason | Installs LSP servers and tools |
| fidget | LSP loading progress indicator |
| conform | Code formatting |
| blink.cmp | Autocompletion |
| LuaSnip | Snippet engine |
| tokyonight | Colorscheme |
| todo-comments | Highlights `TODO:`, `FIXME:`, `NOTE:` in code |
| mini.ai | Better text objects (select around/inside) |
| mini.surround | Add/change/delete brackets, quotes |
| mini.statusline | Simple status bar at the bottom |
| nvim-treesitter | Better syntax highlighting |

### Optional Plugins (not yet enabled)
These are in your config but commented out. Uncomment to enable:
- `debug` — DAP debugger UI
- `indent_line` — indent guides
- `lint` — linting support
- `autopairs` — auto-close brackets/quotes
- `neo-tree` — file tree sidebar
- `gitsigns` (extended) — git hunk keymaps

---

## LSP Servers Configured

Only `lua_ls` (Lua) and `stylua` (Lua formatter) are active by default.

To add more languages, uncomment them in `init.lua` around line 602:
```lua
local servers = {
  -- gopls = {},      -- Go
  -- pyright = {},    -- Python
  -- rust_analyzer = {},
  -- ts_ls = {},      -- TypeScript/JavaScript
}
```

---

## Next Steps

- [ ] Run `:Tutor` to learn basic Neovim navigation
- [ ] Install a [[Nerd Font]] for better icons
- [ ] Add an LSP server for your primary language
- [ ] Learn the [[Keymaps]] for your config

---

## Fresh Machine Setup

Everything needed to restore this config on a new machine.

### Brew dependencies

```bash
# Git diff pager — side-by-side diffs with syntax highlighting
brew install git-delta

# Git TUI (opened via <leader>tg in Neovim)
brew install lazygit

# Nerd Font for Neovide (GUI only — terminal uses its own font setting)
brew install --cask font-jetbrains-mono-nerd-font
```

### Neovim plugins

Run `:Lazy sync` after cloning the config. Plugins installed in `~/.config/nvim/lua/custom/plugins/`:

| Plugin | What it does |
|---|---|
| `satellite.nvim` | Error/warning bands in the scrollbar (like VS Code) |
| `nvim-ufo` | Better LSP + treesitter folding with fold count display |
| `vim-illuminate` | Highlights all other uses of the word under the cursor |
| `toggleterm.nvim` | Floating/split terminal + lazygit launcher |
| `baleia.nvim` | ANSI colour rendering in DAP repl buffer |

### Keymaps added by custom plugins

| Key | Action |
|---|---|
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Floating terminal |
| `<leader>th` | Horizontal split terminal |
| `<leader>tv` | Vertical split terminal |
| `<leader>tg` | Open lazygit (fullscreen float) |
| `zp` | Peek inside a fold without opening it |
| `zR` / `zM` | Open / close all folds |

### Lazygit config

Location: `~/Library/Application Support/lazygit/config.yml`

Configured with:
- tokyonight-night theme
- Nerd Fonts v3 icons
- Commit graph (topology ordered)
- Delta as diff pager (reads settings from `~/.gitconfig`)

> If delta stops working in lazygit, check the config file — a YAML linter may have changed `paging` (map) to `pagers` (list). It must be `paging`.

### Git config (`~/.gitconfig`)

Delta is set as the global git pager — applies to `git diff`, `git show`, `git log -p`, and lazygit.

Features enabled:
- Side-by-side diff view
- Word-level highlights within changed lines
- `n` / `N` to jump between hunks
- tokyonight colours (red/green line numbers, blue file headers, purple hunk headers)

### Neovide

Requires **JetBrainsMono Nerd Font** — install via `brew install --cask font-jetbrains-mono-nerd-font`. Without it, Neovide throws a font loading error on startup.

### Fixing a broken plugin

If Lazy warns about local changes in a plugin directory:

```bash
cd ~/.local/share/nvim/lazy/<plugin-name>
git status

# Discard unintentional changes
git checkout -- .
git clean -fd

# If the repo itself is broken, delete and let Lazy reinstall
rm -rf ~/.local/share/nvim/lazy/<plugin-name>
# Then run :Lazy restore in Neovim
```
