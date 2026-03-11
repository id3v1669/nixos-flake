{pkgs, inputs, ...}: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];
  programs.hyprland = {
    enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
}
