# Dotfiles

My Zsh, Kitty, and Powerlevel10k configuration files.

## 📦 Contents

- **zsh**
  - oh-my-zsh
  - powerlevel10k
  - plugins (autosuggestions, syntax highlighting, interactive-cd)
  - custom `update` command (replaces `sudo pacman -Syu` and `yay -Syu`)
- **kitty**
  - terminal configuration
  - theme
  - Nerd Font support
- **install.sh**
  - installs missing packages
  - clones required plugins and themes
  - creates symlinks

---

## Installation

```bash
git clone https://github.com/fusajiro87/dotfiles.git
cd dotfiles
chmod +x ./install.sh
./install.sh
```

## Usage

After installation, simply open Kitty.
You may optionally set it as your default terminal.

That's it.

##### Fastfetch image

You can find the fastfetch image in `~/dotfiles/assets/`.
You can replace it with your own picture (named `picture.png`).

For reliable image rendering, the file **must be a PNG**.

If the image does not fit your terminal, you can adjust it in
`~/dotfiles/zsh/.zshrc` using the `--logo-padding` and `--logo-width`
options (around line 53).
