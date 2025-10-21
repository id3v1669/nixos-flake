{
  lib,
  gpuvar,
  desk,
  uservars,
  pkgs,
  stable,
  ...
}: let
  notsrv = desk != "server";
in {
  security.virtualisation.flushL1DataCache = "always"; # flush L1 data cache on context switch
  programs.virt-manager = {
    # gui for managing vms
    enable = true;
    package = pkgs.virt-manager;
  };
  hardware.nvidia-container-toolkit = {
    # nvidia container toolkit
    enable = gpuvar.type == "nvidia" && gpuvar.tech != "nvk";
  };
  virtualisation = {
    spiceUSBRedirection.enable = notsrv; # USB redirection to vm
    libvirtd = {
      enable = notsrv; # libvirtd for virt-manager
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = notsrv;
        vhostUserPackages = with pkgs; [
          spice
          spice-gtk
          spice-protocol
          virt-viewer
          virtio-win
          virtiofsd
          win-spice
        ];
      };
    };
    podman = {
      enable = !notsrv; # podman for containers on vps
      extraPackages = [stable.podman-compose];
    };
    docker = {
      enable = notsrv; # docker for containers on local pc
      extraPackages = [stable.docker-compose];
    };
  };
  users.users.${uservars.name}.extraGroups =
    [
      "video"
      "render"
      "kvm"
      "qemu-libvirtd"
      "libvirtd"
      "input"
      "disk"
    ]
    ++ (
      if notsrv
      then ["docker"]
      else ["podman"]
    );
  environment = {
    systemPackages = with pkgs; [
      virglrenderer
      libGL
      spice
      spice-gtk
      spice-protocol
      virt-viewer
      virtio-win
      virtiofsd
      spice-vdagent
      spice-autorandr
    ];
  };
}
