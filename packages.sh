
# Disse er nødvendige for at dotfiles skal fungere som det skal etter
# installasjon, ikke fjern noe her. Legg til dine egne pakker i 'CUSTOM_PKGS'
SYSTEM_PACKAGES=(
	"hyprland"
	"waybar"
	"mako"
	)

# Pakker relatert til koding, disse blir bare installert hvis du svarer "ja" på spørsmålet om
# koding-pakker.
DEV_PKGS=(
	"neovim"
	"gcc"
	"python-pip"
	)

# Software pakker, dette er software som jeg synes MÅ være i et linux system, disse er også valgfrie.
# Du vil bli promptet om du vil installere disse i install scriptet
SW_PKGS=(
	"vesktop"
	"carburetor"
	"cmus"
	)

CUSTOM_PKGS=(
	# Legg til dine pakker her.
	)
