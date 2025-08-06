#!/usr/bin/env bash

# Check for mode argument
if [ "$1" = "window" ]; then
  # Capture active window
  geometry="$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')"
  if [ -z "$geometry" ]; then
    echo "Error: No valid active window geometry"
    exit 1
  fi
elif [ "$1" = "fullscreen" ]; then
  # Capture fullscreen
  geometry=""
else
  # Capture region (default)
  geometry=$(slurp)
  if [ -z "$geometry" ]; then
    echo "Error: No region selected"
    exit 1
  fi
  sleep 0.2
fi

# Take screenshot and pipe to swappy
grim ${geometry:+-g "$geometry"} - | swappy -f - || {
  echo "Error: Failed to capture screenshot"
  exit 1
}
