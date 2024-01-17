{ lib
, gpuvar
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";                         # flush L1 data cache on context switch
  virtualisation = {
    spiceUSBRedirection.enable = true;                                         # USB redirection to vm
    libvirtd.enable = true;                                                    # libvirt daemon
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
  };
}


