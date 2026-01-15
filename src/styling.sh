# --- Color Definitions --- #

# Reset
NC='\e[0m'       # No Color

# Regular Colors
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'

# Bold Colors
BRED='\e[1;31m'
BGREEN='\e[1;32m'
BYELLOW='\e[1;33m'
BBLUE='\e[1;34m'
BPURPLE='\e[1;35m'
BCYAN='\e[1;36m'
BWHITE='\e[1;37m'

# Background Colors
BG_RED='\e[41m'
BG_GREEN='\e[42m'
BG_YELLOW='\e[43m'
BG_BLUE='\e[44m'

# Function for fancy headers
print_header() {
    local tekst="$1"
    echo -e "\n${BCYAN}========================================================================${NC}"
    echo -e "${BCYAN}  ${BWHITE}$tekst${NC}"
    echo -e "${BCYAN}========================================================================${NC}"
}

# Function for staus updates
print_status() {
    echo -e "${BYELLOW}[WAIT]${NC} $1..."
}

# Function for "Success" mesages
print_success() {
    echo -e "${BGREEN}[ OK ]${NC} $1"
}

# Function for error messages
print_error() {
    echo -e "${BRED}[FAIL]${NC} $1"
}

print_info() {
	echo -e "${BBLUE}[ INFO ] ${NC} $1"
}

# Function for user input (Questions)
ask_question() {
    local sporsmal="$1" # Double quotes to account for spaces.
    local prompt
    prompt=$(printf "${BYELLOW}>> %s (y/n): ${NC}" "$sporsmal")
    read -p "$prompt" svar
    echo "$svar"
}


