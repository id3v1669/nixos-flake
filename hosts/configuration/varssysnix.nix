{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, system, testvar, ...}: 
{
  environment.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  } // lib.optionalAttrs (envir == "hypr") {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";
	  GTK_USE_PORTAL = "1";
	  NIXOS_XDG_OPEN_USE_PORTAL = "1";
	  XDG_CACHE_HOME = "/home/${uservars.name}/.cache";
	  XDG_CONFIG_HOME = "/home/${uservars.name}/.config";
	  XDG_BIN_HOME = "/home/${uservars.name}/.local/bin";
	  XDG_DATA_HOME = "/home/${uservars.name}/.local/share";
  };
  nixpkgs.hostPlatform = lib.mkDefault "${system}";
  time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
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
  system.stateVersion = "${curversion}";
}
