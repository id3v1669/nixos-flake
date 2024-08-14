{ config
, lib
, pkgs
, modulesPath
, system
, ...
}:
let
  audioFiles = pkgs.fetchFromGitHub {
    owner = "kekrby";
    repo = "t2-better-audio";
    rev = "e46839a28963e2f7d364020518b9dac98236bcae";
    hash = "sha256-x7K0qa++P1e1vuCGxnsFxL1d9+nwMtZUJ6Kd9e27TFs=";
  };

  audioFilesUdevRules = pkgs.runCommand "audio-files-udev-rules" {} ''
    mkdir -p $out/lib/udev/rules.d
    cp ${audioFiles}/files/*.rules $out/lib/udev/rules.d
    substituteInPlace $out/lib/udev/rules.d/*.rules --replace "/usr/bin/sed" "${pkgs.gnused}/bin/sed"
  '';

  overrideAudioFiles = package: pluginsPath:
    package.overrideAttrs (new: old: {
      preConfigurePhases = old.preConfigurePhases or [ ] ++ [ "postPatchPhase" ];
      postPatchPhase = ''
        cp -r ${audioFiles}/files/{profile-sets,paths} ${pluginsPath}/alsa/mixer/
      '';
    });

  pipewirePackage = overrideAudioFiles pkgs.pipewire "spa/plugins/";

  tiny-dfrPackage = pkgs.callPackage ./tiny-dfr.nix { };

  apple-set-os-loader-installer = pkgs.stdenv.mkDerivation {
    name = "apple-set-os-loader-installer-1.0";
    src = pkgs.fetchFromGitHub {
      owner = "Redecorating";
      repo = "apple_set_os-loader";
      rev = "r33.9856dc4";
      sha256 = "hvwqfoF989PfDRrwU0BMi69nFjPeOmSaD6vR6jIRK2Y=";
    };
    buildInputs = [ pkgs.gnu-efi ];
    buildPhase = ''
      substituteInPlace Makefile --replace "/usr" '$(GNU_EFI)'
      export GNU_EFI=${pkgs.gnu-efi}
      make
    '';
    installPhase = ''
      install -D bootx64_silent.efi $out/bootx64.efi
    '';
  };

  t2Cfg = config.hardware.apple-t2;

in
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelPackages = (pkgs.callPackage ./pkgs/linux-t2.nix { });
    kernelModules = [ "kvm-intel" ];
    kernelParams = [
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
      "intel_iommu=on"
      "iommu=pt"
      "pcie_ports=compat"
    ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "sd_mod" "uas" ];
      kernelModules = [ "amdgpu" "i915" "applespi" "spi_pxa2xx_platform" "intel_lpss_pci" "applesmc" "apple-bce" ];
    };
  };

  fileSystems."/" ={ 
    device = "/dev/disk/by-uuid/64e48775-e27b-4450-bf4b-0f3e1205b5c7";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C680-AD9B";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [MacBook(Pro) SPI Touchpads]
    MatchName=*Apple SPI Touchpad*
    ModelAppleTouchpad=1
    AttrTouchSizeRange=200:150
    AttrPalmSizeThreshold=1100

    [MacBook(Pro) SPI Keyboards]
    MatchName=*Apple SPI Keyboard*
    AttrKeyboardIntegration=internal

    [MacBookPro Touchbar]
    MatchBus=usb
    MatchVendor=0x05AC
    MatchProduct=0x8600
    AttrKeyboardIntegration=internal
  '';
  environment.etc."tiny-dfr/config.toml" = {
    source = "${tiny-dfrPackage}/share/tiny-dfr/config.toml";
  };

  services = {
    fstrim.enable = true;
    libinput.enable = true;
    udev.packages = [
      tiny-dfrPackage
      audioFilesUdevRules
    ];
    pipewire = {
      package = lib.mkForce pipewirePackage;
      wireplumber.package = lib.mkForce pkgs.wireplumber.override {
        pipewire = pipewirePackage;
      };
    };
  };

  systemd.services.tiny-dfr = {
    enable = true;
    description = "Tiny Apple silicon touch bar daemon";
    after = [ "systemd-user-sessions.service" "getty@tty1.service" "plymouth-quit.service" "systemd-logind.service" ];
    bindsTo = [ "dev-tiny_dfr_display.device" "dev-tiny_dfr_backlight.device" ];
    startLimitIntervalSec = 30;
    startLimitBurst = 2;
    script = "${tiny-dfrPackage}/bin/tiny-dfr";
    restartTriggers = [ tiny-dfrPackage ];
  };

  powerManagement.enable = true;

  networking.enableB43Firmware = true;
  enableRedistributableFirmware = true;
  swapDevices = [ ]; 

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}