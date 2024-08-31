{ lib
, gpuvar
, desk
, uservars
, pkgs
, ...
}: 
{
  security.virtualisation.flushL1DataCache = "always";                         # flush L1 data cache on context switch
  programs.virt-manager = {                                                    # gui for managing vms       
    enable = true;
    package = pkgs.virt-manager;
  };
  hardware.nvidia-container-toolkit = {                                        # nvidia container toolkit
    enable = (gpuvar.type == "nvidia");
  };
  virtualisation = let notsrv = desk!="server"; in {
    waydroid.enable = notsrv;                                                  # waydroid for android apps
    spiceUSBRedirection.enable = notsrv;                                       # USB redirection to vm
    virtualbox = {
      host = {
        enable = notsrv;
        addNetworkInterface = true;
      };
      guest.enable = notsrv;
    };
    libvirtd = {
      enable = notsrv;                                                         # libvirtd for virt-manager
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = notsrv;
        ovmf = {
          enable = notsrv;
          packages = [ pkgs.OVMFFull.fd ];
        };
        vhostUserPackages = with pkgs; [
          spice
          spice-gtk
          spice-protocol
          virt-viewer
          virtio-win
          virtiofsd
          win-spice
        ];
      };
    };
    docker.enable = true;
  };
  users.users.${uservars.name}.extraGroups = [
    "docker"
    "kvm"
    "qemu-libvirtd"
    "libvirtd"
    "vboxusers"
  ];
  environment = {
    etc."vbox/networks.conf".text = ''
      * 10.0.0.0/8 192.168.0.0/16 172.28.0.0/16
      * 2001::/64
    '';
    systemPackages = with pkgs; [
      nur.repos.ataraxiasjel.waydroid-script
    ];
  };
}


