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

  # Figure out what is the currently open player program
  possibleplayers="ncspot\|spotify"
  playername=$(playerctl -a metadata | cut -d " " -f 1 | grep "${possibleplayers}" | head -n 1)

  # Get song name and artist if player is open
  playermessage=""
  playerstatus="$(playerctl status -p ${playername})"
  # Only if player is open
  if [ "$playerstatus" = "Paused" ] || [ "$playerstatus" = "Playing" ]; then
    # Grab artist and song name from metadata
    artist=$(playerctl -p ${playername} metadata xesam:albumArtist)
    song=$(playerctl -p ${playername} metadata xesam:title)
    # Format final output
    playermessage="$playerstatus: $artist - $song |"
  fi

  echo "$playermessage $unread $line" || exit 1
done
