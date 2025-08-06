#!/bin/sh
# Script to send notifications for volume (using pactl) or brightness changes

case "$1" in
volume)
  # Get volume level and mute status using pactl
  volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1 | tr -d '%')
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'yes' && echo "true" || echo "false")

  # Set icon based on volume level or mute status
  if [ "$muted" = "true" ]; then
    icon="audio-volume-muted"
    message="Volume: Muted"
  elif [ "$volume" -eq 0 ]; then
    icon="audio-volume-muted"
    message="Volume: 0%"
  elif [ "$volume" -le 33 ]; then
    icon="audio-volume-low"
    message="Volume: ${volume}%"
  elif [ "$volume" -le 66 ]; then
    icon="audio-volume-medium"
    message="Volume: ${volume}%"
  else
    icon="audio-volume-high"
    message="Volume: ${volume}%"
  fi
  notify-send -u low -i "$icon" "Volume" "$message" -h int:value:"$volume" -h string:synchronous:volume
  ;;
brightness)
  # Get brightness level
  max=$(brightnessctl max)
  current=$(brightnessctl get)
  percent=$((current * 100 / max))

  # Set icon based on brightness level
  #!/bin/bash

  # Assume $percent is provided (e.g., from a brightness control command)
  # For example, you might get $percent from `brightnessctl` or similar

  # Determine icon based on brightness level
  if [ "$percent" -eq 0 ]; then
    icon="display-brightness-off-symbolic"
    message="Brightness: 0%"
  elif [ "$percent" -le 33 ]; then
    icon="display-brightness-low-symbolic"
    message="Brightness: ${percent}%"
  elif [ "$percent" -le 66 ]; then
    icon="display-brightness-medium-symbolic"
    message="Brightness: ${percent}%"
  else
    icon="display-brightness-high-symbolic"
    message="Brightness: ${percent}%"
  fi

  # Send notification with icon
  notify-send -u low -i "$icon" "Brightness" "$message" -h int:value:"$percent" -h string:synchronous:brightness
  notify-send -u low -i "$icon" "Brightness" "$message" -h int:value:"$percent" -h string:synchronous:brightness
  ;;
*)
  echo "Usage: $0 {volume|brightness}"
  exit 1
  ;;
esac
