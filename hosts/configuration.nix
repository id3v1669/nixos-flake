{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, desk, ...}: 
{
  imports = [
  ] ++ lib.lists.optionals ( desk == "desktop" || desk == "laptop" ) [ ./pcsconf.nix
  ] ++ lib.lists.optionals ( envir == "none" ) [ ./../modules/envspecials/none.nix
  ] ++ lib.lists.optionals ( envir == "hypr" ) [ ./../modules/envspecials/hypr.nix
  ] ++ lib.lists.optionals ( envir == "sway" ) [ ./../modules/envspecials/sway.nix
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
    ignoreShellProgramCheck = true;
  };
  environment.systemPackages = [ pkgs.fish ];
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
  services = {
    xserver = {
      enable = true;
      layout = "${deflocale.kblayout}";
      xkbVariant = "${deflocale.kbvariant}";
      xkbOptions = "${deflocale.kboption}";
      videoDrivers = [
      ] ++ lib.lists.optionals (gpuvar.type == "intel")[ "i915"
      ] ++ lib.lists.optionals (gpuvar.type == "nvidia")[ "nvidia"
      ] ++ lib.lists.optionals (gpuvar.type == "amd" || cpuvar == "amd" ) [ "amdgpu" ];
    };
  };
}
