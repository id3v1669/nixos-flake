{ lib
, gpuvar
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";
  virtualisation = {
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
    libvirtd.enable = true;
  };
}


