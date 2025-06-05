{
  config,
  lib,
  pkgs,
  modulesPath,
  system,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-amd"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "uas" "sd_mod" "sdhci_pci"];
      kernelModules = ["amdgpu"];
      luks.devices."luks-6050a80c-f2a4-4040-83a9-792e091aade6".device = "/dev/disk/by-uuid/6050a80c-f2a4-4040-83a9-792e091aade6";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6d31cfe4-4971-4bb4-9103-3b148f9c27c5";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C8AA-8835";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
