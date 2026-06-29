{
  inputs,
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.lib.mkForce pkgs.qt6Packages.sddm;
    wayland = {
      enable = true;
      compositor = "weston";
    };
    theme = "${inputs.ndct-sddm.packages.${pkgs.stdenv.hostPlatform.system}.ndct-sddm-corners}/share/sddm/themes/ndct";
  };
  environment.systemPackages = [
    inputs.ndct-sddm.packages.${pkgs.stdenv.hostPlatform.system}.ndct-sddm-corners
  ];
}
