{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    hardware = {
      openrgb = {
        enable = true;
        motherboard = "${cpuvar}";
      };
      bolt.enable = true;
    };
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
      videoDrivers = [] ++ lib.lists.optionals (gpuvar == "nvidiaprime") [ "nvidia" ] ++ lib.lists.optionals (gpuvar == "amd") [ "amdgpu" ];
  } // lib.optionalAttrs (envir == "gnome") {
      desktopManager.gnome = {
        enable = true;
        debug = false;
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    } // lib.optionalAttrs (envir == "hypr") {
      displayManager = {
        session = [
        {
          manage = "desktop";
          name = "Hyprland";
          start = ''
            exec Hyprland &
            waitPID=$!
          '';
        }];
        defaultSession = "Hyprland";
        sddm.enable = false;
        lightdm.enable = false;
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      config = ''
      Section "Device"
          Identifier  "Intel Graphics"
          Driver      "intel"
          #Option      "AccelMethod"  "sna" # default
          #Option      "AccelMethod"  "uxa" # fallback
          Option      "TearFree"        "true"
          Option      "SwapbuffersWait" "true"
          BusID       "PCI:0:2:0"
          #Option      "DRI" "2"             # DRI3 is now default
      EndSection

      Section "Device"
          Identifier "nvidia"
          Driver "nvidia"
          BusID "PCI:1:0:0"
          Option "AllowEmptyInitialConfiguration"
          Option         "TearFree" "true"
      EndSection
    '';
    screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
      '';
    deviceSection = '' 
    Option "TearFree" "true"
    '';
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  } // lib.optionalAttrs (envir == "gnome") {
    power-profiles-daemon.enable = false;
  } // lib.optionalAttrs (envir == "hypr") {
    gvfs.enable = true; # Mount, trash, etc
    mpd.enable = true;
    #greetd = {
    #  enable = true;
    #  settings = {
    #    initial_session = {
    #      user = "${uservars.name}";
    #      command = "Hyprland";
    #    };
    #  };
    #};
  } // lib.optionalAttrs (desk == "laptop") {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          scaling_min_freq = 600000;
          scaling_max_freq = 1300000;
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
