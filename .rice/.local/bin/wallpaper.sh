#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SYMLINK_PATH="$HOME/.config/niri/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

IFS=$'\n'

SELECTED_WALL=$(for f in $(ls -t *.jpg *.jpeg *.png *.gif 2>/dev/null); do
    echo -en "$f\0icon\x1f$WALLPAPER_DIR/$f\n"
done | rofi -dmenu -p "wallpaper")

[ -z "$SELECTED_WALL" ] && exit 0

SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

awww img "$SELECTED_PATH" \
    --transition-type any \
    --transition-fps 60

matugen image "$SELECTED_PATH" --source-color-index 0 

if pgrep -x peaclock > /dev/null; then

    pkill -x peaclock

    sleep 0.2

fi

mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"



 

