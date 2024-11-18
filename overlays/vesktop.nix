{ pkgs
, ...
}:
(pkgs.vesktop.override {
  electron = pkgs.electron;
}).overrideAttrs (oldAttrs: rec {
  postFixup = ''
   makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
     --add-flags $out/opt/Vesktop/resources/app.asar \
     --add-flags "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo,VaapiVideoDecodeLinuxGL,enable-zero-copy,ignore-gpu-blacklist,ignore-gpu-blocklist,disable-gpu-driver-bug-workaround"
  '';
  version = "1.5.3";
  src = oldAttrs.src.override {
    rev = "5d675efb643913ab04ac4aa9d9ff0c6af95b3914";
    hash = "sha256-GxelqDEnaZzElS8jLQFkSWqkD5SLmM2M+UZN2R9J5m8=";
  };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-ap4q0VNxobOxjTb3ULqanDoDl3Vc+h7PU0U6nlPVm+c=";
  });

  desktopItems = (pkgs.makeDesktopItem {
    name = "vesktop";
    desktopName = "Vesktop";
    exec = "vesktop %U";
    icon = "discord";
    startupWMClass = "Vesktop";
    genericName = "Internet Messenger";
    keywords = [
      "discord"
      "vencord"
      "electron"
      "chat"
    ];
    categories = [
      "Network"
      "InstantMessaging"
      "Chat"
    ];
  });
})