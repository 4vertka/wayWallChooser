# Wayland wallpaper tool

A small project written in QML and C++.
The idea was to create wallpaper tool for hyprland on QT (using c++ and QML)
Currently only supports wayland

## Features
- [x] UI elements (Buttons, GridView, Paging etc)
- [x] Basic image loading in QML
- [x] swww usage for image changing
- [ ] X11 support
- []

<img src="./program_show.png" />

## How to run

### Requirements
- swww 
- qt6
- c++20 compiler

### Build and run (Arch linux)
```bash
sudo pacman -S swww
sudo pacman -S qt6-base qt6-tools
cd wallpaper_chooser_pr
mkdir build && cd build
cmake ..
make
./appwallpaper_chooser_pr
```
