#!/bin/bash

# Farger for penere output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starter installasjon av zrgst's dotfiles...${NC}"

# 1. Installer base-pakker (CachyOS/Arch)
echo -e "${GREEN}Installerer systempakker...${NC}"
sudo pacman -S --needed --noconfirm \
    hyprland swww waybar fuzzel \
    thunar gvfs-smb gvfs-dnssd avahi \
    stow git tailscale brightnessctl \
    ttf-golos-text otf-font-awesome papirus-icon-theme \
    alacritty # eller din foretrukne terminal

# 2. Spesifikk maskinvare-håndtering
echo -e "${BLUE}Er dette en laptop? (y/n)${NC}"
read -r is_laptop

if [ "$is_laptop" == "y" ]; then
    echo -e "${GREEN}Installerer laptop-spesifikke pakker...${NC}"
    sudo pacman -S --needed --noconfirm libva-intel-driver mesa
else
    echo -e "${GREEN}Installerer desktop-spesifikke pakker (Nvidia)...${NC}"
    sudo pacman -S --needed --noconfirm nvidia-utils nvidia-settings libva-nvidia-driver
fi

# 3. Aktiver nødvendige tjenester
echo -e "${GREEN}Aktiverer systemtjenester...${NC}"
sudo systemctl enable --now tailscaled
sudo systemctl enable --now avahi-daemon

# 4. Kjør GNU Stow
echo -e "${GREEN}Oppretter symlinks med GNU Stow...${NC}"
cd ~/dotfiles
stow hyprland
stow waybar
stow fuzzel

echo -e "${BLUE}Installasjon ferdig! Husk å sjekke hyprland.conf for laptop/desktop-sources.${NC}"
