#!/bin/sh

# Call xrandr before actually setting the layout
# Some setups will not set the layout if you dont do this
# It probably helps the system to recognize available monitors somehow
xrandr

# Now we actually set them
xrandr --output HDMI-1-0 \
       --mode 1920x1080 \
       --refresh 60 \
       --pos 1920x0 \
       --rotate normal \
       --output eDP-1 \
       --primary \
       --mode 1920x1080 \
       --set "Broadcast RGB" "Full" \
       --pos 0x0 \
       --rotate normal
