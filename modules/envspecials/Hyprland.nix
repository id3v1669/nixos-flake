{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
}
