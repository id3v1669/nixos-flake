{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  secrets = import ./secrets.nix;

  tqftpservMaster = pkgs.tqftpserv.overrideAttrs (old: {
    version = "unstable-2026-master";
    src = pkgs.fetchzip {
      url = "https://github.com/linux-msm/tqftpserv/archive/b6bb92d40cfffe28621abcf7bfaa6d99beea46cb.tar.gz";
      sha256 = "0kfi2vlkwxdmr6p8m4xaqyn1kqdw2w1slbcfjbf62vjcf2x64z5m";
    };
    buildInputs = (old.buildInputs or []) ++ [pkgs.zstd];
    postPatch = "";
  });

  portType = "/sys/class/typec/port0/port_type";
  usbHostStep = pkgs.writeShellScript "usb-host-step" ''
    ${pkgs.systemd}/bin/systemctl stop usb-gadget.service || true
    if [ -e /sys/kernel/config/usb_gadget/g1/UDC ]; then
      echo "" > /sys/kernel/config/usb_gadget/g1/UDC 2>/dev/null || true
    fi
    echo source > ${portType}
  '';
  usbGadgetStep = pkgs.writeShellScript "usb-gadget-step" ''
    echo sink > ${portType}
    ${pkgs.coreutils}/bin/sleep 1
    ${pkgs.systemd}/bin/systemctl restart usb-gadget.service
  '';
  usbHost = pkgs.writeShellScriptBin "usb-host" ''
    exec ${pkgs.systemd}/bin/systemd-run --collect --quiet --unit=usb-role-host ${usbHostStep}
  '';
  usbGadget = pkgs.writeShellScriptBin "usb-gadget" ''
    exec ${pkgs.systemd}/bin/systemd-run --collect --quiet --unit=usb-role-gadget ${usbGadgetStep}
  '';
in {
  imports = [
    ./hardware-configuration.nix
    ./../configuration.nix
    ./../../modules/fonts.nix
    ./../../modules/sound.nix
    ./../../modules/gpu.nix
    ./../../modules/bluetooth.nix
    ./../../modules/sudo.nix
  ];

  #temp untill ready
  nixpkgs.overlays = [
    (final: prev: {
      ttykeyboardrs = final.rustPlatform.buildRustPackage {
        pname = "ttykeyboardrs";
        version = "0.2.0";
        src = final.lib.cleanSource /home/user/myrepos/ttykeyboardrs;
        cargoLock.lockFile = /home/user/myrepos/ttykeyboardrs/Cargo.lock;
        doCheck = false;
      };
    })
  ];

  #system.replaceDependencies.replacements = lib.mkForce [ ];  # when don't have time to wait for build

  sops = {
    defaultSopsFile = ./../../secrets/user/wifi.enc.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = ["/etc/ssh/master"];
    secrets = {
      wifi_ssid = {};
      wifi_psk = {};
      wifi_enterprise_ssid = {};
      wifi_enterprise_identity = {};
      wifi_enterprise_password = {};
    };
    templates."wireless-networks.conf" = {
      owner = "wpa_supplicant";
      restartUnits = ["wpa_supplicant.service"];
      content = ''
        network={
          ssid="${config.sops.placeholder.wifi_ssid}"
          key_mgmt=WPA-PSK
          psk="${config.sops.placeholder.wifi_psk}"
        }
        #for now fails, problems with wifi5 support disabled on router
        network={
          ssid="${config.sops.placeholder.wifi_enterprise_ssid}"
          key_mgmt=WPA-EAP
          eap=TTLS
          identity="${config.sops.placeholder.wifi_enterprise_identity}"
          password="${config.sops.placeholder.wifi_enterprise_password}"
          phase2="auth=MSCHAPV2"
        }
      '';
    };
  };
  networking = {
    useDHCP = false;
    firewall.enable = false;
    networkmanager.enable = lib.mkForce false; # perseus uses wpa_supplicant
    interfaces.wlan0.useDHCP = true;
    hostName = lib.mkForce "perseus";
    wireless = {
      enable = true;
      extraConfig = "country=AU";
      extraConfigFiles = [config.sops.templates."wireless-networks.conf".path];
    };
  };

  services = {
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="typec", KERNEL=="port0", ATTR{port_type}="sink"
    '';
    getty.autologinUser = "root"; #TEMP until fully configured
    xserver.enable = lib.mkForce false; #TEMP for now disabled
    scx.enable = lib.mkForce false; #no scx in kernel
    openssh = {
      enable = true;
      settings.PermitRootLogin = "prohibit-password";
    };
    avahi = {
      enable = true;
      publish.enable = true;
      publish.addresses = true;
    };
  };

  # NixOS owns /lib/modules, so only the firmware symlink remains
  systemd = {
    services = {
      rmtfs = {
        description = "Qualcomm remote filesystem service (modem EFS)";
        wantedBy = ["multi-user.target"];
        after = ["systemd-udev-settle.service"];
        serviceConfig = {
          ExecStart = "${pkgs.rmtfs}/bin/rmtfs -r -P -s";
          Restart = "always";
          RestartSec = "1";
        };
      };
      tqftpserv = {
        description = "Qualcomm TQFTP server (serves wlanmdsp over QRTR)";
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          ExecStart = "${tqftpservMaster}/bin/tqftpserv";
          Restart = "always";
          RestartSec = "1";
        };
      };
      modem-rproc = {
        description = "Start modem remoteproc (required for wcn3990 wifi)";
        wantedBy = ["multi-user.target"];
        after = ["rmtfs.service" "tqftpserv.service"];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          for i in $(seq 1 60); do
            for r in /sys/class/remoteproc/remoteproc*; do
              [ -e "$r/name" ] || continue
              case "$(cat $r/name)" in
                *modem*|*mss*|*4080000*)
                  if [ "$(cat $r/state)" = running ]; then
                    echo "modem remoteproc running"; exit 0
                  fi
                  echo start > $r/state 2>/dev/null || true
                  ;;
              esac
            done
            sleep 2
          done
          echo "modem remoteproc did not reach running state" >&2; exit 1
        '';
      };
      # USB gadget: NCM ethernet at 172.16.42.1 (same convention as pmOS initramfs).
      usb-gadget = {
        description = "USB NCM gadget + static IP";
        wantedBy = ["multi-user.target"];
        after = ["systemd-tmpfiles-setup.service" "sys-kernel-config.mount"];
        requires = ["sys-kernel-config.mount"];
        serviceConfig.Type = "oneshot";
        serviceConfig.RemainAfterExit = true;
        path = [pkgs.kmod pkgs.iproute2];
        script = ''
          modprobe libcomposite
          modprobe usb_f_ncm
          g=/sys/kernel/config/usb_gadget/g1
          mkdir -p $g
          echo 0x18d1 > $g/idVendor
          echo 0xd001 > $g/idProduct
          mkdir -p $g/strings/0x409
          echo perseus > $g/strings/0x409/product
          echo NixOS > $g/strings/0x409/manufacturer
          echo 0123456789 > $g/strings/0x409/serialnumber
          mkdir -p $g/configs/c.1/strings/0x409
          echo "NCM" > $g/configs/c.1/strings/0x409/configuration
          mkdir -p $g/functions/ncm.usb0
          ln -sf $g/functions/ncm.usb0 $g/configs/c.1/ || true
          echo a600000.usb > $g/UDC
          sleep 1
          ip link set usb0 up
          ip addr replace 172.16.42.1/24 dev usb0
        '';
      };
      # wcn3990 wlan0 only appears once the modem DSP has served its firmware
      wpa_supplicant = {
        after = ["modem-rproc.service"];
        wants = ["modem-rproc.service"];
        serviceConfig = {
          Restart = "always";
          RestartSec = "5";
        };
      };
      ttykeyboardrs = {
        description = "On-screen keyboard (Rust) on the framebuffer console";
        wantedBy = ["multi-user.target"];
        after = ["getty@tty1.service" "ftm5.service"];
        requires = ["ftm5.service"];
        unitConfig.ConditionPathExists = "/dev/tty0";
        serviceConfig = {
          Type = "exec";
          ExecStart = "${pkgs.ttykeyboardrs}/bin/ttykeyboardrs";
          Restart = "always";
          RestartSec = "1s";
        };
      };
    };
  };
  users.users.root = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRrL2yHDWPbnnpMTKGJ7Ww8LIHHCveyUg1EXq877hGf user@l14g3Hyprland"
    ];
  };

  environment.systemPackages = with pkgs;
    [
      hyprland
      tmate
      file
      kmod
      usbutils
      pciutils
      iproute2
      htop
      evtest
      iw
      mesa-demos
      vulkan-tools
    ]
    ++ [usbHost usbGadget pkgs.ttykeyboardrs];
}
