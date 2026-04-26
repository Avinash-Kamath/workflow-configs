---
tags: [neovim, keymaps, reference]
---

# Keymaps Cheat Sheet

Leader key = `<Space>`

> Tip: Press `<Space>` and wait — **which-key** will pop up and show available keymaps.

---

## Essential Vim Basics

| Key | Action |
|---|---|
| `i` | Enter Insert mode |
| `<Esc>` | Return to Normal mode (also clears search highlights) |
| `h j k l` | Move left / down / up / right |
| `w` / `b` | Next / previous word |
| `0` / `$` | Start / end of line |
| `gg` / `G` | Top / bottom of file |
| `u` | Undo |
| `<C-r>` | Redo |
| `yy` | Yank (copy) line |
| `dd` | Delete line |
| `p` | Paste |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |

---

## Search

| Key | Action |
|---|---|
| `/pattern` | Search forward |
| `n` / `N` | Next / previous match |
| `<Esc>` | Clear search highlights |
| `<leader>/` | Fuzzy search in current file |

---

## File & Project Search (Telescope)

| Key | Action |
|---|---|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep (search text in project) |
| `<leader>sw` | Search word under cursor |
| `<leader>s.` | Recent files |
| `<leader><leader>` | Switch between open buffers |
| `<leader>sh` | Search help docs |
| `<leader>sk` | Search keymaps |
| `<leader>sc` | Search commands |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>sn` | Search Neovim config files |

---

## LSP (Code Intelligence)

> These work when a language server is active for the file.

| Key | Action |
|---|---|
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | Find references |
| `grd` | Go to definition |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grD` | Go to declaration |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover documentation |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>q` | Open diagnostics in quickfix list |
| `<leader>th` | Toggle inlay hints |

---

## Formatting

| Key | Action |
|---|---|
| `<leader>f` | Format current buffer |

---

## Windows / Splits

| Key | Action |
|---|---|
| `<C-h>` | Focus left window |
| `<C-l>` | Focus right window |
| `<C-j>` | Focus lower window |
| `<C-k>` | Focus upper window |
| `:split` | Horizontal split |
| `:vsplit` | Vertical split |
| `:q` | Close split |

---

## Autocompletion (blink.cmp)

> These work while the completion menu is open (Insert mode).

| Key | Action |
|---|---|
| `<C-n>` / `<C-p>` | Next / previous item |
| `<C-y>` | Accept completion |
| `<C-e>` | Close menu |
| `<C-space>` | Open menu / show docs |
| `<C-k>` | Toggle signature help |

---

## Git (gitsigns)

| Key | Action |
|---|---|
| `<leader>h` | Git hunk actions (press and wait for which-key) |

---

## Surround (mini.surround)

| Key | Action | Example |
|---|---|---|
| `sa` | Add surround | `saiw)` → surround word with `()` |
| `sd` | Delete surround | `sd'` → remove `'` around word |
| `sr` | Replace surround | `sr)'` → change `()` to `''` |

---

## Text Objects (mini.ai)

| Key | Action | Example |
|---|---|---|
| `va)` | Select **a**round paren | selects including `()` |
| `vi)` | Select **i**nside paren | selects content only |
| `ci'` | **C**hange **i**nside single quote | |
| `da"` | **D**elete **a**round double quote | |

---

## Misc

| Key | Action |
|---|---|
| `<Esc><Esc>` | Exit terminal mode |
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP/tool installer |
| `:checkhealth` | Check for config issues |
| `:Tutor` | Built-in Neovim tutorial |
