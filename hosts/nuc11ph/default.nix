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
    nixified-ai.nixosModules.invokeai
  ];

  services.usbmuxd.enable = true;
  networking.firewall.enable = false;
  sops.secrets."outline" = {
    sopsFile = ./. + "/../../secrets/${uservars.owner}.enc.yaml";
    owner = "${uservars.name}";
  };
  hardware.bluetooth.settings = {
    General = {
      ControllerMode = "dual";
    };
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
    } // lib.optionalAttrs (gpuvar.tech == "native" || gpuvar.tech == "nvk") {
      WLR_DRM_DEVICES = "/dev/dri/card0";                  # output with nvidia only
    } // lib.optionalAttrs (gpuvar.tech == "prime") {
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";   # output with intel, nvidia sync mode
    } // lib.optionalAttrs (gpuvar.tech == "nvk") {
      NVK_I_WANT_A_BROKEN_VULKAN_DRIVER = "1";             # prep for nvk
      MESA_VK_VERSION_OVERRIDE = "1.3";                    # prep for nvk
    };
    systemPackages = (with pkgs; [
      libimobiledevice
      ifuse
      fuzzel
    #winePackages.waylandFull
    #wineWowPackages.waylandFull
    #wine64Packages.waylandFull
    #wineWow64Packages.waylandFull
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
