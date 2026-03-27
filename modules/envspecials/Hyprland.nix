{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
}
