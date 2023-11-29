{ config, lib, pkgs, modulesPath, uservars, curversion, brightnesctrl, ... }:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
  ];
  
  networking.firewall.enable = false;
  users.users.${uservars.name}.extraGroups = [ 
    "wheel"
    "networkmanager"
    "docker"
    "rustdesk"
    "adbusers"
    "kvm"
    "input" 
    "disk" 
    "qemu-libvirtd"
    "libvirtd"
    "video"
    "wireshark"
    "pipewire"
    "i2c" 
  ];
  #etc file
  environment.etc."swhkd/swhkdrc".text = ''
super + shift + t
  alacritty

super + shift + b
  firefox

super + shift + f
  nemo
    
super + shift + p
  hyprpicker -a

super + shift + e
  bash /home/${uservars.name}/.scripts/ewwlauncher.sh

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
  system.stateVersion = "${curversion}";
}
