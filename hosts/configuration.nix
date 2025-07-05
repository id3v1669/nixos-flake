{
  lib,
  pkgs,
  deflocale,
  uservars,
  hostname,
  envir,
  curversion,
  bootloader,
  colorsvar,
  ...
}: {
  imports = [
    ./../modules/envspecials/${envir}.nix
    ./../modules/bootloaders/${bootloader.type}.nix
    ./../modules/fish.nix
    ./../modules/ox.nix
  ];
  palette = "${colorsvar}";
  networking = {
    hostName = "${hostname}${envir}";
    networkmanager.enable = true;

    useDHCP = lib.mkDefault true;
    enableIPv6 = lib.mkDefault true;
  };
  programs = {
    nano.enable = true;
    direnv = {
      enable = true;
      loadInNixShell = false;
      nix-direnv.enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-all;
    };
  };
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
  environment.systemPackages = with pkgs; [
    ox
    eza
    (lib.hiPrio (uutils-coreutils-noprefix.overrideAttrs (old: {
      name = pkgs.coreutils.name;
    })))
    (lib.hiPrio pkgs.uutils-findutils)
  ];
  time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
  nix = {
    settings = {
      experimental-features = ["flakes" "nix-command"];
      warn-dirty = false;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  services = {
    scx = {
      enable = true;
      package = pkgs.scx_git.full;
      scheduler = "scx_rusty";
    };
    xserver = {
      enable = true;
      xkb = {
        variant = "${deflocale.kbvariant}";
        options = "${deflocale.kboption}";
        layout = "${deflocale.kblayout}";
      };
    };
  };
  system.stateVersion = "${curversion}";
  #system.replaceRuntimeDependencies = [
  #Broken due to uutils issue #6351
  # {
  #   original = pkgs.coreutils;
  #   replacement = pkgs.uutils-coreutils-noprefix.overrideAttrs (old: {
  #     name = pkgs.coreutils.name;
  #   });
  # }
  #];
}
