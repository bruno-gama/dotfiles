# Grab a random file from my wallpaper directory
wallpaperdir="$HOME/wallpapers"
filename=$(ls $wallpaperdir | grep .png | shuf -n 1)

# Call i3 with that image set as background
i3lock -eft -i "$wallpaperdir/$filename"
