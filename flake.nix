{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    sops-nix.url = "github:Mic92/sops-nix";
    nur.url = "github:nix-community/NUR";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16x2 = {
      url = "github:id3v1669/base16x2-color-shemes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dcgt = {
      url = "github:id3v1669/Dynamic-Color-GTK-Theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ndct-sddm = {
      url = "github:id3v1669/ndct-sddm-corners";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
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
    swhkd = {
      url = "github:id3v1669/swhkd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { ... } @ inputs:
  let 
    mkSystem = (import ./lib/mkSyst.nix { inherit inputs; }).mkSyst;
  in
  {
    nixosConfigurations = {
      i912n3080hypr = mkSystem { 
        hostname = "i912n3080";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "secureboot";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "DP-3";
        };
      };
      i912n3080hyprnvk = mkSystem {
        hostname = "i912n3080";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "secureboot";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "nvk";
          port = "DP-3";
        };
      };
      i912n3080KDE = mkSystem { 
        hostname = "i912n3080";
        envir = "KDE";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "secureboot";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "DP-3";
        };
      };
      nuc10chhypr = mkSystem { 
        hostname = "nuc10ch";
        envir = "Hyprland";
        cpuvar = "intel";
        bootloader = {
          type = "systemd";
          defconf = false;
          timeout = 10;
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
          tech = "amd";
        };
      };
      l14g3hypr = mkSystem { 
        hostname = "l14g3";
        envir = "Hyprland";
        cpuvar = "amd";
        desk = "laptop";
        bootloader = {
          type = "systemd";
          defconf = false;
          timeout = 10;
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
          tech = "amd";
        };
      };
      mbp14-3hypr = mkSystem { 
        hostname = "mbp14-3";
        envir = "Hyprland";
        cpuvar = "intel";
        desk = "laptop";
        bootloader = {
          type = "systemd";
          defconf = false;
          timeout = 10;
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
    };
  };
}
