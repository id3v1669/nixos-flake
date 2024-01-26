{ pkgs
, ...
}: pkgs.hyprpicker.overrideAttrs (oldAttrs: rec {
  patches = [
    ./fix.patch
  ];
})
