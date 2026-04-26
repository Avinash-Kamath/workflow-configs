#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

backup_and_link() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        echo "  Already symlinked: $dest"
        return
    fi

    if [ -e "$dest" ]; then
        echo "  Backing up: $dest -> ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "  Linked: $dest -> $src"
}

echo "Setting up symlinks..."
backup_and_link "$REPO_DIR/nvim"              "$HOME/.config/nvim"
backup_and_link "$REPO_DIR/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
backup_and_link "$REPO_DIR/git/gitconfig"     "$HOME/.gitconfig"

echo ""
echo "Done. Open Neovim and run :Lazy sync to install plugins."
