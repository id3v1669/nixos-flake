{ inputs
, pkgs
, ...
}:
{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "weston";
    };
    theme = "ndct";
  };
  environment.systemPackages = [
    inputs.ndct-sddm.packages.${pkgs.system}.ndct-sddm-corners
  ];
}