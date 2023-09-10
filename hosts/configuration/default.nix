{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, system, gpuvar, ...}: 
let
  hypr-portal = pkgs.xdg-desktop-portal-hyprland.overrideAttrs (oldAttrs: {
    version = "unstable-2023-09-05";
    src = pkgs.fetchFromGitHub {
      owner = "hyprwm";
      repo = "xdg-desktop-portal-hyprland";
      rev = "57a3a41ba6b358109e4fc25c6a4706b5f7d93c6b";
      sha256 = "1xc0lq3ifniny8vzr9izi8cj0smgxngcl8738pkq6n8mygbyc924";
    };
  });
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
    enableIPv6 = false;
  };
  virtualisation = {
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar == "nvidiaprime") { enableNvidia = true; };
    libvirtd.enable = true;
  };
  xdg = {
    #needed?
  } // lib.optionalAttrs (envir == "hypr") {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        hypr-portal
      ];
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
    extraGroups = [ "rustdesk" "adbusers" "networkmanager" "wheel" "kvm" "input" "disk" "libvirtd" "video" "docker" "i2c" "openrgb" "gdm" ];
    shell = pkgs.fish;
  };
  fonts = {
    fontconfig.enable = true;
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
    packages = (with pkgs; [
      terminus-nerdfont
      noto-fonts
      nerdfonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ]); # ++ lib.lists.optionals (envir == "gnome") ();
  };
}


#doesnt work need fix
#     enviroment.etc = {
# 	    "wireplumber/bose.lua".text = ''
# rule = {
#   matches = {
#     {
#       { "node.name", "equals", "alsa_input.usb-Elgato_Systems_Elgato_Wave_3_BS43J1A04362-00.mono-fallback" },
#     },
#   },
#   apply_properties = {
#     ["node.nick"] = "ElgatoMic",
#   },
# }

# table.insert(alsa_monitor.rules, rule)

# 	    '';
#     };