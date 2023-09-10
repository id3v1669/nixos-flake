{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, system, ...}: 
{
  environment.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  } // lib.optionalAttrs (envir == "hypr") {
    #__GL_VRR_ALLOWED = "1";
    #WLR_RENDERER_ALLOW_SOFTWARE = "1";
    #CLUTTER_BACKEND = "wayland";
    #WLR_RENDERER = "vulkan";
    #DisplayServer="wayland"; #try for sddm
    NIXOS_OZONE_WL = "1"; # needer for electron appps
    GDK_BACKEND = "wayland"; #,x11"; #edited 

    #XDG_CURRENT_DESKTOP = "Hyprland";
    #XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    #QT_QPA_PLATFORM="wayland";
    #QT_QPA_PLATFORMTHEME="wayland;xcb";
    #MOZ_ENABLE_WAYLAND = "1";
    #MOZ_WEBRENDER = "1";
   } // lib.optionalAttrs (envir == "hypr" && gpuvar == "nvidiaprime") {
    LIBVA_DRIVER_NAME = "nvidia";
    #GBM_BACKEND = "nvidia-drm";
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    #WLR_EGL_NO_MODIFIRES = "1"; ??
   };
   nixpkgs.hostPlatform = lib.mkDefault "${system}";
   time.timeZone = "${deflocale.timezone}";
  i18n.defaultLocale = "${deflocale.locale}";
   nix = {
    settings = {
      experimental-features = [ "flakes" "nix-command" ];
    #  auto-optimise-store = true;
    };
    #gc = {
    #  automatic = true;
    #  dates = "weekly";
    #  options = "--delete-older-than 7d";
    #};
  };
  system.stateVersion = "${curversion}";
}