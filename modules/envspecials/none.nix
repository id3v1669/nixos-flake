{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}