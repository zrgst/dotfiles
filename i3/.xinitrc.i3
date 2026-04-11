#!/bin/bash

# Deaktiverer skjerm-timeout
xset s off
xset -dpms
xset s noblank

exec i3
