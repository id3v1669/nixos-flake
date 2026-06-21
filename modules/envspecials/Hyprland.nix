{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.displayManager.defaultSession = "hyprland-uwsm";
}
