{
  description = "id3v1669 system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    sops-nix.url = "github:Mic92/sops-nix";
    nur.url = "github:nix-community/NUR";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    #dcgt.url = "github:id3v1669/Dynamic-Color-GTK-Theme";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lan-mouse = {
      url = "github:feschber/lan-mouse";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16x2 = {
      url = "github:id3v1669/base16x2-color-shemes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ndct-sddm = {
      url = "github:id3v1669/ndct-sddm-corners";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eww = {
      url = "github:id3v1669/eww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swhkdp = {
      url = "github:id3v1669/swhkdp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waysip = {
      url = "github:waycrate/waysip";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prism-launcher = {
      url = "github:PrismLauncher/PrismLauncher/release-9.x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: let
    mkSystem = (import ./lib/mkSyst.nix {inherit inputs;}).mkSyst;
  in {
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      r7rx7900xtxhypr = mkSystem {
        hostname = "r7rx7900xtx";
        envir = "Hyprland";
        bootloader = {
          type = "limine";
          timeout = 7;
        };
        cpuvar = {
          type = "amd";
          hasIntegrated = false;
        };
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
          tech = "desktop";
        };
      };
      nuc10chhypr = mkSystem {
        hostname = "nuc10ch";
        envir = "Hyprland";
        bootloader = {
          type = "limine";
          timeout = 7;
        };
        cpuvar = {
          type = "intel";
          hasIntegrated = false;
        };
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
          tech = "broken";
        };
      };
      l14g3hypr = mkSystem {
        hostname = "l14g3";
        envir = "Hyprland";
        cpuvar = {
          type = "amd";
          hasIntegrated = true;
          integratedBroken = false;
        };
        desk = "laptop";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
          tech = "amd";
        };
      };
      mbp14-3hypr = mkSystem {
        hostname = "mbp14-3";
        envir = "Hyprland";
        cpuvar = {
          type = "intel";
          hasIntegrated = true;
        };
        desk = "laptop";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
          tech = "amd";
        };
      };
      srvnet510 = mkSystem {
        hostname = "srvnet510";
        envir = "none";
        desk = "server";
        bootloader = {
          type = "grub";
          timeout = 1;
          device = "/dev/vda";
        };
        gpuvar = {
          type = "none";
          tech = "none";
        };
        uservars = {
          name = "srvnet510pq";
          description = "serverUser510";
          domain = "id3v1669.com";
          owner = "id3v1669";
        };
        deflocale = {
          kblayout = "au";
          kbvariant = "";
          kboption = "";
          timezone = "Australia/Perth";
          locale = "en_AU.UTF-8";
        };
      };
      srvcon400 = mkSystem {
        hostname = "srvcon400";
        envir = "none";
        desk = "server";
        bootloader = {
          type = "grub";
          timeout = 1;
          device = "/dev/sda";
        };
        gpuvar = {
          type = "none";
          tech = "none";
        };
        uservars = {
          name = "srvcon400user";
          description = "SrvCon400";
          domain = "id3v1669.com";
          owner = "id3v1669";
        };
        deflocale = {
          kblayout = "au";
          kbvariant = "";
          kboption = "";
          timezone = "Australia/Perth";
          locale = "en_AU.UTF-8";
        };
      };
    };
  };
}
