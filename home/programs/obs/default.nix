{ config
, lib
, pkgs
, gpuvar
, ...
}:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      wlrobs
      obs-vkcapture
      obs-gstreamer
      #droidcam-obs
    ] ++ lib.optional (gpuvar.tech == "nvidia") pkgs.obs-studio-plugins.obs-nvfbc;
  };
}