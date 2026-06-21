{config, ...}: {
  xdg = {
    enable = true;
    mime.enable = true;
    configFile."mimeapps.list".force = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    systemDirs = {
      config = ["${config.home.homeDirectory}/.config"];
      data = ["${config.home.homeDirectory}/.local/share" "/usr/share" "/usr/share/applications/" "/usr/local/share/applications/"];
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
      firefox = {
        name = "firefox";
        genericName = "Web Browser";
        exec = "firefox %U";
        terminal = false;
        categories = ["Application" "Network" "WebBrowser"];
        settings.Keywords = "firefox;fir;web";
      };
      custom-url-handler = {
        name = "custom-url-handler";
        genericName = "Custom Url Handler";
        exec = "custom-url-handler %U";
        categories = ["Application" "Graphics" "Viewer"];
        mimeType = [
          "x-scheme-handler/http"
          "x-scheme-handler/https"
        ];
      };
      codium = {
        name = "Visual Studio Code";
        genericName = "Text Editor";
        comment = "Code Editing. Redefined.";
        exec = "codium %F";
        icon = "vscodium";
        startupNotify = true;
        categories = ["Utility" "TextEditor" "Development" "IDE"];
        settings = {
          Keywords = "vscode;visual studio code;code;codium;";
          StartupWMClass = "vscodium";
        };
        actions."new-empty-window" = {
          name = "New Empty Window";
          exec = "codium --new-window %F";
          icon = "vscodium";
        };
      };
    };
    mimeApps = {
      enable = true;
      associations = {
        added = {
          #images
          "image/png" = "org.gnome.eog.desktop";
          "image/jpeg" = "org.gnome.eog.desktop";
          "image/gif" = "org.gnome.eog.desktop";
          "image/bmp" = "org.gnome.eog.desktop";
          "image/jpg" = "org.gnome.eog.desktop";
          "image/tiff" = "org.gnome.eog.desktop";
          "image/x-bmp" = "org.gnome.eog.desktop";
          "image/x-ico" = "org.gnome.eog.desktop";
          "image/heic" = "org.gnome.eog.desktop";
          "image/heif" = "org.gnome.eog.desktop";
          "image/webp" = "org.gnome.eog.desktop";
          #web
          "text/html" = "firefox.desktop";
          "x-scheme-handler/http" = "custom-url-handler.desktop";
          "x-scheme-handler/https" = "custom-url-handler.desktop";
          "x-scheme-handler/chrome" = "firefox.desktop";
          "x-scheme-handler/discord " = "equibop.desktop";
          "x-scheme-handler/spotify" = "spotify.desktop";
          "application/x-extension-htm" = "firefox.desktop";
          "application/x-extension-html" = "firefox.desktop";
          "application/x-extension-shtml" = "firefox.desktop";
          "application/xhtml+xml" = "firefox.desktop";
          "application/x-extension-xhtml" = "firefox.desktop";
          "application/x-extension-xht" = "firefox.desktop";
          "application/pdf" = "chromium-browser.desktop";
          #video
          "video/mp4" = "vlc.desktop";
          "video/mov" = "vlc.desktop";
          "video/x-ms-wmv" = "vlc.desktop";
          "video/quicktime" = "vlc.desktop";
          "video/vnd.avi" = "vlc.desktop";
          "video/webm" = "vlc.desktop";
          "video/mpeg" = "vlc.desktop";
          "video/x-matroska" = "vlc.desktop";
          #vscode for text etc
          "text/plain" = "codium.desktop";
          "text/x-c" = "codium.desktop";
          "text/x-c++" = "codium.desktop";
          "text/x-c++src" = "codium.desktop";
          "text/x-chdr" = "codium.desktop";
          "text/x-csrc" = "codium.desktop";
          "text/x-diff" = "codium.desktop";
          "text/x-dsrc" = "codium.desktop";
          "text/x-haskell" = "codium.desktop";
          "text/x-java" = "codium.desktop";
          "text/x-makefile" = "codium.desktop";
          "text/x-moc" = "codium.desktop";
          "text/x-pcs-gcd" = "codium.desktop";
          "text/x-perl" = "codium.desktop";
          "text/x-python" = "codium.desktop";
          "text/x-scala" = "codium.desktop";
          "text/x-scheme" = "codium.desktop";
          "text/css" = "codium.desktop";
          "application/x-shellscript" = "codium.desktop";
          "application/xml" = "codium.desktop";
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
        };
        removed = {
          #workaround for cosmic files bug #1416
          mimetype1 = "foo5.desktop";
        };
      };
      defaultApplications = {
        #images
        "image/png" = "org.gnome.eog.desktop";
        "image/jpeg" = "org.gnome.eog.desktop";
        "image/gif" = "org.gnome.eog.desktop";
        "image/bmp" = "org.gnome.eog.desktop";
        "image/jpg" = "org.gnome.eog.desktop";
        "image/tiff" = "org.gnome.eog.desktop";
        "image/x-bmp" = "org.gnome.eog.desktop";
        "image/x-ico" = "org.gnome.eog.desktop";
        "image/heic" = "org.gnome.eog.desktop";
        "image/heif" = "org.gnome.eog.desktop";
        "image/webp" = "org.gnome.eog.desktop";
        #web
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "custom-url-handler.desktop";
        "x-scheme-handler/https" = "custom-url-handler.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "x-scheme-handler/discord " = "equibop.desktop";
        "x-scheme-handler/spotify" = "spotify.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        "application/pdf" = "chromium-browser.desktop";
        "application/arj" = "org.gnome.FileRoller.desktop";
        "application/gzip" = "org.gnome.FileRoller.desktop";
        "application/vnd.debian.binary-package" = "org.gnome.FileRoller.desktop";
        "application/vnd.efi.iso" = "org.gnome.FileRoller.desktop";
        "application/vnd.ms-cab-compressed" = "org.gnome.FileRoller.desktop";
        "application/vnd.rar" = "org.gnome.FileRoller.desktop";
        "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
        "application/x-archive" = "org.gnome.FileRoller.desktop";
        "application/x-arj" = "org.gnome.FileRoller.desktop";
        "application/x-bcpio" = "org.gnome.FileRoller.desktop";
        "application/x-bzip-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-bzip" = "org.gnome.FileRoller.desktop";
        "application/x-bzip2-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-bzip2" = "org.gnome.FileRoller.desktop";
        "application/x-cd-image" = "org.gnome.FileRoller.desktop";
        "application/x-compress" = "org.gnome.FileRoller.desktop";
        "application/x-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-cpio-compressed" = "org.gnome.FileRoller.desktop";
        "application/x-cpio" = "org.gnome.FileRoller.desktop";
        "application/x-deb" = "org.gnome.FileRoller.desktop";
        "application/x-iso9660-appimage" = "org.gnome.FileRoller.desktop";
        "application/x-java-archive" = "org.gnome.FileRoller.desktop";
        "application/x-lha" = "org.gnome.FileRoller.desktop";
        "application/x-lrzip-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-lrzip" = "org.gnome.FileRoller.desktop";
        "application/x-lz4-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-lz4" = "org.gnome.FileRoller.desktop";
        "application/x-lzip-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-lzip" = "org.gnome.FileRoller.desktop";
        "application/x-lzma-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-lzma" = "org.gnome.FileRoller.desktop";
        "application/x-lzop" = "org.gnome.FileRoller.desktop";
        "application/x-rar" = "org.gnome.FileRoller.desktop";
        "application/x-rpm" = "org.gnome.FileRoller.desktop";
        "application/x-source-rpm" = "org.gnome.FileRoller.desktop";
        "application/x-stuffit" = "org.gnome.FileRoller.desktop";
        "application/x-sv4cpio" = "org.gnome.FileRoller.desktop";
        "application/x-sv4crc" = "org.gnome.FileRoller.desktop";
        "application/x-tar" = "org.gnome.FileRoller.desktop";
        "application/x-tarz" = "org.gnome.FileRoller.desktop";
        "application/x-tzo" = "org.gnome.FileRoller.desktop";
        "application/x-xar" = "org.gnome.FileRoller.desktop";
        "application/x-xz-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/x-xz" = "org.gnome.FileRoller.desktop";
        "application/x-zstd-compressed-tar" = "org.gnome.FileRoller.desktop";
        "application/zip" = "org.gnome.FileRoller.desktop";
        "application/zlib" = "org.gnome.FileRoller.desktop";
        "application/zstd" = "org.gnome.FileRoller.desktop";
        #video
        "video/mp4" = "vlc.desktop";
        "video/mov" = "vlc.desktop";
        "video/x-ms-wmv" = "vlc.desktop";
        "video/quicktime" = "vlc.desktop";
        "video/vnd.avi" = "vlc.desktop";
        "video/webm" = "vlc.desktop";
        "video/mpeg" = "vlc.desktop";
        "video/x-matroska" = "vlc.desktop";
        #vscode
        "text/plain" = "codium.desktop";
        "text/x-c" = "codium.desktop";
        "text/x-c++" = "codium.desktop";
        "text/x-c++src" = "codium.desktop";
        "text/x-chdr" = "codium.desktop";
        "text/x-csrc" = "codium.desktop";
        "text/x-diff" = "codium.desktop";
        "text/x-dsrc" = "codium.desktop";
        "text/x-haskell" = "codium.desktop";
        "text/x-java" = "codium.desktop";
        "text/x-makefile" = "codium.desktop";
        "text/x-moc" = "codium.desktop";
        "text/x-pcs-gcd" = "codium.desktop";
        "text/x-perl" = "codium.desktop";
        "text/x-python" = "codium.desktop";
        "text/x-scala" = "codium.desktop";
        "text/x-scheme" = "codium.desktop";
        "text/css" = "codium.desktop";
        "text/x-shellscript" = "codium.desktop";
        "text/x-cmake" = "codium.desktop";
        "text/x-csharp" = "codium.desktop";
        "text/x-log" = "codium.desktop";
        "text/x-matlab" = "codium.desktop";
        "text/markdown" = "codium.desktop";
        "application/x-shellscript" = "codium.desktop";
        "application/xml" = "codium.desktop";
        "application/javascript" = "codium.desktop";
        "application/json" = "codium.desktop";
        "application/octet-stream" = "codium.desktop";
        "application/ovf" = "codium.desktop";
        "application/toml" = "codium.desktop";
        "application/x-docbook+xml" = "codium.desktop";
        "application/x-wine-extension-ini" = "codium.desktop";
        "application/x-yaml" = "codium.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      };
    };
  };
}
