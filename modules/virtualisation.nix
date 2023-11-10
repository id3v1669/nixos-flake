{lib, config, pkgs, gpuvar, ...}: 
{
  virtualisation = {
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
    #waydroid.enable = true;
    libvirtd.enable = true;
  };
}


