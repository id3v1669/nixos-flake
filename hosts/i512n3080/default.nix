{ pkgs
, stable
, system
, uservars
, gpuvar
, curversion
, lib
, config
, ...
}:
{
  imports = [ 
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
  
  users.users.${uservars.name}.extraGroups = [
    "users"
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
    systemPackages = [
#       (pkgs.stdenv.mkDerivation rec 
# {
#   pname = "millennium";
#   version = "2.11.1";

#   src = pkgs.fetchurl {
#     url="https://github.com/SteamClientHomebrew/Millennium/releases/download/v2.11.1/millennium-v2.11.1-linux-x86_64.tar.gz";
#     hash = "sha256-dqwigLzkesLCtwUHk3fhiOwPVsOZFpzlivIV7dVJeNM=";
#   };
#   dontUnpack = true;

#   nativeBuildInputs = [ pkgs.gnutar ];

#   installPhase = ''
#   mkdir -p $out/lib
# ${lib.getExe' pkgs.gnutar "tar"} -xf $src -C $out/lib
#   '';
# })
    ];
    etc."hypr/monitor-init.conf".text = ''
monitor=DP-3,3440x1440@144,0x0,1
monitor=DP-2,disable
cursor:allow_dumb_copy = false
cursor:no_hardware_cursors = true
render:explicit_sync=0
    '';
  };
  system.stateVersion = "${curversion}";
}
