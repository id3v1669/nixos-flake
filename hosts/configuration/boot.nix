{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, ...}: 
{
  boot = {
    loader = {
      timeout = 15;     
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        #configurationLimit = 10; #disabled for now due to unfinished dotfiles
      };
    };
  };
}