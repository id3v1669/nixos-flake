{ uservars
, curversion
, ...
}:
{
  imports =[ 
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../pcsconf.nix
    ./../../modules/virtualisation.nix
    ./../../modules/udevrules.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/swhkd.nix
    ./../../modules/sudo.nix
    ./../../modules/sops.nix
  ];
  
  networking.firewall.enable = false;
  sops.secrets."outline" = {
    sopsFile = ./. + "/../../secrets/${uservars.owner}.enc.yaml";
    owner = "${uservars.name}";
  };
  
  users.users.${uservars.name}.extraGroups = [ 
    "wheel"
    "networkmanager"
    "docker"
    "rustdesk"
    "adbusers"
    "kvm"
    "input" 
    "disk" 
    "qemu-libvirtd"
    "libvirtd"
    "video"
    "wireshark"
    "pipewire"
    "i2c"
    "outlinevpn"
  ];
  environment.variables = {
    #system vars
    EDITOR = "nano";
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
  system.stateVersion = "${curversion}";
}
# WLR_NO_HARDWARE_CURSORS = "1";