#!/bin/bash
# Shell script to prepend i3status with more info
# Things this script adds:
# 1. Number of unread emails
# 2. Current song being played (uses playerctl)

i3status | while :
do
  # Grab original i3status output
  read line

  # Get number of unread mail in Mail INBOX folders
  unread="✉️ $(find ~/Mail/*/INBOX/new/* | wc -l) |"

  # Get song name and artist if player is open
  playermessage=""
  playerstatus="$(playerctl status -p spotify)"
  # Only if player is open
  if [ "$playerstatus" = "Paused" ] || [ "$playerstatus" = "Playing" ]; then
    # Grab artist and song name from metadata
    artist=$(playerctl -p spotify metadata | grep xesam:albumArtist | sed -e "s/^\w\+\s\+\+\w\+:\w\+\s\+//g")
    song=$(playerctl -p spotify metadata | grep xesam:title | sed -e "s/^\w\+\s\+\+\w\+:\w\+\s\+//g")
    # Format final output
    playermessage="$playerstatus: $artist - $song |"
  fi

  echo "$playermessage $unread $line" || exit 1
done
