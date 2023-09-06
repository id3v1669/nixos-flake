{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, ...}: 
{
  nixpkgs.config.allowUnfree = true;
  security.rtkit.enable = true;
  time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
  sound.enable = true;
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}${envir}";
  };
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
  programs = {
    adb.enable = true;
    fish.enable = true;
  };
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  };
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    extraGroups = [ "rustdesk" "adbusers" "networkmanager" "wheel" "kvm" "input" "disk" "libvirtd" "video" "docker" ];
    shell = pkgs.fish;
  };
  fonts.packages  = with pkgs; [
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
  ];
  nix = {
    settings = {
      experimental-features = [ "flakes" "nix-command" ];
    #  auto-optimise-store = true;
    };
    #gc = {
    #  automatic = true;
    #  dates = "weekly";
    #  options = "--delete-older-than 7d";
    #};
  };
  environment = {
    systemPackages = with pkgs; [
      fish
      #(callPackage ./../home/custom/xwaylandvideobridge.nix {})
    ];
    etc = {
	    "wireplumber/bose.lua".text = ''
rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_input.usb-Elgato_Systems_Elgato_Wave_3_BS43J1A04362-00.mono-fallback" },
    },
  },
  apply_properties = {
    ["node.nick"] = "ElgatoMic",
  },
}

table.insert(alsa_monitor.rules, rule)

	    '';
    };
  };
  system.stateVersion = "${curversion}";
}