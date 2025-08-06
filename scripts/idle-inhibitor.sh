#!/usr/bin/env bash

pid=$(pgrep hypridle)
if [[ "$pid" == "" ]]; then
  hypridle & # Start hypridle if not running
  notify-send -i system-suspend " Hypr Idle" " Idle Inhibitor Disabled"
else
  kill $pid # Stop hypridle
  notify-send -i system-reboot " Hypr Idle" " Idle Inhibitor Enabled"
fi
