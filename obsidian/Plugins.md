---
tags: [neovim, plugins]
---

# Plugins

All plugins are managed by **lazy.nvim** and configured in `~/.config/nvim/init.lua`.

Run `:Lazy` to see status, update, or install plugins.

---

## Plugin Manager

### lazy.nvim
Auto-installed on first launch. Handles installing, updating, and lazy-loading plugins.

**Commands:**
- `:Lazy` — open the UI
- `:Lazy update` — update all plugins
- `:Lazy sync` — install missing + update + clean

---

## Core Plugins

### which-key
Shows a popup of available keymaps when you start a key sequence and pause.

Press `<Space>` and wait ~300ms to see it in action.

---

### Telescope
Fuzzy finder for everything — files, grep, LSP symbols, help, commands.

See [[Keymaps#File & Project Search (Telescope)]] for all keymaps.

Inside a Telescope window:
- `<C-/>` (insert mode) or `?` (normal mode) — show available actions

Dependencies:
- `telescope-fzf-native` — faster fuzzy matching (requires `make`)
- `telescope-ui-select` — uses Telescope for `vim.ui.select` popups
- `nvim-web-devicons` — file icons (only if Nerd Font is enabled)

---

### nvim-treesitter
Provides accurate syntax highlighting and indentation using language-specific parsers.

Pre-installed parsers: `bash`, `c`, `diff`, `html`, `lua`, `markdown`, `vim`, `vimdoc`.

Other parsers are auto-installed when you open a file of that type.

---

### blink.cmp
Autocompletion plugin. Sources completions from LSP, file paths, and snippets.

Paired with **LuaSnip** for snippet support.

See [[Keymaps#Autocompletion (blink.cmp)]] for keymaps.

---

### conform.nvim
Code formatter. Currently configured to format on save only for explicitly listed filetypes (none by default).

To enable format-on-save for a language, add it to `enabled_filetypes` in `init.lua`:
```lua
local enabled_filetypes = {
  lua = true,
  python = true,
}
```

Manual format: `<leader>f`

---

## LSP Stack

### mason.nvim
Installs and manages LSP servers, formatters, and linters.

**Commands:**
- `:Mason` — open the UI to browse/install tools
- Press `g?` inside Mason for help

### nvim-lspconfig
Configures language servers once they're installed.

Currently active servers:
- `lua_ls` — Lua language server
- `stylua` — Lua formatter

To add a language server, uncomment it in `init.lua` around line 602.

### fidget.nvim
Shows LSP loading progress (small spinner in the bottom right).

---

## Utility Plugins

### gitsigns.nvim
Shows git change indicators (`+`, `~`, `_`) in the sign column (left gutter).

### guess-indent.nvim
Auto-detects whether a file uses tabs or spaces, and how many spaces per indent.

### todo-comments.nvim
Highlights special comment keywords in code:
- `TODO:` — blue
- `FIXME:` — red
- `NOTE:` — yellow
- `HACK:`, `WARN:`, `PERF:`

### mini.nvim (three modules in use)

**mini.ai** — Smarter text objects. Lets you select/change/delete around or inside many types of delimiters, not just brackets.

**mini.surround** — Add, change, or remove surrounding characters (brackets, quotes, tags).

**mini.statusline** — Clean status bar at the bottom showing mode, file, cursor position.

---

## Colorscheme

### tokyonight.nvim
Active style: `tokyonight-night`

Other styles available: `tokyonight-storm`, `tokyonight-moon`, `tokyonight-day`

Switch by changing this line in `init.lua`:
```lua
vim.cmd.colorscheme 'tokyonight-night'
```

---

## Optional Plugins (commented out)

These are included in the kickstart repo but not enabled. To enable, uncomment the relevant `require` line at the bottom of `init.lua`:

| Plugin | What it adds |
|---|---|
| `kickstart.plugins.debug` | Debugger UI (DAP) |
| `kickstart.plugins.indent_line` | Visual indent guides |
| `kickstart.plugins.lint` | Linting (nvim-lint) |
| `kickstart.plugins.autopairs` | Auto-close `(`, `[`, `{`, `"` |
| `kickstart.plugins.neo-tree` | File tree sidebar |
| `kickstart.plugins.gitsigns` | Extended git hunk keymaps |

---

## Future Plugins to Add

| Plugin | What it adds | Priority |
|---|---|---|
| `folke/flash.nvim` | Jump to any visible position in 4 keystrokes — type `s` + 2 chars, press the label. Treesitter-aware, works as a motion. | High |
| `ThePrimeagen/harpoon` (v2) | Pin 4-5 files and switch between them instantly with a keymap. | Medium |
| `sindrets/diffview.nvim` | Side-by-side git diffs, file history, inline merge conflict resolution. | Medium |
| `kevinhwang91/nvim-ufo` | Better LSP + treesitter folding with fold count display. | Low |
| `RRethy/vim-illuminate` | Highlights all other uses of the word under the cursor (like VS Code). Zero config. | Low |
| `kylechui/nvim-surround` | Add/change/delete surrounding brackets, quotes, tags. `cs"'` → `"foo"` becomes `'foo'`. | Low |
| `akinsho/toggleterm.nvim` | Floating/split terminal with a keybind. Works well with baleia.nvim for ANSI colours. | Low |

---

## Adding Your Own Plugins

Place custom plugin files in `~/.config/nvim/lua/custom/plugins/` and uncomment this line at the bottom of `init.lua`:
```lua
{ import = 'custom.plugins' },
```

Each `.lua` file in that folder returns a plugin spec table.
