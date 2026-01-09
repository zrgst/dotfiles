# zrgst's Dotfiles

Dette er mine konfigurasjonsfiler for et modulært Hyprland-oppsett, optimalisert for både en **NVIDIA Desktop** og en **Intel ThinkPad Laptop**.

## Arkitektur
Systemet bruker `GNU Stow` for å håndtere symlinks og en modulær `source`-logikk i Hyprland for å skille mellom maskinvare.

- **Desktop:** Bruker NVIDIA-spesifikke miljøvariabler og fast skjermoppsett.
- **Laptop:** Bruker Intel/Mesa-variabler, touchpad-støtte og strømsparingsfunksjoner.

## Installasjon
1. Klone repoet: `git clone https://github.com/zrgst/dotfiles.git ~/dotfiles`
2. Gå til mappen: `cd ~/dotfiles`
3. Kjør install.sh (installerer dependencies og kjører 'stow' på alle pakkene.)

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
```

## ToDo:

- Verifiser at alle nødvendige pakker er med i install.sh
- Verifiser navn på alle pakker. Prioriter arch pakker over AUR
- Sjekk hvrodan starte btop i kitty direkte.
- Sjekk om fuzzle kan brukes som clipboard-manager (som walker kan)
  - Hvis ikke legg inn walker som dependencies. (uten elephant??)
- Gå gjennom alle filer og sjekk at riktig font er brukt.
  - Sørg for at Font er med i dependencies.
- Skriv om resterende meny-script så de kan brukes med fuzzel
- Sjekk om meny script skal gå over til annen metode (med .txt fil )
- Feilsøk hvorfor ikke workspaces på waybar endrer seg etter hvilket workpsace vi er på.
- Endre scratchpad "cmus" til å bruke kitty.
- Finn et mer passende theme til cmus.
- Legg Cmus config inn i dotfiles.
- Legge til en brannmur også? ufw? kjekt å ha.

- Når alt dette er gjort er jeg klar til å teste det ut live på laptopen min.
- Reinstall av main-PC gjøres når dotfiles er ferdig.
