{
  uservars,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    #./../../modules/auto-cpufreq.nix
    #./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
    ./../../modules/sudo.nix
    ./../../modules/swhkdp.nix
    ./../../modules/bluetooth.nix
    ./../../modules/greeters/regreet.nix
  ];

  environment.systemPackages = [
    pkgs.wirelesstools
  ];

  networking = {
    firewall.enable = false;
    localCommands = ''
      ${pkgs.wirelesstools}/bin/iwconfig wlp3s0 txpower 10dBm
    '';
  };
  users.users.${uservars.name}.extraGroups = [
    "wheel"
    "networkmanager"
    "rustdesk"
    "adbusers"
    "input"
    "disk"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
}
