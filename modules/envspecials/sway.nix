{pkgs, ...}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  services.displayManager.defaultSession = "sway";
}
