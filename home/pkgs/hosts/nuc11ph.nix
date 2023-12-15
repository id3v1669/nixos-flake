{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    egl-wayland                 # for nvidia vms
    over-tlauncher              # launcher for minecraft
    spotify                     # music
    #krita                      # video editing currently installed via flatpak(fix needed)
    gimp                        # image editing
    over-outline-manager        # outline manager vpn(proxy)
    cudaPackages_12.cudatoolkit # cuda for AI
    over-fooocus
  ];
}
