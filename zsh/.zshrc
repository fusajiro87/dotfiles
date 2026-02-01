typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


# ==========================================================
# Powerlevel10k instant prompt (MINDIG LEGFELÜL!)
# ==========================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================================
# Oh My Zsh alapok
# ==========================================================
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

# ==========================================================
# Powerlevel10k konfiguráció
# ==========================================================
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ==========================================================
# Custom helper functions / aliases
# (mindig OMZ UTÁN)
# ==========================================================

update() {
  echo "📦 Pacman frissítés..."
  sudo pacman -Syu || return 1

  if command -v yay >/dev/null; then
    echo "🧩 AUR frissítés..."
    yay -Syu
  fi
}

# ==========================================================
# Run fastfetch AFTER prompt initialization (p10k-safe)
# ==========================================================
FASTFETCH_IMAGE="$HOME/.config/dotfiles/assets/picture.png"

if [[ $- == *i* ]] && command -v fastfetch >/dev/null && [[ -f "$FASTFETCH_IMAGE" ]]; then
  fastfetch --logo "$FASTFETCH_IMAGE" --logo-padding 5 --logo-width 45
fi

