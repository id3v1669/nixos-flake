{lib, config, pkgs, curversion, deflocale, uservars, hostname, inputs, envir, cpuvar, system, gpuvar, desk, ...}: 
{
  imports =
    [ 
      ./hardware.nix
      ./services.nix
      ./progs.nix
      ./boot.nix
      ./varssysnix.nix      
    ] ++ lib.lists.optionals ( desk == "desktop" || desk == "laptop" ) [
      ./udevrules.nix
      ./fonts.nix
      ./pcs.nix
    ] ++ lib.lists.optionals ( hostname == "srvnet510" ) [
      ./srvnet510.nix
    ];
  sops = {
    defaultSopsFile = ./../../secrets/secret.enc.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${uservars.name}/.config/sops/age/keys.txt";
    secrets."nextcloud/db-password" = {
      owner = "${uservars.name}";
    };
    secrets."nextcloud/admin-password" = {
      owner = "${uservars.name}";
    };
    secrets.example-key = {
      mode = "0440";
      owner = "${uservars.name}";
    };
  };
  networking = {
    hostName = "${hostname}${envir}";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    enableIPv6 = true;
  } // lib.optionalAttrs (desk == "desktop" || desk == "laptop") {
    firewall.enable = false;
  };
  virtualisation = {
    docker = {
      enable = true;
    } // lib.optionalAttrs (gpuvar.type == "nvidia") { enableNvidia = true; };
  } // lib.optionalAttrs (desk == "desktop" || desk == "laptop") {
    waydroid.enable = true;
    libvirtd.enable = true;
  };
  users.users.${uservars.name} = {
    isNormalUser = true;
    description = "${uservars.description}";
    extraGroups = [ "wheel" "networkmanager" "docker" "postgres" "nextcloud" ] ++ lib.lists.optionals ( desk != "server" ) [ "rustdesk" "adbusers" "kvm" "input" "disk" "qemu-libvirtd" "libvirtd" "video" "wireshark" "pipewire" "i2c" ];
    shell = pkgs.fish;
  };
}
