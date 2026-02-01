# 🧰 Dotfiles

Saját Linux környezetem konfigurációi (zsh, kitty, powerlevel10k),  
elsősorban **Arch Linux**-ra optimalizálva.

A cél:
- biztonsági mentés GitHubra
- új gépen gyors újraépítés
- minimális varázslat, maximális átláthatóság

---

## 📦 Tartalom

- **zsh**
  - oh-my-zsh
  - powerlevel10k
  - pluginok (autosuggestions, syntax highlighting, interactive-cd)
  - saját helper függvények (`update`)
- **kitty**
  - terminal config
  - egyedi színtéma
  - Nerd Font támogatás
- **install.sh**
  - hiányzó csomagok telepítése
  - pluginok és theme-ek klónozása
  - symlinkek létrehozása

---

## 🚀 Telepítés új gépen

```bash
git clone https://github.com/fusajiro87/dotfiles.git
cd dotfiles
chmod +x ./install.sh
./install.sh
exec zsh
