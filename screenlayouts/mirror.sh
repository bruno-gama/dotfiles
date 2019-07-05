#!/bin/sh
xrandr --output eDP-1 \
       --primary \
       --mode 1366x768 \
       --output HDMI-1 \
       --mode 1920x1080 \
       --scale-from 1366x768 \
       --set "Broadcast RGB" "Full" \
       --same-as eDP-1
