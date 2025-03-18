{
  lib,
  curversion,
  uservars,
  envir,
  colorsvar,
  desk,
  inputs,
  gpuvar,
  config,
  ...
}: {
  imports =
    [
      ./programs
      ./pkgs
      ./enviroment/systemd
      inputs.base16x2.homeManagerModules.default
    ]
    ++ lib.lists.optionals (envir != "none") [
      ./scripts
      ./enviroment/qt
      ./enviroment/dconf
      ./enviroment/gtk
      ./enviroment/anyrun
      ./enviroment/xdg
      #./enviroment/lan-mouse
      ./enviroment/${envir}
    ]
    ++ lib.lists.optionals (envir == "Hyprland") [
      ./enviroment/eww
      ./enviroment/swaync
      ./enviroment/hyprlock
    ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
    sessionVariables = {
      __GL_VRR_ALLOWED = "0";
      __GL_GSYNC_ALLOWED = "0";
      MOZ_ENABLE_WAYLAND = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "${envir}";
      NIXOS_OZONE_WL = "1";
    };
  };
  palette = "${colorsvar}";
}
