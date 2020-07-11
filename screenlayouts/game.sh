#!/bin/sh

# Call xrandr before actually setting the layout
# Some setups will not set the layout if you dont do this
# It probably helps the system to recognize available monitors somehow
xrandr

# Now we actually set them
xrandr --output HDMI-1 \
       --primary \
       --mode 1920x1080 \
       --refresh 120 \
       --scale-from 1920x1080 \
       --pos 0x0 \
       --rotate normal \
       --set "Broadcast RGB" "Full" \
       --output eDP-1 \
       --off 
