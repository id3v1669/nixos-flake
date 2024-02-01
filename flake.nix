{
  description = "id3v1669 system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    flake-utils.url = "github:numtide/flake-utils";
    nixmox.url = "github:Sorixelle/nixmox";
    sops-nix.url = "github:Mic92/sops-nix";
    nixified-ai.url = "github:nixified-ai/flake";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eww-tray = {
     url = "github:ralismark/eww/tray-3";
     flake = true;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat = {
      url = "github:inclyc/flake-compat";
      flake = false;
    };
  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    hyprland,
    nur,
    nixmox,
    xdghypr,
    eww-tray,
    sops-nix,
    nix-colors,
    nixified-ai,
    ... }@inputs: 
  let
    inherit (self) outputs;
    curversion = "23.11";
    mkSyst = { 
      hostname,
      envir,
      desk ? "desktop",
      bootloader ? {
        type = "opencore";
        defconf = true;
        timeout = 10;
        device = "nodev";
      },
      gpuvar ? {
        type = "nvidia";
        tech = "prime";
        busd = "PCI:01:00:0";
        busi = "PCI:00:02:0";
        port = "tbqhd";
      },
      system ? "x86_64-linux",
      cpuvar ? "intel",
      colorsvar ? "gruvbox-dark-pale",
      brightnesctrl ? {
        up = "ddcutil setvcp 10 + 5";
        down = "ddcutil setvcp 10 - 5";
      },
      uservars ? {
        name = "user";
        description = "id3v1669";
        owner = "id3v1669";
        domain = "none";
        proxy = false;
        wp = "default1.png";
        sleeptimeout = 1200;
      },
      deflocale ? {
        kblayout = "us,ru";
        kbvariant = ",";
        kboption = "grp:win_space_toggle";
        timezone = "Australia/Perth";
        locale = "en_AU.UTF-8";
      }
    }: let 
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = 
      [
        nur.overlay
        nixmox.overlay
        (final: prev: {
          over-intel-vaapi-driver = prev.vaapiIntel.override { enableHybridCodec = true; };     # intel vaapi driver with hybrid codec support
          over-opencore = (prev.callPackage ./overlays/opencore.nix {});                        # opencore bootloader files as official repo doesn't have it (later create module)
          over-swhkd = (prev.callPackage ./overlays/swhkd.nix {});                                  # hotkey daemon as official repo doesn't have it
          over-tun2socks = (prev.callPackage ./overlays/tun2socks.nix {});                      # tun2socks as official package is not up to date
          over-outline-manager = (prev.callPackage ./overlays/outline-manager.nix {});          # outline-manager as official repo doesn't have it
          over-tlauncher = (prev.callPackage ./overlays/tlauncher.nix {});                      # minecraft launcher as it was removed from nixpkgs
          over-xwalandvideobridge = (prev.callPackage ./overlays/xwaylandvideobridge.nix {});   # currently off as vesktop doesn't need it
          over-eww = eww-tray.packages.${prev.system}.default.override { withWayland = true; }; # overlay of eww(bar & widgets) with dynamic icons tray support
          over-hyprland = hyprland.packages.${prev.system}.hyprland;                            # hyprland overlay
          over-hypr-portal = xdghypr.packages.${prev.system}.xdg-desktop-portal-hyprland;       # hyprland portal overlay
          over-joplin = (prev.callPackage ./overlays/joplin.nix {});                            # joplin overlay as official package is not up to date
          over-vscode = (import ./overlays/vscode.nix { inherit pkgs; });                       # vscode overlay as official package is not up to date
          over-lutris = (import ./overlays/lutris.nix { inherit pkgs; });                       # lutris overlay with extra packages
          over-veracrypt = (prev.callPackage ./overlays/veracrypt {});                          # veracrypt overlay as official package is not up to date(later patch to run with sudo-rs instead of sudo)
          over-vesktop = (prev.callPackage ./overlays/vesktop {});                              # vesktop as official package is not up to date
          over-spotify = (prev.callPackage ./overlays/spot.nix {});                             # spotify with adblocker
          over-soundux = (prev.callPackage ./overlays/soundux.nix {});                          # soundux as official package is broken
          over-bootstrap-studio = (prev.callPackage ./overlays/bootstrap-studio.nix {});        # bootstrap-studio as official package is not up to date
          over-hyprpicker = (import ./overlays/hyprpicker { inherit pkgs; });                   # hyprpicker overlay as official package is broken on my configuration
          #-------------------------------------------------------------------------------------ai cuda stuff
          over-fooocus = (prev.callPackage ./overlays/fooocus {});                              # fooocus ai: still broken paths need to be fixed
          over-accelerate = (prev.python311Packages.accelerate.override {
            torch = prev.python311Packages.torchWithCuda;
          });
          over-pytorch-lightning = (prev.python311Packages.pytorch-lightning.override {
            torch = prev.python311Packages.torchWithCuda;
          });
          over-torchsde = (prev.python311Packages.torchsde.override {
            torch = prev.python311Packages.torchWithCuda;
          });
          over-torchvision = (prev.python311Packages.torchvision.override {
            torch = prev.python311Packages.torchWithCuda;
          });
          over-torchgpipe = (prev.python311Packages.torchgpipe.override {
            torch = prev.python311Packages.torchWithCuda;
          });
          over-pytorch-metric-learning = (prev.python311Packages.pytorch-metric-learning.override {
            torch = prev.python311Packages.torchWithCuda;
            torchvision = (prev.python311Packages.torchvision.override {
              torch = prev.python311Packages.torchWithCuda;
            });
            # FAILED tests/losses/test_histogram_loss.py::TestHistogramLoss::test_histogram_loss 
          }).overrideAttrs (oldAttrs: rec {
            disabledTests = [
              "TestDistributedLossWrapper"
              "TestInference"
              "test_histogram_loss"
              "test_get_nearest_neighbors"
              "test_tuplestoweights_sampler"
              "test_untrained_indexer"
              "test_metric_loss_only"
              "test_pca"
              "test_distributed_classifier_loss_and_miner"
              "test_global_embedding_space_tester"
              "test_with_same_parent_label_tester"
            ];
          });
          over-bitsandbytes = (prev.python311Packages.bitsandbytes.override {
            torch = prev.python311Packages.torchWithCuda;
          });
          over-timm = (prev.python311Packages.timm.override {
            torch = prev.python311Packages.torchWithCuda;
            torchvision = (prev.python311Packages.torchvision.override {
              torch = prev.python311Packages.torchWithCuda;
            });
          });
          over-opencv4 = (prev.python311Packages.opencv4.override {
            enableCuda = true;
            enableCublas = true;
            enableCudnn = true;
            enableCufft = true;
          });
          #--------------------------------------------------------------------------------------
        })
      ];
    };
    in nixpkgs.lib.nixosSystem 
    {
      specialArgs = {
        inherit outputs curversion uservars hostname envir deflocale pkgs cpuvar gpuvar desk system bootloader nixified-ai;
      };
      modules = [
        (./. + "/hosts/${hostname}")
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${uservars.name} = import (./. + "/home/home.nix") ;
            extraSpecialArgs = { inherit curversion hostname envir deflocale uservars colorsvar brightnesctrl gpuvar cpuvar desk sops-nix nix-colors; };
          };
        }
      ] ++ nixpkgs.lib.lists.optional (envir == "Hyprland") hyprland.nixosModules.default;
    };
  in {
    nixosConfigurations = {
      #top themes: vulcan, twilight, summercamp, stella, uwunicorn,
      #spaceduck, seti, selenized-black, rose-pine, rose-pine-moon, 
      #porple, phd, pasque, pandora, outrun-dark, mountain, material-darker,
      #lime, kimber, icy, gruvbox-dark-pale, grayscale-dark, darktooth, black-metal
      #mytop: pandora, stella, lime, gruvbox-dark-pale, outrun-dark, spaceduck, embers
      
      nuc11phhyprtbqhd = mkSyst {
        hostname = "nuc11ph";
        envir = "Hyprland";
        #colorsvar = "gruvbox-dark-pale";
        uservars = {
          name = "user";
          description = "id3v1669";
          proxy = true;
          domain = "none";
          wp = "sound.png";
          owner = "id3v1669";
          sleeptimeout = 99000;
        };
        bootloader = {
          type = "opencore";
          defconf = true;
          timeout = 10;
        };
      };
      nuc11phhyprtbfhd = mkSyst {
        hostname = "nuc11ph";
        envir = "Hyprland";
        uservars = {
          name = "user";
          description = "id3v1669";
          proxy = true;
          domain = "none";
          wp = "sound.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        gpuvar = {
          type = "nvidia";
          tech = "prime";
          busd = "PCI:01:00:0";
          busi = "PCI:00:02:0";
          port = "tbfhd";
        };
      };
      nuc11phhyprhdmi = mkSyst {
        hostname = "nuc11ph";
        envir = "Hyprland";
        gpuvar = {
          type = "nvidia";
          tech = "prime";
          busd = "PCI:01:00:0";
          busi = "PCI:00:02:0";
          port = "hdmiqhd";
        };
      };
      l14g3hypr = mkSyst { 
        hostname = "l14g3";
        envir = "Hyprland";
        cpuvar = "amd";
        desk = "laptop";
        bootloader = {
          type = "opencore";
          defconf = false;
          timeout = 10;
        };
        uservars = {
          name = "user";
          description = "id3v1669";
          proxy = true;
          domain = "none";
          wp = "default1.png";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
        };
      };
      l14g3sway = mkSyst { 
        hostname = "l14g3";
        envir = "sway";
        cpuvar = "amd";
        desk = "laptop";
        bootloader = {
          type = "opencore";
          defconf = false;
          timeout = 10;
        };
        uservars = {
          name = "user";
          description = "id3v1669";
          proxy = true;
          domain = "none";
          wp = "default1.png";
          owner = "id3v1669";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "amd";
        };
      };
      alexpchypr = mkSyst {
        hostname = "alexpc";
        envir = "Hyprland";
        gpuvar = {
          type = "amd";
        };
        uservars = {
          name = "user";
          description = "alexp";
          proxy = false;
          domain = "none";
          wp = "tyan_1.jpg";
          owner = "MorphDevC";
          sleeptimeout = 1200;
        };
        bootloader = {
          type = "opencore";
          defconf = true;
          timeout = 10;
        };
        deflocale = {
          kblayout = "us,ru";
          kbvariant = ",";
          kboption = "grp:win_space_toggle";
          timezone = "Russia/Moscow";
          locale = "ru_RU.UTF-8";
        };
      };
      srvnet510 = mkSyst {
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
