{ pkgs
, ...
}: pkgs.sherlock.overrideAttrs (oldAttrs: rec {
  version = "unstable-2024-02-16";

  src = oldAttrs.src.override {
    rev = "e3a09f8bf185d62bad8781e36fb64fa9637ba3d0";
    hash = "sha256-VWDIARI5iwSvxOy9vGMvMt7PsibS6AfK8bMQTo9CX8k=";
  };
})
