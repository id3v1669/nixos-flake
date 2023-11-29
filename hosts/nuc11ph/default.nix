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
include /home/${uservars.name}/.config/swhkd/swhkdrc
  '';
  environment.variables = {
    #system vars
    EDITOR = "nano";

    #wayland vars
    NIXOS_OZONE_WL = "1";
	  MOZ_ENABLE_WAYLAND = "1";
	  SDL_VIDEODRIVER = "wayland";
	  _JAVA_AWT_WM_NONREPARENTING = "1";
	  CLUTTER_BACKEND = "wayland";
	  XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";

		#args for gmaes
		__GL_THREADED_OPTIMIZATIONS="1";
		__GL_SHADER_DISK_CACHE="1";
		__GL_SHADER_DISK_CACHE_SKIP_CLEANUP="1";

		#nvidia vars
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
  system.stateVersion = "${curversion}";
}
