{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, system, testvar, ...}: 
{
  environment.sessionVariables = {
    EDITOR = "nano";
  } // lib.optionalAttrs (envir == "hypr") {
    #WLR_NO_HARDWARE_CURSORS = "1";
  };
  nixpkgs.hostPlatform = lib.mkDefault "${system}";
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
  system.stateVersion = "${curversion}";
}
