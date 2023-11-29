{ config, lib, pkgs, modulesPath, uservars, curversion, ... }:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/gpu.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
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
  };
  system.stateVersion = "${curversion}";
}