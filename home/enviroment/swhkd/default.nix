{ lib
, config
, pkgs
, brightnesctrl
, ...
}:
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
  eww reload

super + shift + r
  bash ${config.home.homeDirectory}/.scripts/ewwlauncher.sh

super + shift + y
  bash ${config.home.homeDirectory}/.scripts/moveeww.sh

super + r
  rofi -show

super + shift + c
  cliphist list | rofi -dmenu | cliphist decode | wl-copy

super + shift + l
  hyprlock

super + shift + 3
  wayshot -s "$(slurp)" --stdout | swappy -f -

super + shift + 4
  wayshot -s "$(slurp)" -f $HOME/Pictures/Screenshots/shot_$(date '+%Y-%m-%d_%H:%M:%S').png

super + shift + 5
  wayshot -s "$(slurp)" --stdout | wl-copy

xf86monbrightnessdown
  ${brightnesctrl.down}
xf86monbrightnessup
  ${brightnesctrl.up}
xf86audioplay
  ${pkgs.playerctl}/bin/playerctl play-pause
xf86audioprev
  ${pkgs.playerctl}/bin/playerctl previous
xf86audionext
  ${pkgs.playerctl}/bin/playerctl next
xf86audiolowervolume
  pamixer -d 10
xf86audioraisevolume
  pamixer -i 10
xf86audiomute 
  pamixer -t
xf86audiomicmute
  pamixer --default-source -t
  '';
}