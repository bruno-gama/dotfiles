#!/bin/sh

# Call xrandr before actually setting the layout
# Some setups will not set the layout if you dont do this
# It probably helps the system to recognize available monitors somehow
xrandr

# Now we actually set them
xrandr --output HDMI-1 \
       --mode 1920x1080 \
       --scale-from 2560x1440 \
       --refresh 120 \
       --pos 0x0 \
       --rotate normal \
       --set "Broadcast RGB" "Full" \
       --output eDP-1 \
       --primary \
       --mode 1366x768 \
       --pos 540x1440 \
       --rotate normal
