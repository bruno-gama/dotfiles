#!/bin/sh

# Call xrandr before actually setting the layout
# Some setups will not set the layout if you dont do this
# It probably helps the system to recognize available monitors somehow
xrandr

# Now we actually set them
xrandr --output eDP-1 \
       --primary \
       --output HDMI-1-0 \
       --same-as eDP-1
