{ pkgs
, system
, uservars
, curversion
, nixified-ai
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
    nixified-ai.nixosModules.invokeai
  ];
  services.usbmuxd.enable = true;
  networking.firewall.enable = false;
  sops.secrets."outline" = {
    sopsFile = ./. + "/../../secrets/${uservars.owner}.enc.yaml";
    owner = "${uservars.name}";
  };

  virtualisation.vmware = {
    guest.enable = true;
    host.enable = true;
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
    "veracrypt"
    "usbmux"
  ];
  environment = {
    variables = {
      #system vars
      EDITOR = "nano";
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    };
    systemPackages = (with pkgs; [
      libimobiledevice
      ifuse
      fuzzel
    #   nixified-ai.packages.${system}.invokeai-nvidia
    #   #nixified-ai.packages.${system}.textgen-nvidia
    # ]) ++ (with pkgs.cudaPackages; [
    #   nccl
    #   saxpy
    #   cudnn
    #   libnpp
    #   libcufft
    #   cuda_gdb
    #   nvidia_fs
    #   libnvjpeg
    #   libcurand
    #   libcufile
    #   libcublas
    #   cudnn_8_8
    #   cuda_nvvp
    #   cuda_nvtx
    #   cuda_nvcc
    #   cuda_cccl
    #   cuda_nvrtc
    #   cuda_cupti
    #   libcusparse
    #   libcusolver
    #   cudatoolkit
    #   #cuda_opencl # for cuda12
    #   cuda_nvprof
    #   cuda_nsight
    #   cuda_cudart
    #   setupCudaHook
    ]);
  };
  system.stateVersion = "${curversion}";
  nix.settings = {
    trusted-substituters = ["https://ai.cachix.org"];
    trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];
  };
}
# WLR_NO_HARDWARE_CURSORS = "1";