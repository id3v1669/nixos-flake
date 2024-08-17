{ lib
, gpuvar
, desk
, uservars
, pkgs
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";                         # flush L1 data cache on context switch
  programs.virt-manager = {                                                    # gui for managing vms       
    enable = true;
    package = pkgs.virt-manager;
  };
  hardware.nvidia-container-toolkit = {                                        # nvidia container toolkit
    enable = (gpuvar.type == "nvidia");
  };
  virtualisation = let notsrv = desk!="server"; in {
    waydroid.enable = notsrv;                                                  # waydroid for android apps
    spiceUSBRedirection.enable = notsrv;                                       # USB redirection to vm
    libvirtd = {
      enable = notsrv;                                                         # libvirtd for virt-manager
      qemu = {
        package = pkgs.qemu_full;
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
    docker.enable = true;
  };
  users.users.${uservars.name}.extraGroups = [
    "docker"
    "kvm"
    "qemu-libvirtd"
    "libvirtd"
  ];
  environment.systemPackages = with pkgs; [
    nur.repos.ataraxiasjel.waydroid-script
  ];
}


