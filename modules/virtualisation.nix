{ lib
, gpuvar
, desk
, pkgs
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";                         # flush L1 data cache on context switch
  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    virt-viewer
    virtio-win
    win-spice
  ];
  virtualisation = let notsrv = desk!="server"; in {
    spiceUSBRedirection.enable = notsrv;                               # USB redirection to vm
    libvirtd = {
      enable = notsrv;                                                 # libvirtd for virt-manager
      qemu = {
        package = pkgs.qemu_full;
        swtpm.enable = notsrv;
        ovmf = {
          enable = notsrv;
          packages = [ pkgs.OVMFFull.fd ];
        };
      };
    };
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
  };
}


