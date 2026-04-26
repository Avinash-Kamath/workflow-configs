---
tags: [config, workflow, repo]
---

# Workflow Configs

All development configs are stored in a single Git repository.

**Repo**: [Avinash-Kamath/workflow-configs](https://github.com/Avinash-Kamath/workflow-configs)
**Local path**: `~/workflow-configs/`

## Configs Included

- **Neovim** — `nvim/` (see [[Setup Overview]] for details)
- **Lazygit** — `lazygit/config.yml` (tokyonight theme, delta pager)
- **Git** — `git/gitconfig` (delta as core pager, tokyonight colours)

## How It Works

Configs live in the repo. `setup.sh` symlinks them to their expected system locations:

| Repo path | Symlinked to |
|-----------|-------------|
| `nvim/` | `~/.config/nvim` |
| `lazygit/config.yml` | `~/Library/Application Support/lazygit/config.yml` |
| `git/gitconfig` | `~/.gitconfig` |

Edit configs normally (e.g. open `~/.config/nvim/init.lua`). Changes go directly into the repo — just `cd ~/workflow-configs && git commit`.

## Fresh Machine Restore

```bash
git clone https://github.com/Avinash-Kamath/workflow-configs.git ~/workflow-configs
cd ~/workflow-configs && ./setup.sh
```

Then run `:Lazy sync` in Neovim. See [[Setup Overview#Fresh Machine Setup]] for the full brew dependency list.
