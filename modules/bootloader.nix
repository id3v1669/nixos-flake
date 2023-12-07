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
      
      enable = true;
      efiSupport = true;
      useOSProber = true;
      theme = pkgs.stdenv.mkDerivation {
        pname = "distro-grub-themes";
        version = "3.2";
        src = pkgs.fetchFromGitHub {
          owner = "AdisonCavani";
          repo = "distro-grub-themes";
          rev = "v3.2";
          hash = "sha256-U5QfwXn4WyCXvv6A/CYv9IkR/uDx4xfdSgbXDl5bp9M=";
        };
        installPhase = ''
mkdir -p $out/tmp
cp $src/themes/nixos.tar $out/tmp
tar -xf $out/tmp/nixos.tar -C $out
rm -rf $out/tmp
        '';
      };
    };
  };
}