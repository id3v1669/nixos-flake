{ pkgs
, ...
}:
(pkgs.equibop.override {
  electron = pkgs.electron;
})

# old nvidia attrs:
# --add-flags "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo,VaapiVideoDecodeLinuxGL,enable-zero-copy,ignore-gpu-blacklist,ignore-gpu-blocklist,disable-gpu-driver-bug-workaround"