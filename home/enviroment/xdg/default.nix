{ config
, ...
}:
{
  xdg = {
    enable = true;
    mime.enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    systemDirs = {
      config = [ "${config.home.homeDirectory}/.config" ];
      data = [ "${config.home.homeDirectory}/.local/share" "/usr/share" "/usr/share/applications/" "/usr/local/share/applications/" ];
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    desktopEntries = {
      floorp = {
        name = "floorp";
        genericName = "Web Browser";
        exec = "floorp %U";
        terminal = false;
        categories = [ "Application" "Network" "WebBrowser" ];
        settings.Keywords = "firefox;froo";
      };
      eog = {
        name = "eog";
        genericName = "Image Viewer";
        exec = "eog %U";
        terminal = false;
        categories = [ "Application" "Graphics" "Viewer" ];
        mimeType = [ 
          "image/png" 
          "image/heic"
          "image/heif"  
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
        "image/png" = "eog.desktop";
        "image/jpeg" = "eog.desktop";
        "image/gif" = "eog.desktop";
        "image/bmp" = "eog.desktop";
        "image/jpg" = "eog.desktop";
        "image/tiff" = "eog.desktop";
        "image/x-bmp" = "eog.desktop";
        "image/x-ico" = "eog.desktop";
        "image/heic" = "eog.desktop";
        "image/heif" = "eog.desktop";
        #web
        "text/html" = "floorp.desktop";
        "x-scheme-handler/http" = "floorp.desktop";
        "x-scheme-handler/https" = "floorp.desktop";
        "x-scheme-handler/chrome" = "floorp.desktop";
        "application/x-extension-htm" = "floorp.desktop";
        "application/x-extension-html" = "floorp.desktop";
        "application/x-extension-shtml" = "floorp.desktop";
        "application/xhtml+xml" = "floorp.desktop";
        "application/x-extension-xhtml" = "floorp.desktop";
        "application/x-extension-xht" = "floorp.desktop";
        "application/pdf" = "chromium-browser.desktop";
        #video
        "video/mp4" = "vlc.desktop";
        "video/mov" = "vlc.desktop";
        "video/x-ms-wmv" = "vlc.desktop";
        "video/quicktime" = "vlc.desktop";
        "video/vnd.avi" = "vlc.desktop";
        "video/webm" = "vlc.desktop";
        #vscode for text etc
        "text/plain" = "code.desktop";
        "text/x-c" = "code.desktop";
        "text/x-c++" = "code.desktop";
        "text/x-c++src" = "code.desktop";
        "text/x-chdr" = "code.desktop";
        "text/x-csrc" = "code.desktop";
        "text/x-diff" = "code.desktop";
        "text/x-dsrc" = "code.desktop";
        "text/x-haskell" = "code.desktop";
        "text/x-java" = "code.desktop";
        "text/x-makefile" = "code.desktop";
        "text/x-moc" = "code.desktop";
        "text/x-pcs-gcd" = "code.desktop";
        "text/x-perl" = "code.desktop";
        "text/x-python" = "code.desktop";
        "text/x-scala" = "code.desktop";
        "text/x-scheme" = "code.desktop";
        "text/css" = "code.desktop";
        "application/x-shellscript" = "code.desktop";
        
        
      };
      defaultApplications = {
        #images
        "image/png" = "eog.desktop";
        "image/jpeg" = "eog.desktop";
        "image/gif" = "eog.desktop";
        "image/bmp" = "eog.desktop";
        "image/jpg" = "eog.desktop";
        "image/tiff" = "eog.desktop";
        "image/x-bmp" = "eog.desktop";
        "image/x-ico" = "eog.desktop";
        "image/heic" = "eog.desktop";
        "image/heif" = "eog.desktop";
        #web
        "text/html" = "floorp.desktop";
        "x-scheme-handler/http" = "floorp.desktop";
        "x-scheme-handler/https" = "floorp.desktop";
        "x-scheme-handler/chrome" = "floorp.desktop";
        "application/x-extension-htm" = "floorp.desktop";
        "application/x-extension-html" = "floorp.desktop";
        "application/x-extension-shtml" = "floorp.desktop";
        "application/xhtml+xml" = "floorp.desktop";
        "application/x-extension-xhtml" = "floorp.desktop";
        "application/x-extension-xht" = "floorp.desktop";
        "application/pdf" = "chromium-browser.desktop";
        #video
        "video/mp4" = "vlc.desktop";
        "video/mov" = "vlc.desktop";
        "video/x-ms-wmv" = "vlc.desktop";
        "video/quicktime" = "vlc.desktop";
        "video/vnd.avi" = "vlc.desktop";
        "video/webm" = "vlc.desktop";
        #vscode
        "text/plain" = "code.desktop";
        "text/x-c" = "code.desktop";
        "text/x-c++" = "code.desktop";
        "text/x-c++src" = "code.desktop";
        "text/x-chdr" = "code.desktop";
        "text/x-csrc" = "code.desktop";
        "text/x-diff" = "code.desktop";
        "text/x-dsrc" = "code.desktop";
        "text/x-haskell" = "code.desktop";
        "text/x-java" = "code.desktop";
        "text/x-makefile" = "code.desktop";
        "text/x-moc" = "code.desktop";
        "text/x-pcs-gcd" = "code.desktop";
        "text/x-perl" = "code.desktop";
        "text/x-python" = "code.desktop";
        "text/x-scala" = "code.desktop";
        "text/x-scheme" = "code.desktop";
        "text/css" = "code.desktop";
        "text/x-shellscript" = "code.desktop";
        "application/x-shellscript" = "code.desktop";
      };
    };
  };
}
