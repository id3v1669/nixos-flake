{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nix-colors.url = "github:misterio77/nix-colors";
    base16x2.url = "github:id3v1669/base16x2-color-shemes";
    sops-nix.url = "github:Mic92/sops-nix";
    nur.url = "github:nix-community/NUR";
    anyrun = {
      url = "github:anyrun-org/anyrun";
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
    dcgt.url = "github:id3v1669/Dynamic-Color-GTK-Theme";
    swhkd = {
      url = "github:id3v1669/swhkd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs = {
        nixpkgs.follows = "nixpkgs";
        aquamarine.url = "github:hyprwm/aquamarine";
      };
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
  };
  outputs = { ... } @ inputs:
  let 
    mkSystem = (import ./lib/mkSyst.nix { inherit inputs; }).mkSyst;
  in
  {
    nixosConfigurations = {
      i512n3080hypr = mkSystem { 
        hostname = "i512n3080";
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
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "DP-3";
        };
      };
      i512n3080hyprnvk = mkSystem {
        hostname = "i512n3080";
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
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "nvk";
          port = "DP-3";
        };
      };
      i512n3080sway = mkSystem { 
        hostname = "i512n3080";
        envir = "sway";
        uservars = {
          name = "user";
          description = "id3v1669";
          domain = "none";
          wp = "default3.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "DP-3";
        };
      };
      i512n3080KDE = mkSystem { 
        hostname = "i512n3080";
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
          type = "systemd";
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
      nuc11phhyprhdmi = mkSystem {
        hostname = "nuc11ph";
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
          type = "systemd";
          timeout = 10;
        };
        gpuvar = {
          type = "nvidia";
          tech = "native";
          port = "hdmi";
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
