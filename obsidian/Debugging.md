---
tags: [neovim, debugging, go, dap]
---

# Debugging

## Setup
- `nvim-dap` — core debug adapter protocol client
- `nvim-dap-ui` — debug UI (variables, stack, console)
- `nvim-dap-go` — Go specific config using delve
- `persistent-breakpoints.nvim` — saves breakpoints across sessions

## Important Notes
- Uses system delve at `~/go/bin/dlv` (v1.25.2) — Mason's newer version doesn't work
- `mason-nvim-dap` is disabled for delve to prevent it overriding the version
- launch.json must be strict JSON — no `//` comments, no trailing commas

## Keymaps

| Key | Action |
|---|---|
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |
| `<F5>` | Start / continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle debug UI |

## launch.json
Located at `.vscode/launch.json` in the project root.

Rules:
- No `//` comments (nvim-dap uses strict JSON, unlike VS Code)
- No trailing commas
- Use `"cwd": "${workspaceFolder}"` so delve runs from the right directory
- Use package path for `program`, not file name (e.g. `github.com/scalekit-inc/scalekit`)

## Starting a Debug Session
1. Set breakpoint with `<leader>b` (red dot appears in gutter)
2. Press `<F5>` — select config from menu (e.g. Server Debug)
3. UI opens automatically when breakpoint hits
4. `<F2>` step over, `<F1>` step into, `<F5>` continue, `<F3>` step out
5. `<F7>` to toggle the debug UI panel
