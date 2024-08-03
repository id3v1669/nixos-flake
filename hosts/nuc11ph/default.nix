{ pkgs
, stable-pkgs
, system
, uservars
, gpuvar
, curversion
, lib
, ...
}:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
    ./../../modules/bluetooth.nix
  ];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  users.users.${uservars.name}.extraGroups = [
    "wheel"
    "networkmanager"
    "rustdesk"
    "adbusers"
    "input" 
    "disk"
    "wireshark"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  environment = {
    variables = {
    } // lib.optionalAttrs ( gpuvar.tech == "nvk") {
      WLR_DRM_DEVICES = "/dev/dri/card0";                  # output with nvidia only
    } // lib.optionalAttrs (gpuvar.tech == "prime") {
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";   # output with intel, nvidia sync mode
    };
    systemPackages = (with pkgs; [
    ]);
  };
  system.stateVersion = "${curversion}";
}
