# niri-rice

My personal rice for Arch Linux + Niri compositor with Material You color theming via Matugen.

## Preview

- **WM:** Niri
- **Bar:** Waybar
- **Terminal:** Kitty
- **Shell:** Fish
- **Launcher:** Rofi
- **Colors:** Matugen (Material You generated from wallpaper)
- **Music:** Spotify + Spicetify (text theme)
- **Visualizer:** Cava
- **Clock:** Peaclock

## Features

- Wallpaper picker with thumbnail preview via Rofi
- Automatic color generation from wallpaper using Matugen
- Colors applied to: Waybar, Kitty, Cava, Spicetify, Rofi, GTK
- Waybar with media controls, network, CPU, RAM, volume, brightness, tray, notifications

## Dependencies

```bash
sudo pacman -S niri waybar kitty fish rofi matugen swww playerctl brightnessctl cava peaclock starship swaync wlogout easyeffects pipewire pipewire-pulse wireplumber xdg-desktop-portal xdg-desktop-portal-gnome
```

Also install spicetify from AUR:
```bash
yay -S spicetify-cli
```

## Wallpapers

> Wallpapers must be placed in ~/Pictures/wallpapers/ -- the picker looks for .jpg, .jpeg, .png, .gif files only in that folder.

```bash
mkdir -p ~/Pictures/wallpapers
cp /path/to/your/wallpaper.jpg ~/Pictures/wallpapers/
```

## Installation

### 1. Clone the repo

```bash
git clone https://github.com/mxxnsk00/niri-rice.git ~/niri-rice
cd ~/niri-rice
```

### 2. Run the install script

```bash
chmod +x install.sh
./install.sh
```

The script will install dependencies, copy all config files, and set up spicetify.

### 3. Add to niri autostart

Make sure your ~/.config/niri/config.kdl has:
```kdl
spawn-at-startup "swww-daemon"
spawn-at-startup "waybar"
spawn-at-startup "swaync"
```

### 4. Set a wallpaper

Use the keybind `Super+Shift+W` to open the wallpaper picker, or run it manually:

```bash
wallpaper.sh
```
This will automatically:
- Show a Rofi picker with wallpaper previews
- Set the wallpaper via swww
- Generate colors via Matugen
- Reload Waybar, Kitty, Cava, Spicetify with new colors
```
To open the app launcher use `Alt+Space`.
```

## Waybar controls

| Action | How |
|--------|-----|
| Play/Pause | Click on track name |
| Next track | Right click or scroll down on track name |
| Previous track | Scroll up on track name |
| Mute | Click on volume |
| Brightness +5% | Scroll up on brightness |
| Brightness -5% | Scroll down on brightness |
| Notifications | Click notification icon |

## After installation

The following steps must be done manually after running the install script:

1. Add autostart entries to `~/.config/niri/config.kdl`:
```kdl
   spawn-at-startup "swww-daemon"
   spawn-at-startup "waybar"
   spawn-at-startup "swaync"
```
2. Open Spotify and install the `text` theme from the Spicetify Marketplace.
3. Run `wallpaper.sh` to set a wallpaper and generate colors for all apps.
4. Log out and log back in for all changes to take effect.
