#!/usr/bin/env bash

WALLDIR="$HOME/Pictures/wallpapers"

chosen=$(
  find "$WALLDIR" -type f | while read -r img; do
    echo -en "$(basename "$img")\x00icon\x1f$img\n"
  done | rofi -dmenu \
    -theme ~/.config/rofi/themes/wallpaper.rasi \
    -show-icons \
    -theme-str 'element { orientation: vertical; padding: 8px; }' \
    -theme-str 'element-text { horizontal-align: 0.5; }' \
    -theme-str 'element-icon { size: 220px; }' \
    -theme-str 'listview { columns: 4; lines: 3; }' \
    -theme-str 'window {width: 70%;}'
)

[ -z "$chosen" ] && exit

selected=$(find "$WALLDIR" -type f | grep "/$chosen$")

cp -p $selected ~/.config/hypr/wallpaper.png
pkill swaybg
swaybg -i ~/.config/hypr/wallpaper.png -m fill &
notify-send -i wallpaper "Wallpaper Changed" "Desktop Wallpaper Changed Successfully"
