{ lib
, gpuvar
, desk
, uservars
, pkgs
, stable
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";                         # flush L1 data cache on context switch
  programs.virt-manager = {                                                    # gui for managing vms       
    enable = true;
    package = pkgs.virt-manager;
  };
  hardware.nvidia-container-toolkit = {                                        # nvidia container toolkit
    enable = (gpuvar.type == "nvidia" && gpuvar.tech != "nvk");
  };
  virtualisation = let notsrv = desk!="server"; in {
    waydroid.enable = notsrv;                                                  # waydroid for android apps
    spiceUSBRedirection.enable = notsrv;                                       # USB redirection to vm
    libvirtd = {
      enable = notsrv;                                                         # libvirtd for virt-manager
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = notsrv;
        ovmf = {
          enable = notsrv;
          packages = [ pkgs.OVMFFull.fd ];
        };
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
      enable = true;
      extraPackages = [ pkgs.podman-compose ];
    };
  };
  users.users.${uservars.name}.extraGroups = [
    "podman"
    "kvm"
    "qemu-libvirtd"
    "libvirtd"
  ];
  environment = {
    systemPackages = with pkgs; [
      nur.repos.ataraxiasjel.waydroid-script
    ];
  };
}


