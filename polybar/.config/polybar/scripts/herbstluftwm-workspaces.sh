#!/usr/bin/env bash

# ---------------------------------------------------------
# Polybar workspace-modul for herbstluftwm
# ---------------------------------------------------------

print_tags() {
    # tag_status returnerer tab-separerte tags:
    # # = aktiv
    # + = synlig på annen monitor
    # : = ikke-tom
    # . = tom
    # ! = urgent
    herbstclient tag_status | tr '\t' '\n' | while read -r tag; do
        state="${tag:0:1}"
        name="${tag:1}"

        case "$state" in
            '#')
                printf "%%{F#1a1b26}%%{B#7aa2f7}  %s  %%{B-}%%{F-} " "$name"
                ;;
            '+')
                printf "%%{F#1a1b26}%%{B#73daca}  %s  %%{B-}%%{F-} " "$name"
                ;;
            ':')
                printf "%%{F#9ece6a}  %s  %%{F-} " "$name"
                ;;
            '.')
                printf "%%{F#565f89}  %s  %%{F-} " "$name"
                ;;
            '!')
                printf "%%{F#1a1b26}%%{B#f7768e}  %s  %%{B-}%%{F-} " "$name"
                ;;
            *)
                printf "%%{F#c0caf5}  %s  %%{F-} " "$name"
                ;;
        esac
    done

    printf "\n"
}

# Print én gang ved oppstart
print_tags

# Lytt på herbstluftwm-events og refresh bare når tags endrer seg
IFS=$'\t'
herbstclient --idle | while read -r hook _; do
    case "$hook" in
        tag_*|focus_changed|reload)
            print_tags
            ;;
    esac
done
