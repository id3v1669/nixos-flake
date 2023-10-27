{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, ...}: 
let 
  xdghypr = inputs.xdghypr.packages.x86_64-linux.xdg-desktop-portal-hyprland;
in 
{
  imports =
    [ 
      ./hardware.nix
      ./services.nix
      ./progs.nix
      ./boot.nix
      ./udevrules.nix
      ./varssysnix.nix
      ./fonts.nix
    ];
  security = {
    rtkit.enable = true;
  } // lib.optionalAttrs (envir == "hypr") {
    polkit.enable = true;
  };
  sound.enable = true;
  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hostName = "${hostname}${envir}";
    firewall.enable = false;
    enableIPv6 = true;
    interfaces.ethvirtdebug = {
      name = "ethvirtdebug";
      virtual = true;
    };
    localCommands = ''
    ip netns add namespace_virt_debug
    ip link set ethvirtdebug netns namespace_virt_debug
    ip netns exec namespace_virt_debug ip addr add 192.168.1.2/24 dev ethvirtdebug
    ip netns exec namespace_virt_debug ip link set ethvirtdebug up
    ip netns exec namespace_virt_debug ip route add default via 192.168.1.1
    '';
  };
  virtualisation = {
    waydroid.enable = true;
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
    libvirtd.enable = true;
  };
  xdg = {
  } // lib.optionalAttrs (envir == "hypr") {
    portal = {
      enable = true;
      extraPortals = ( with pkgs; [
        xdg-desktop-portal-gtk
        #xdg-desktop-portal-hyprland
        xdghypr
      ]);
    };
  };
  systemd = {
    #for now
  } // lib.optionalAttrs (envir == "hypr") {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    extraGroups = [ "rustdesk" "adbusers" "networkmanager" "wheel" "kvm" "input" "disk" "qemu-libvirtd" "libvirtd" "video" "wireshark" "pipewire" "docker" "i2c" ];
    shell = pkgs.fish;
  };
}
