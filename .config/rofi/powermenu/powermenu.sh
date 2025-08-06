# Current Theme
dir="$HOME/.config/rofi/powermenu/"
theme='style'

# CMDs
lastlogin="$(last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7)"
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown='󰐥'
reboot='󰜉'
lock='󰌾'
suspend=''

# Rofi CMD
rofi_cmd() {
  rofi -dmenu \
    -p "⏱ Uptime: $uptime" \
    -mesg "⏱ Uptime: $uptime" \
    -theme ${dir}/${theme}.rasi
}

# Pass options to menu
run_rofi() {
  echo -e "$suspend\n$shutdown\n$reboot\n$lock" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$lock)
  hyprlock
  ;;
$suspend)
  mpc -q pause
  amixer set Master mute
  systemctl suspend
  loginctl lock-session
  ;;
esac
