#!/bin/sh
xrandr --output eDP-1 \
       --primary \
       --output HDMI-1 \
       --set "Broadcast RGB" "Full" \
       --same-as eDP-1
