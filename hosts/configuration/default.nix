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
    secrets."myservice/my_subdir/my_secret" = {
      owner = "sometestservice";
    };
    secrets.example-key = {
      mode = "0440";
      owner = "${uservars.name}";
    };
  };
  systemd.services."sometestservice" = {
    script = ''
        echo "
        Hey bro! I'm a service, and imma send this secure password:
        $(cat ${config.sops.secrets."myservice/my_subdir/my_secret".path})
        located in:
        ${config.sops.secrets."myservice/my_subdir/my_secret".path}
        to database and hack the mainframe
        " > /var/lib/sometestservice/testfile
      '';
    serviceConfig = {
      User = "sometestservice";
      WorkingDirectory = "/var/lib/sometestservice";
    };
  };
  users.users.sometestservice = {
    home = "/var/lib/sometestservice";
    createHome = true;
    isSystemUser = true;
    group = "sometestservice";
  };
  users.groups.sometestservice = { };
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
    extraGroups = [ "wheel" "networkmanager" "docker" ] ++ lib.lists.optionals ( desk != "server" ) [ "rustdesk" "adbusers" "kvm" "input" "disk" "qemu-libvirtd" "libvirtd" "video" "wireshark" "pipewire" "i2c" ];
    shell = pkgs.fish;
  };
}
