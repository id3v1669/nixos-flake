{ pkgs
, stable-pkgs
, system
, uservars
, gpuvar
, curversion
, nixified-ai
, lib
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
    ./../../modules/bluetooth.nix
    nixified-ai.nixosModules.invokeai
  ];

  networking = {
    firewall.enable = false;
    enableIPv6 = false;
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
      egl-wayland
      libimobiledevice
      ifuse
      fuzzel
      # nixified-ai.packages.${system}.invokeai-nvidia
      # #nixified-ai.packages.${system}.textgen-nvidia
    ]);
  };
  system.stateVersion = "${curversion}";
}
