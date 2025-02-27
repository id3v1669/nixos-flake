final: pkgs: {
  libratbag = pkgs.libratbag.overrideAttrs (oldAttrs: rec {
    src = pkgs.fetchFromGitHub {
      owner = "nathanrossi";
      repo = "libratbag";
      rev = "e473d74a669a657b8bc16269e9ccaaa9043145d4";
      hash = "sha256-S8lIB5Q7BBguXRGV8+BxRJbTNjQHatDRnQQyM98yC6Y=";
    };
    postInstall = let
    cfg1 = ''
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
    cfg2 = ''
[Device]
Name=Logitech G Pro X Wireless Superlight 2
DeviceMatch=usb:046d:40a9;usb:046d:c09b;usb:046d:c54d
DeviceType=mouse
Driver=hidpp20

[Driver/hidpp20]
DeviceIndex=1
    '';
    in 
    ''
      echo "${cfg1}" > $out/share/libratbag/asus-rog-pugio-2.device
      rm $out/share/libratbag/logitech-g-pro-x-wireless-superlight-2.device
      echo "${cfg2}" > $out/share/libratbag/logitech-g-pro-x-wireless-superlight-2.device
    '';
  });
}
