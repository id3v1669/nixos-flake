{ lib
, config
, pkgs
, ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
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
    # extencions are broken for ungoogled-chromium
    # extensions = [
    #   {
    #     # << LibRedirect >>
	  #     id = "oladmjdebphlnjjcnomfhhbfdldiimaf";
    #     updateUrl = "https://raw.githubusercontent.com/libredirect/browser_extension/master/src/updates/updates.xml";
    #   }
    #   {
    #     # << Chromium Web Store >>
	  #     id = "ocaahdebbfolfmndjeplogmgcagdmblk";
	  #     updateUrl = "https://raw.githubusercontent.com/NeverDecaf/chromium-web-store/master/updates.xml";
    #   }
    #   # { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
    #   # { id = "pjbgfifennfhnbkhoidkdchbflppjncb"; } # dark reader
    #   # { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
    #   # { id = "bgnkhhnnamicmpeenaelnjfhikgbkllg"; } # adguard
    #   # { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # duckduckgo
    #   # { id = "clngdbkpkpeebahjckkjfobafhncgmne"; } # Stylus
    #   # { id = "ikclbgejgcbdlhjmckecmdljlpbhmbmf"; } # HTTPS Everywhere
    #   # { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
    #   # { id = "njdfdhgcmkocbgbhcioffdbicglldapd"; } # LocalCDN
    #   {
    #     id = "dcpihecpambacapedldabdbpakmachpb";
    #     updateUrl = "https://raw.githubusercontent.com/iamadamdev/bypass-paywalls-chrome/master/src/updates/updates.xml";
    #   }
    # ];
  };
}