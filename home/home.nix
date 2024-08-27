{ lib
, curversion
, uservars
, envir
, colorsvar
, desk
, inputs
, gpuvar
, config
, ...
}:
{
  imports = [
    ./programs
    ./pkgs
    ./enviroment/systemd
  ] ++ lib.lists.optionals (envir != "none") [
    ./assets
    ./scripts
    ./enviroment/qt
    ./enviroment/dconf
    ./enviroment/gtk
    ./enviroment/anyrun
    ./enviroment/xdg
    ./enviroment/${envir}
    inputs.base16x2.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    inputs.anyrun.homeManagerModules.default
  ] ++ lib.lists.optionals (envir == "Hyprland" || envir == "sway") [
    ./enviroment/eww
    ./enviroment/swaync
    ./enviroment/hyprlock
  ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND="wayland";
      QT_QPA_PLATFORM="wayland";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "${envir}";
      NIXOS_OZONE_WL = "1";
    };
  };
} // lib.optionalAttrs (desk != "server") {
  colorScheme = inputs.nix-colors.colorSchemes.${colorsvar};
  palette = "gruvbox-dark";
}
