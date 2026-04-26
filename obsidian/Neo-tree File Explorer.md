---
tags: [neovim, plugins, file-explorer]
---

# Neo-tree File Explorer

VS Code-like file explorer sidebar for Neovim.

## Toggle

| Key | Action |
|---|---|
| `\` | Open / close the file tree |

## Inside the Tree

| Key | Action |
|---|---|
| `Enter` | Open file / expand folder |
| `l` | Expand folder |
| `h` | Collapse folder |
| `a` | Create new file |
| `d` | Delete file |
| `r` | Rename file |
| `y` | Copy file |
| `p` | Paste file |
| `q` | Close neo-tree |
| `?` | Show all keymaps |

## Switching Focus

| Key | Action |
|---|---|
| `<C-l>` | Move focus to editor (right window) |
| `<C-h>` | Move focus back to tree (left window) |

## Tips

- Always open Neovim from your project folder: `cd myproject && nvim .`
- The tree shows the directory you launched Neovim from
- To change the root manually: `:Neotree dir=/path/to/project`

## Setup Notes

- Enabled by uncommenting `require 'kickstart.plugins.neo-tree'` in `init.lua`
- Required installing `tree-sitter` CLI via `npm install -g tree-sitter-cli` for treesitter parsers to compile
