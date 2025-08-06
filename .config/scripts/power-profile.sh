#!/bin/bash

# Get current profile
current_profile=$(powerprofilesctl get)

# Define next profile and corresponding icon
case "$current_profile" in
"power-saver")
  next_profile="balanced"
  icon="battery-full"
  ;;
"balanced")
  next_profile="performance"
  icon="battery-full-charging"
  ;;
"performance")
  next_profile="power-saver"
  icon="battery-low"
  ;;
*)
  next_profile="balanced"
  icon="battery-medium"
  ;;
esac

# Set the new profile
powerprofilesctl set "$next_profile"

# Send notification with icon via notify-send
notify-send -u low -i "$icon" "Power Profile" "Switched to $next_profile"
