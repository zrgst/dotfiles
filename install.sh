#!/bin/bash

# Farger for penere output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}Starter installasjon av zrgst's dotfiles...${NC}"

# 1. Finn AUR-hjelper
if command -v paru &>/dev/null; then
  AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
  AUR_HELPER="yay"
else
  echo -e "${RED}Ingen AUR-hjelper funnet (paru/yay). Installerer paru først...${NC}"
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  cd /tmp/paru && makepkg -si --noconfirm
  AUR_HELPER="paru"
  cd ~/dotfiles
fi

# 2. Installer systempakker (Pacman + AUR)
echo -e "${GREEN}Installerer systempakker via $AUR_HELPER...${NC}"
$AUR_HELPER -S --needed --noconfirm \
  hyprland waybar fuzzel kitty \
  thunar gvfs-smb gvfs-dnssd avahi \
  stow git brightnessctl btop swww\
  ttf-jetbrains-mono-nerd papirus-icon-theme \
  grim-git slurp-git grimblast-git \
  cliphist wl-clipboard polkit-kde-agent mako \
  blueman adwaita-icon-theme arc-gtk-theme \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk

# Installerer software (AUR-helper)
$AUR_HELPER -S --needed --noconfirm \
	zen-browser-bin tailscale cmus-git \
	morgen-bin vesktop carburetor




# 3. Spesifikk maskinvare-håndtering
echo -e "${BLUE}Er dette en laptop? (y/n)${NC}"
read -r is_laptop

if [ "$is_laptop" == "y" ]; then
  echo -e "${GREEN}Installerer laptop-spesifikke pakker...${NC}"
  sudo pacman -S --needed --noconfirm libva-intel-driver mesa
else
  echo -e "${GREEN}Installerer desktop-spesifikke pakker (Nvidia)...${NC}"
  sudo pacman -S --needed --noconfirm nvidia-utils nvidia-settings libva-nvidia-driver
fi

# 4. Aktiver tjenester
sudo systemctl enable --now tailscaled
sudo systemctl enable --now avahi-daemon

# 5. Stow
echo -e "${GREEN}Oppretter symlinks med GNU Stow...${NC}"
cd ~/dotfiles
stow alacritty cmus fish fuzzel ghostty hyprland
stow kitty mako nvim terminal waybar zrgst

echo -e "${BLUE}Ferdig! Husk å oppdatere 'zrgst/' filene i hyprland.conf.${NC}"
