#!/bin/sh
# shell script to prepend i3status with more info
# for now I'm just listing unread email

i3status | while :
do
  # Grab original i3status output
  read line

  # Get number of unread mail in Mail INBOX folders
  unread="✉️ $(find ~/Mail/*/INBOX/new/* | wc -l)"

  echo "$unread | $line" || exit 1
done
