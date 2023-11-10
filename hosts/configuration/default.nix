{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, desk, ...}: 
{
  imports =
  [
    ./services.nix
    ./progs.nix
    ./boot.nix
    ./varssysnix.nix
  ] ++ lib.lists.optionals ( desk == "desktop" || desk == "laptop" ) [
    ./hardware.nix
    ./udevrules.nix
    ./fonts.nix
    ./pcs.nix
  ];
  networking = {
    hostName = "${hostname}${envir}";
    networkmanager.enable = true;

    useDHCP = lib.mkDefault true;
    enableIPv6 = lib.mkDefault true;
  };
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    shell = pkgs.fish;
  };
}
