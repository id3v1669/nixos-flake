{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  kernel = import ./kernel.nix {nixpkgs = inputs.nixpkgs;};
  ftm5Module = import ./ftm5.nix {
    nixpkgs = inputs.nixpkgs;
    inherit kernel;
  };
  perseusKernelPackages = import ./kernel-package.nix {
    nixpkgs = inputs.nixpkgs;
    inherit kernel;
  };

  perseusFirmware = import ./firmware.nix {inherit pkgs;};
  firmwareEnv = pkgs.buildEnv {
    name = "perseus-firmware-env";
    paths = [perseusFirmware pkgs.linux-firmware pkgs.wireless-regdb];
    pathsToLink = ["/lib/firmware"];
    ignoreCollisions = true;
  };
in {
  boot = {
    kernelPackages = perseusKernelPackages;
    kernelModules = ["qrtr" "qcom_pd_mapper" "reset_qcom_pdc" "qcom_q6v5_mss" "ath10k_snoc"];
    blacklistedKernelModules = ["qcom_q6v5_pas" "stmfts"];
    kernelParams = [
      "pd_ignore_unused"
      "clk_ignore_unused"
      "efi=novamap"
      "earlycon=efifb,mem"
      "console=tty0"
      "panic=30"
      "firmware_class.path=/firmware"
    ];
    kernel.sysctl."kernel.printk" = "3 4 1 3";
    initrd = {
      enable = true;
      systemd.tpm2.enable = false;
      #Keep minimal so NixOS doesn't try to bundle modules the phone kernel doesn't build
      availableKernelModules = [];
      includeDefaultModules = false;
      systemd.contents = {
        "/firmware/qcom/a630_sqe.fw".source = "${firmwareEnv}/lib/firmware/qcom/a630_sqe.fw";
        "/firmware/qcom/a630_gmu.bin".source = "${firmwareEnv}/lib/firmware/qcom/a630_gmu.bin";
        "/firmware/qcom/sdm845/Xiaomi/perseus/a630_zap.mbn".source = "${firmwareEnv}/lib/firmware/qcom/sdm845/Xiaomi/perseus/a630_zap.mbn";
      };
    };
  };
  # out-of-tree ftm5 touchscreen driver at boot
  systemd = {
    tmpfiles.rules = [
      "L+ /lib/firmware - - - - ${firmwareEnv}/lib/firmware"
    ];
    services.ftm5 = {
      description = "Load ftm5 touchscreen driver";
      wantedBy = ["multi-user.target"];
      before = ["ttykeyboardrs.service"];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.kmod}/bin/insmod ${ftm5Module}/ftm5.ko";
        ExecStop = "-${pkgs.kmod}/bin/rmmod ftm5";
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_ROOT";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/ESP";
    fsType = "vfat";
    options = ["nofail"];
  };

  hardware = {
    enableRedistributableFirmware = false;
    wirelessRegulatoryDatabase = true;
    firmware = [perseusFirmware pkgs.linux-firmware];
    deviceTree = {
      enable = true;
      name = "qcom/sdm845-xiaomi-perseus.dtb";
    };
  };
}
