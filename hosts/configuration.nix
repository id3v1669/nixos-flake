{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, desk, ...}: 
{
  imports = [
    ./../modules/bootloader.nix
  ] ++ lib.lists.optionals ( envir == "none" ) [ ./../modules/envspecials/none.nix
  ] ++ lib.lists.optionals ( envir == "hypr" ) [ ./../modules/envspecials/hypr.nix
  ] ++ lib.lists.optionals ( envir == "gnome" ) [ ./../modules/envspecials/gnome.nix
  ] ++ lib.lists.optionals ( envir == "kde" ) [ ./../modules/envspecials/kde.nix ];
  networking = {
    hostName = "${hostname}${envir}";
    networkmanager.enable = true;

    useDHCP = lib.mkDefault true;
    enableIPv6 = lib.mkDefault true;
  };
  programs.fish.enable = true;
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    shell = pkgs.fish;
  };
  environment = {
    sessionVariables = {
      EDITOR = "nano";
    };
    systemPackages = pkgs.fish;
  };
  time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
  nix = {
    settings = {
      experimental-features = [ "flakes" "nix-command" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  services.xserver = {
    enable = true;
    layout = "${deflocale.kblayout}";
    xkbVariant = "${deflocale.kbvariant}";
    xkbOptions = "${deflocale.kboption}";
    videoDrivers = [
    ] ++ lib.lists.optionals (gpuvar.type == "intel")[ "i915"
    ] ++ lib.lists.optionals (gpuvar.type == "nvidia")[ "nvidia"
    ] ++ lib.lists.optionals (gpuvar.type == "amd" || cpuvar == "amd" ) [ "amdgpu" ];
  };
  system.stateVersion = "${curversion}";
  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}// lib.optionalAttrs (desk != "server") {
  security.rtkit.enable = true;
  programs = {
    gamemode.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    light.enable = true;  #laptop brightness control and fix for openrgb
    traceroute.enable = true;
    #adb.enable = true;
  };
  hardware = {
    i2c.enable = true;
    cpu.${cpuvar}.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth.enable = true;
  };
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    hardware.bolt.enable = true;
  };
}
