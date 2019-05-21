#!/bin/sh
xrandr --output HDMI-1 \
       --mode 1920x1080 \
       --pos 0x0 \
       --rotate normal \
       --set "Broadcast RGB" "Full" \
       --output eDP-1 \
       --primary \
       --mode 1366x768 \
       --pos 266x1080 \
       --rotate normal

