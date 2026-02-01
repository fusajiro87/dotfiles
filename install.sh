#!/bin/bash
set -e

echo "▶ Dotfiles install (minimal)"

# -------------------------------
# Package manager detection
# -------------------------------
if command -v pacman >/dev/null; then
  PKG_INSTALL="sudo pacman -S --needed --noconfirm"
else
  echo "❌ Only Arch Linux is supported right now"
  exit 1
fi

# -------------------------------
# Required packages
# -------------------------------
$PKG_INSTALL git curl zsh kitty ttf-meslo-nerd fzf

# -------------------------------
# oh-my-zsh
# -------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# -------------------------------
# powerlevel10k
# -------------------------------
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# -------------------------------
# zsh plugins
# -------------------------------
PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$PLUGIN_DIR"

while read -r repo; do
  [ -z "$repo" ] && continue

  name="$(basename "$repo" .git)"

  if [ ! -d "$PLUGIN_DIR/$name" ]; then
    echo "🔌 Installing zsh plugin: $name"
    git clone "$repo" "$PLUGIN_DIR/$name"
  fi
done < zsh/plugins.txt


# -------------------------------
# Symlinks
# -------------------------------
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
mkdir -p "$HOME/.config"
ln -sf "$PWD/kitty" "$HOME/.config/kitty"

echo "✅ Done. Restart terminal."
