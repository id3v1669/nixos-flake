{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./../universal-env.nix
    ./../universal.nix
  ];
  home = {
    sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME="nvidia";
    LIBVA_DRIVER_NAME="nvidia";
    };
  };

  wayland.windowManager.hyprland.settings.monitor = "HDMI-A-1,3440x1440@100,0x0,1";
}