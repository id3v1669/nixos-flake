{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, system, gpuvar, ...}: 
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
    enableIPv6 = true;
  };
  virtualisation = {
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar == "nvidiaprimetb" || gpuvar == "nvidiaprimehdmi") { enableNvidia = true; };
    libvirtd.enable = true;
  };
  #to check xdg-open http://example.com
  xdg = {
  } // lib.optionalAttrs (envir == "hypr") {
    portal = {
      enable = true;
      #xdgOpenUsePortal = false;
      #wlr.enable = true;
      extraPortals = ( with pkgs; [
        #xdg-desktop-portal-gtk
        (callPackage ./../../home/custom/xdggtk.nix {})
        (callPackage ./../../home/custom/xdghypr.nix {})
        #xdg-desktop-portal-wlr
        #xdg-desktop-portal-hyprland
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
    extraGroups = [ "rustdesk" "adbusers" "networkmanager" "wheel" "kvm" "input" "disk" "libvirtd" "video" "docker" "i2c" "openrgb" ];
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
