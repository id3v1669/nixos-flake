{ pkgs
, ...
}: 
(pkgs.libratbag.overrideAttrs (oldAttrs: rec {
  postInstall = let
  cfg = ''
[Device]
Name=ASUS ROG Pugio II
DeviceMatch=usb:0b05:1906
Driver=asus

[Driver/asus]
Profiles=3
Buttons=10
Leds=3
Dpis=4
DpiRange=100:16000@100
ButtonMapping=f0;f1;f2;e4;e5;e6;0;e8;e9;e1;e2
  '';
  in 
  ''
    echo "${cfg}" > $out/share/libratbag/asus-rog-pugio-2.device
  '';
}))