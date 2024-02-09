{ lib
, gpuvar
, desk
, pkgs
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";                         # flush L1 data cache on context switch
  virtualisation = {
    spiceUSBRedirection.enable = true;                                         # USB redirection to vm
    libvirtd.enable = desk!="server";                                          # libvirtd for virt-manager
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
  };
}


