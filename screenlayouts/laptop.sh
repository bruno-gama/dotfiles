#!/bin/sh
xrandr --output HDMI-1-0 \
       --off \
       --output eDP-1 \
       --primary \
       --mode 1920x1080 \
       --pos 0x0 \
       --rotate normal
