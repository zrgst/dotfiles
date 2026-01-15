
# Disse er nødvendige for at dotfiles skal fungere som det skal etter
# installasjon, ikke fjern noe her. Legg til dine egne pakker i 'CUSTOM_PKGS'
SYS_PKGS=(
	"hyprland"
	"waybar"
	"mako"
	"ghostty"
	"thunar"
	"git"
	"stow"
	"brightnessctl"
	"btop"
	"swww"
	"ttf-jetbrains-mono-nerd"
	"papirus-icon-theme"
	"grim-git"
	"slurp-git"
	"grimblast-git"
	"cliphist"
	"wl-clipboard"
	"polkit-kde-agent"
	"mako"
	"blueman"
	"xdg-desktop-portal-hyprland"
	"xdg-desktop-portal-gtk"
	"tailscale-git"
	"morgen-bin"
	"cmus-git"
	"avahi"
	)

# Pakker relatert til koding, disse blir bare installert hvis du svarer "ja" på spørsmålet om
# koding-pakker.
DEV_PKGS=(
	"neovim"
	"gcc"
	"python-pip"
	"rustup"
	)

# Software pakker, dette er software som jeg synes MÅ være i et linux system, disse er også valgfrie.
# Du vil bli promptet om du vil installere disse i install scriptet
SW_PKGS=(
	"vesktop"
	"carburetor"
	"cmus-git"
	"zen-browser-bin"
	)

	# MÅ REVIDERES!!!
LAPTOP_PKGS=(
	"libva-intel-driver"
	"mesa"
	)

	# MÅ REVIDERES!!
DESKTOP_PKGS=(
	"nvidia-utils"
	"nvidia-settings"
	"libva-nvidia-driver"
	)

	# MÅ REVIDERES!
NVIDIA_PKGS=(
	"blabla"
	)

	# MÅ REVIDERES!
AMD_PKGS=(
	"zugzug"
	)	


CUSTOM_PKGS=(
	# Legg til dine pakker her.
	)
