{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [
      "--force-dark-mode"
      "--disable-search-engine-collection"
      "--extension-mime-request-handling=always-prompt-for-install"
      "--fingerprinting-canvas-image-data-noise"
      "--fingerprinting-canvas-measuretext-noise"
      "--fingerprinting-client-rects-noise"
      "--popups-to-tabs"
      "--show-avatar-button=incognito-and-guest"

      "--enable-accelerated-video-decode"
      "--enable-gpu-rasterization"
      "--enable-oop-rasterization"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
      "--ozone-platform=wayland"
      "--enable-features=${
        lib.strings.concatStringsSep "," [
          "UseOzonePlatform"
          "BackForwardCache:enable_same_site/true"
          "CopyLinkToText"
          "OverlayScrollbar"
          "TabHoverCardImages"
          "VaapiVideoDecoder"
        ]
      }"
    ];
    dictionaries = with pkgs; [
      hunspellDictsChromium.en_US
    ];
  };
}
