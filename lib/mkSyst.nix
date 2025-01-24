{ inputs
, ...
}:
{
  mkSyst = { 
    hostname,
    envir,
    curversion ? "25.05",
    desk ? "desktop",
    bootloader ? ({
      type = "systemd";
      timeout = 10;
      device = "nodev";
    }),
    gpuvar ? ({
      type = "nvidia";
      tech = "prime";
      busd = "PCI:01:00:0"; # lspci -nn | grep VGA
      busi = "PCI:00:02:0";
      port = "tbqhd";
    }),
    system ? "x86_64-linux",
    cpuvar ? ({
      type = "intel";
      hasIntegrated = false;
      integratedBroken = false;
    }),
    colorsvar ? "gruvbox-dark",
    brightnesctrl ? ({
      up = "ddcutil setvcp 10 + 5";
      down = "ddcutil setvcp 10 - 5";
    }),
    uservars ? ({
      name = "user";
      description = "id3v1669";
      owner = "id3v1669";
      domain = "none";
      wp = "default3.png";
      sleeptimeout = 1200;
    }),
    deflocale ? ({
      kblayout = "us,ru";
      kbvariant = ",";
      kboption = "grp:win_space_toggle";
      timezone = "Australia/Perth";
      locale = "en_AU.UTF-8";
    })
  }:
  let
    stable = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    allSpecialArgs = {
      inherit 
        inputs
        stable
        hostname
        envir
        curversion
        desk
        bootloader
        gpuvar
        system
        cpuvar
        colorsvar
        brightnesctrl
        uservars
        deflocale;
    };
  in
  inputs.nixpkgs.lib.nixosSystem {
    specialArgs = allSpecialArgs;
    modules = [
      (./.. + "/hosts/${hostname}")
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.swhkd.nixosModules.default
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = import ./home-manager.nix { inherit allSpecialArgs; };
        nixpkgs = import ./nixpkgs.nix { inherit inputs allSpecialArgs; };
      }
    ];
  };
}
