#!/usr/bin/env bash

# Drep gamle polybar-instancer først
killall -q polybar

# Vent til de er borte
while pgrep -x polybar >/dev/null; do
    sleep 0.2
done

# Start baren med DIN config
polybar -c ~/.config/polybar/config.ini main &
