!#/bin/bash

while true; do
    DATETIME=$(date "+%a %b %d, %Y - %I:%M%p")
    xsetroot -name "| $USER | $DATETIME  "
    sleep 60
done &

# Deaktiver skjerm-timeout
xset s off &
xset -dpms &
xset s noblank &

exec dwm
