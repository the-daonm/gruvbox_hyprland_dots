#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/hyprshot/"
theme='style'
output_theme='output'

# CMDs
host=$(hostname)

# Screenshot directory
screenshot_dir="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_dir"

# Options for first menu
fullscreen='🖥️'
region='🔍'
window=''

# Options for output menu
save='💾'
clipboard='📋'

# Rofi CMD for mode selection
rofi_cmd() {
  rofi -dmenu \
    -p "👤 $USER: Screenshots" \
    -mesg "🖥️ Host: $host" \
    -theme "${dir}/${theme}.rasi"
}

# Rofi CMD for output selection
rofi_output_cmd() {
  rofi -dmenu \
    -p "👤 $USER: Screenshots" \
    -mesg "Output for $1" \
    -theme "${dir}/${output_theme}.rasi"
}

# Pass options to mode menu
run_rofi() {
  echo -e "$region\n$window\n$fullscreen" | rofi_cmd
}

# Pass options to output menu
run_output_rofi() {
  echo -e "$clipboard\n$save" | rofi_output_cmd "$1"
}

# Actions
chosen_mode="$(run_rofi)"
case ${chosen_mode} in
$fullscreen)
  mode="output"
  ;;
$region)
  mode="region"
  ;;
$window)
  mode="window"
  ;;
*)
  exit 0
  ;;
esac

# Run secondary menu for output choice
chosen_output="$(run_output_rofi "$chosen_mode")"
case ${chosen_output} in
$clipboard)
  hyprshot -m "$mode" --clipboard-only
  ;;
$save)
  hyprshot -m "$mode" -o "$screenshot_dir"
  ;;
esac
