{lib, config, pkgs, ...}: 
let
  curversion = "23.05";
  uname = "user";
in
{
  nixpkgs.config.allowUnfree = true;
  security.rtkit.enable = true;
  time.timeZone = "Australia/Perth";
  i18n.defaultLocale = "en_AU.UTF-8";
  sound.enable = true;
  networking.networkmanager.enable = true;
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
      layout = "us,ru";
      xkbVariant = ",";
      xkbOptions = "grp:win_space_toggle";
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
  users.users."${uname}" = {
    isNormalUser = true;
    description = "id3v1669";
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