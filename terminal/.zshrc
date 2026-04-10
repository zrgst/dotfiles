# =========================================================
# ~/.zshrc
# Ryddig zsh-versjon av din nåværende .bashrc
# =========================================================

# ---------------------------------------------------------
# PATH
# Legger til lokal bin-mappe først i PATH
# ---------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------
# History
# Zsh bruker egne variabler og options for historikk
# ---------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=10000

# Zsh-history options som tilsvarer bash-oppsettet ditt best mulig
setopt APPEND_HISTORY           # legg til historikk, ikke overskriv
setopt INC_APPEND_HISTORY       # skriv historikk fortløpende
setopt SHARE_HISTORY            # del history mellom shells
setopt HIST_IGNORE_DUPS         # ignorer direkte duplikater
setopt HIST_IGNORE_ALL_DUPS     # fjern eldre duplikater
setopt HIST_SAVE_NO_DUPS        # ikke lagre duplikater
setopt HIST_REDUCE_BLANKS       # fjern ekstra whitespace
setopt HIST_FIND_NO_DUPS        # hopp over duplikater ved søk

# ---------------------------------------------------------
# Prompt
# Viser:
# bruker@host nåværende_mappe (git-branch)
# $
# ---------------------------------------------------------

# La zsh evaluere $(...) inni prompt
setopt PROMPT_SUBST

# Liten hjelpefunksjon som returnerer aktiv git-branch
parse_git_branch() {
    git branch --show-current 2>/dev/null
}

# Prompt med farger
PROMPT='%F{green}%n@%m %F{yellow}%~%F{cyan}$(git branch --show-current 2>/dev/null | sed "s/^/ (/;s/$/)/")%f
$ '

# ---------------------------------------------------------
# ls / farger
# Du hadde to forskjellige ls-aliaser i bashrc.
# Her gjør vi det ryddig og konsekvent.
# ---------------------------------------------------------
if [[ "$TERM" != "dumb" ]]; then
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -lh'
    alias la='ls --color=auto -lha'
fi

# ---------------------------------------------------------
# Nyttige shell-innstillinger
# ---------------------------------------------------------
bindkey -v                 # vi-mode i kommandolinjen
setopt AUTO_CD             # skriv bare katalognavn for å cd inn

# ---------------------------------------------------------
# Completion
# Erstatter bash-completion med zsh sitt eget system
# ---------------------------------------------------------
autoload -Uz compinit
compinit


# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Vis completion-meny når det er flere valg
zstyle ':completion:*' menu select

# Litt penere grupper i completion
zstyle ':completion:*' group-name ''

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------------------------------------
# History-søk med piltastene
# Opp/Ned søker i historikken basert på det du allerede har skrevet
# Dette tilsvarer bind-linjene dine i bash på en zsh-riktig måte
# ---------------------------------------------------------
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ---------------------------------------------------------
# Ctrl-R med fzf
# Enkel fuzzy history-search, tilsvarende det du hadde i bash
# ---------------------------------------------------------
if command -v fzf >/dev/null 2>&1; then
    __fzf_history() {
        fc -rl 1 | fzf +s --tac | sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//'
    }

    fzf-history-widget() {
        local selected
        selected="$(__fzf_history)"
        if [[ -n "$selected" ]]; then
            LBUFFER="$selected"
        fi
        zle redisplay
    }

    zle -N fzf-history-widget
    bindkey '^R' fzf-history-widget
fi

# ---------------------------------------------------------
# Aliaser
# ---------------------------------------------------------
alias gs='git status'
alias ..='cd ..'
alias c='clear'

alias bilde='feh -z'
alias bilder='feh .'

alias musikk='ncmpcpp'
alias oppdater-musikk='mpc update'

alias torrent='tremc'
alias torrent-stop='pkill transmission-daemon'
alias torrent-start='transmission-daemon'

alias mixer='alsamixer'

# ---------------------------------------------------------
# Emacs-aliaser
# ---------------------------------------------------------
alias dotfiles='emacsclient -c -a "" ~/dotfiles'
alias scripts='emacsclient -c -a "" ~/scripts'
alias e='emacsclient -c -a ""'
alias et='emacsclient -t -a ""'

# ---------------------------------------------------------
# NVM
# nvm.sh kan fortsatt sources direkte
# bash_completion-linjen dropper vi i zsh
# ---------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
