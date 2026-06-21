{
  pkgs,
  uservars,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/security.nix
    ./../../modules/sudo.nix
    ./../../modules/swhkdp.nix
    ./../../modules/bluetooth.nix
    #./../../modules/odoo.nix
  ];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
  };

  users.users.${uservars.name}.extraGroups = [
    "users"
    "wheel"
    "networkmanager"
    "rustdesk"
    "input"
    "disk"
    "i2c"
    "veracrypt"
    "usbmux"
  ];
  environment = {
    systemPackages = with pkgs; [
    ];
    etc."hypr/monitor-init.conf".text = ''
      #monitor=DP-1,3440x1440@100,0x0,1
      #monitor=HDMI-A-2,disable
    '';
  };
  nix.package = pkgs.nixVersions.latest;
  nix.settings = {
    auto-optimise-store = true;
    max-jobs = 2;
    cores = 3;
    keep-derivations = true;
    keep-outputs = true;
    system-features = [
      "nixos-test"
      "benchmark"
      "big-parallel"
      "kvm"
    ];
  };
  systemd.services.nix-daemon.serviceConfig.AllowedCPUs = "0-5";
}
