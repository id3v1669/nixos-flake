{ config, lib, pkgs, uservars, brightnesctrl, ... }:
{
  imports = [
    ./env-controls.nix
  ];
  home.file.".config/swhkd/swhkdrc".text = ''
include ${config.home.homeDirectory}/.config/swhkd/env-controls

super + shift + t
  alacritty
  
super + shift + k
  kitty

super + shift + b
  firefox

super + shift + f
  nemo
    
super + shift + p
  hyprpicker -a

super + shift + e
  bash ${config.home.homeDirectory}.scripts/ewwlauncher.sh

super + r
  rofi -show

xf86monbrightnessdown
  ${brightnesctrl.down}
xf86monbrightnessup
  ${brightnesctrl.up}
xf86audiomicmute
  pamixer --default-source -t
xf86audiolowervolume
  pamixer -d 10 && eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)"
xf86audioraisevolume
  pamixer -i 10 && eww update soundvol="$(amixer sget Master | grep -o "[0-9]*%" | head -1)" 
xf86audiomute 
  pamixer -t

  '';
}