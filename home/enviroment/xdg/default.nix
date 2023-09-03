{ config, lib, pkgs, ... }:

{
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        #images
        "image/png" = "nomacs.desktop";
        "image/jpeg" = "nomacs.desktop";
        "image/gif" = "nomacs.desktop";
        "image/bmp" = "nomacs.desktop";
        "image/jpg" = "nomacs.desktop";
        "image/tiff" = "nomacs.desktop";
        "image/x-bmp" = "nomacs.desktop";
        "image/x-ico" = "nomacs.desktop";
        #web
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        #video
        "video/mp4" = "vlc.desktop";
        "video/mov" = "vlc.desktop";
        #kde connect later
        
      };
    };
  };
}
