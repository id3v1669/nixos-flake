{ pkgs
, stable-pkgs
, system
, uservars
, gpuvar
, curversion
, lib
, config
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
    ./../../modules/security.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
    ./../../modules/bluetooth.nix
  ];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };
  services.displayManager.sddm.wayland.compositorCommand = 
  let 
    cxkb = config.services.xserver.xkb;
    weston-ini = pkgs.writeText "weston.ini" ''
      [core]
      xwayland=false
      shell=fullscreen-shell.so

      [keyboard]
      keymap_model=${builtins.toString cxkb.model}
      keymap_layout=${builtins.toString cxkb.layout}
      keymap_options=${builtins.toString cxkb.options}
      keymapvariant=

      [libinput]
      enable-tap=true
      left-handed=false

      [output]
      name=DP-3
      mode=3440x1440@144

      [output]
      name=DP-2
      mode=off
    '';
  in "${lib.getExe pkgs.weston} --shell=kiosk -c ${weston-ini}";

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
    systemPackages = (with pkgs; [
    ]);
  };
  system.stateVersion = "${curversion}";
}
