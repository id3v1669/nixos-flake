{ config, lib, pkgs, ... }:

{
  imports = [ 
    #./../universal-env.nix
    ./../universal.nix
  ];
  home = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_WEBRENDER = "1";

      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_EGL_NO_MODIFIRES = "1";

      #JAVA_AWT_WM_NONREPARENTING,1
      #QT_WAYLAND_DISABLE_WINDOWDECORATION,1
    };
  };

  wayland.windowManager.hyprland.settings.monitor = "HDMI-A-1,3440x1440@100,0x0,1";
}