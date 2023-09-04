{ config, lib, pkgs, ... }:

{
  xdg = {
    enable = true;
    mime.enable = true;
    desktopEntries = {
      firefox = {
        name = "Firefox";
        genericName = "Web Browser";
        exec = "firefox %U";
        terminal = false;
        categories = [ "Application" "Network" "WebBrowser" ];
        mimeType = [ 
          "text/html" 
          "text/xml" 
          "x-scheme-handler/http" 
          "x-scheme-handler/https"
          "x-scheme-handler/chrome"
          "application/x-extension-htm"
          "application/x-extension-html"
          "application/x-extension-shtml"
          "application/xhtml+xml"
          "application/x-extension-xhtml"
          "application/x-extension-xht"
        ];
      };
      nomacs = {
        name = "nomacs";
        genericName = "Image Viewer";
        exec = "nomacs %U";
        terminal = false;
        categories = [ "Application" "Graphics" "Viewer" ];
        mimeType = [ 
          "image/png" 
          "image/jpeg" 
          "image/gif" 
          "image/bmp" 
          "image/jpg" 
          "image/tiff" 
          "image/x-bmp" 
          "image/x-ico" 
        ];
      };
    };
    mimeApps = {
      enable = true;
      associations.added = {
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
