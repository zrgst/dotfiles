#!/usr/bin/env bash

source ./src/styling.sh
source ./src/packages.sh

###################################################
##  SCRIPT FOR INSTALLING MY OPTIMAL ARCH-LINUX  ##
##  SETUP WITH MY DOTFILES. OPTIMIZED FOR ME.    ##
##                                      /zrgst   ##
###################################################

# My logo for fancyness
echo -ne "${YELLOW}"
cat zrgst.txt
echo -ne "${NC}"
print_header "Welcome to Zrgst's dotfiles installer"

print_status "Checking for AUR-helper (paru/yay)..."
# 1. Check for AUR-helper
if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
    print_success "Found 'paru'"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
    print_success "Found 'yay'"
else
    print_error "No AUR-helper found..."
    print_status "Installing paru before continuing..."
    #	sudo pacman -S --needed base-devel
    #	git clone https://aur.archlinux.org/paru.git /tmp/paru
    #	cd /tmp/paru && makepkg -si --noconfirm
    AUR_HELPER="paru"
#	cd ~/dotfiles
fi

print_success "paru successfully installed!"

# 2. Installing system packages (needed for dotfiles)
print_status "Installing system packages with $AUR_HELPER..."
#$AUR_HELPER -S --needed --noconfirm $SYS_PKGS
print_success "Finished installing system packages.."

# Installing the software packages
ask_question "Would you like to install optional software?"
if [ "$svar" == "y" ]; then
    print_status "Installing optional software..."
    #	$AUR_HELPER -S --needed --noconfirm $SW_PKGS
    print_success "Optional software installed!"
else
    print_success "Skipping optional software..."
    sleep 0.4
fi

# 3. Spesifikk maskinvare-håndtering
ask_question "Are you installing on a laptop?"
if [ "$svar" == "y" ]; then
    print_status "Installing laptop-specific packages..."
#	sudo pacman -S --needed --noconfirm $LAPTOP_PKGS
else
    print_success "No laptop specific packages needed..."
    sleep 0.3
fi

ask_question "Do you have a Nvidia GPU?"
if [ "$svar" == "y" ]; then
    print_status "Installing NVIDIA specific packages..."
    #	sudo pacman -S --needed --noconfirm $NVIDIA_PGKS
    print_success "NVIDIA packages installed!"
else
    print_status "Installing AMD specific packages..."
    #	sudo pacman -S --needed --noconfirm $AMD_PKGS
    print_success "AMD packages installed!"
fi

ask_question "Would you like to install Gaming packages?"
if [ "$svar" == "y" ]; then
    print_status "Installing Gaming packages..."
    #$AUR_HELPER -S --needed --noconfirm $GAMING_PACKAGES
    print_success "Gaming packages installed!"
else
    print_success "OK, skipping Gaming packages..."
fi

# 4. Aktiver tjenester
#sudo systemctl enable --now tailscaled
#sudo systemctl enable --now avahi-daemon

# 5. Stow
print_status "Generating symlinks with GNU Stow..."
#cd ~/dotfiles
#stow alacritty fuzzel ghostty hyprland mako \
#	terminal waybar zrgst

print_success "Installasjon finished!"
print_info "Remember to check hyprland.conf to set laptop/desktop settings"
print_info "And don't forget to reboot system after!"
print_success "Enjoy your new setup!  -Zrgst"
print_info "Thanks for using my installer!"
