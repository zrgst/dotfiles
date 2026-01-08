# zrgst's Dotfiles

Dette er mine konfigurasjonsfiler for et modulært Hyprland-oppsett, optimalisert for både en **NVIDIA Desktop** og en **Intel ThinkPad Laptop**.

## Arkitektur
Systemet bruker `GNU Stow` for å håndtere symlinks og en modulær `source`-logikk i Hyprland for å skille mellom maskinvare.

- **Desktop:** Bruker NVIDIA-spesifikke miljøvariabler og fast skjermoppsett.
- **Laptop:** Bruker Intel/Mesa-variabler, touchpad-støtte og strømsparingsfunksjoner.

## Installasjon
1. Installer nødvendige pakker: `stow`, `hyprland`, `waybar`, `fuzzel`, `swww`.
2. Klone repoet: `git clone https://github.com/zrgst/dotfiles.git ~/dotfiles`
3. Gå til mappen: `cd ~/dotfiles`
4. Bruk Stow: `stow hyprland waybar fuzzel`

## Bytte mellom Laptop og Desktop
Åpne `~/.config/hypr/hyprland.conf` og kommenter inn/ut de relevante linjene under maskinspesifikk konfigurasjon:

```hyprlang
# For Laptop:
source = ~/.config/hypr/zrgst/monitors_laptop.conf
source = ~/.config/hypr/zrgst/input_laptop.conf
source = ~/.config/hypr/zrgst/env_laptop.conf

# For Desktop:
# source = ~/.config/hypr/zrgst/monitors_desktop.conf
# ... osv
