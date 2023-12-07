{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, bootloader, desk, ...}: 
{
  boot.loader = {
    timeout = bootloader.timeout;
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      devices = [ "nodev" ];
      theme = pkgs.stdenv.mkDerivation {
  pname = "distro-grub-themes";
  version = "3.1";
  src = pkgs.fetchFromGitHub {
    owner = "AdisonCavani";
    repo = "distro-grub-themes";
    rev = "v3.1";
    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
  };
  installPhase = "cp -r customize/nixos $out";
};
      enable = true;
      efiSupport = true;
      useOSProber = true;
    };
  };
}