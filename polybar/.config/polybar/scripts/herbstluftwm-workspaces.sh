#!/usr/bin/env bash

print_tags() {
    herbstclient tag_status | tr '\t' '\n' | while read -r tag; do
        state="${tag:0:1}"
        name="${tag:1}"

        # Gjør tag klikkbar
        click_open="%{A1:herbstclient use \"$name\":}"
        click_close="%{A}"

        case "$state" in
            '#')
                printf "%s%%{F#1a1b26}%%{B#7aa2f7}  %s  %%{B-}%%{F-}%s " \
                    "$click_open" "$name" "$click_close"
                ;;
            '+')
                printf "%s%%{F#1a1b26}%%{B#73daca}  %s  %%{B-}%%{F-}%s " \
                    "$click_open" "$name" "$click_close"
                ;;
            ':')
                printf "%s%%{F#9ece6a}  %s  %%{F-}%s " \
                    "$click_open" "$name" "$click_close"
                ;;
            '.')
                printf "%s%%{F#565f89}  %s  %%{F-}%s " \
                    "$click_open" "$name" "$click_close"
                ;;
            '!')
                printf "%s%%{F#1a1b26}%%{B#f7768e}  %s  %%{B-}%%{F-}%s " \
                    "$click_open" "$name" "$click_close"
                ;;
            *)
                printf "%s%%{F#c0caf5}  %s  %%{F-}%s " \
                    "$click_open" "$name" "$click_close"
                ;;
        esac
    done

    printf "\n"
}

print_tags

IFS=$'\t'
herbstclient --idle | while read -r hook _; do
    case "$hook" in
        tag_*|focus_changed|reload)
            print_tags
            ;;
    esac
done
