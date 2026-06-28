#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

echo "Installing dependencies..."
sudo pacman -S --needed niri waybar kitty fish rofi matugen swww playerctl brightnessctl cava peaclock starship swaync wlogout easyeffects pipewire pipewire-pulse wireplumber xdg-desktop-portal xdg-desktop-portal-gnome

echo "Creating directories..."
mkdir -p ~/.config/waybar
mkdir -p ~/.config/matugen/templates
mkdir -p ~/.config/kitty
mkdir -p ~/.config/cava
mkdir -p ~/.config/rofi
mkdir -p ~/.config/niri
mkdir -p ~/.config/spicetify/Themes/text
mkdir -p ~/.local/bin
mkdir -p ~/.peaclock
mkdir -p ~/Pictures/wallpapers

echo "Copying config files..."
cp "$SCRIPT_DIR/.rice/.config/waybar/config.jsonc" ~/.config/waybar/
cp "$SCRIPT_DIR/.rice/.config/waybar/style.css" ~/.config/waybar/
cp "$SCRIPT_DIR/.rice/.config/matugen/config.toml" ~/.config/matugen/
cp -r "$SCRIPT_DIR/.rice/.config/matugen/templates/" ~/.config/matugen/
cp "$SCRIPT_DIR/.rice/.config/kitty/kitty.conf" ~/.config/kitty/
cp -r "$SCRIPT_DIR/.rice/.config/cava/" ~/.config/
cp -r "$SCRIPT_DIR/.rice/.config/rofi/" ~/.config/
cp "$SCRIPT_DIR/.rice/.config/niri/config.kdl" ~/.config/niri/
cp "$SCRIPT_DIR/.rice/.config/spicetify/Themes/text/color.ini" ~/.config/spicetify/Themes/text/
cp "$SCRIPT_DIR/.rice/.config/spicetify/Themes/text/user.css" ~/.config/spicetify/Themes/text/
cp "$SCRIPT_DIR/.rice/.local/bin/wallpaper.sh" ~/.local/bin/
chmod +x ~/.local/bin/wallpaper.sh
cp "$SCRIPT_DIR/.rice/.peaclock/config" ~/.peaclock/
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/swaync
mkdir -p ~/.config/wlogout
mkdir -p ~/.config/Equicord/themes
cp "$SCRIPT_DIR/.rice/.config/fastfetch/config.jsonc" ~/.config/fastfetch/
cp "$SCRIPT_DIR/.rice/.config/fastfetch/ascii.txt" ~/.config/fastfetch/
cp "$SCRIPT_DIR/.rice/.config/swaync/config.json" ~/.config/swaync/
cp -r "$SCRIPT_DIR/.rice/.config/wlogout/" ~/.config/
cp "$SCRIPT_DIR/.rice/.config/matugen/templates/midnight-discord.css" ~/.config/Equicord/themes/matugen.css
cp "$SCRIPT_DIR/.rice/.config/starship.toml" ~/.config/

echo "Copying wallpapers..."
cp "$SCRIPT_DIR/wallpapers/"* ~/Pictures/wallpapers/ 2>/dev/null || true

echo "Configuring spicetify..."
spicetify config current-theme text
spicetify config color-scheme Spicetify
spicetify apply

echo "Configuring fish..."
mkdir -p ~/.config/fish
grep -q "starship init fish" ~/.config/fish/config.fish 2>/dev/null || echo 'starship init fish | source' >> ~/.config/fish/config.fish

echo ""
echo "Done!"
echo ""
echo "Remember:"
echo "  1. Add to ~/.config/niri/config.kdl:"
echo "     spawn-at-startup \"swww-daemon\""
echo "     spawn-at-startup \"waybar\""
echo "     spawn-at-startup \"swaync\""
echo "  2. Run wallpaper.sh to set a wallpaper and generate colors"
echo "  3. Log out and back in"
