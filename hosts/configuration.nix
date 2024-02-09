{ lib
, pkgs
, deflocale
, uservars
, hostname
, envir
, cpuvar
, gpuvar
, bootloader
, ...
}: 
{
  imports = [ 
    ./../modules/envspecials/${envir}.nix 
    ./../modules/bootloaders/${bootloader.type}.nix
  ];
  networking = {
    hostName = "${hostname}${envir}";
    networkmanager.enable = true;

    useDHCP = lib.mkDefault true;
    enableIPv6 = lib.mkDefault true;
  };
  programs.fish.enable = true;                  
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
  environment.systemPackages = [ pkgs.fish ];
  time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
  nix = {
    settings = {
      experimental-features = [ "flakes" "nix-command" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  services = {
    xserver = {
      enable = true;
      xkb = {
        variant = "${deflocale.kbvariant}";
        options = "${deflocale.kboption}";
        layout = "${deflocale.kblayout}";
      };
    };
  };
}
