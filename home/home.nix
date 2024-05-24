{ lib
, curversion
, uservars
, envir
, colorsvar
, desk
, nix-colors
, gpuvar
, ...
}:
{
  imports = [
    ./programs
    ./pkgs
    ./enviroment/systemd
  ] ++ lib.lists.optionals (envir != "none") [
    ./assets
    ./../scripts
    ./enviroment/qt
    ./enviroment/dconf
    ./enviroment/gtk
    ./enviroment/rofi
    ./enviroment/xdg
    ./enviroment/swhkd
    ./enviroment/${envir}
    nix-colors.homeManagerModules.default
  ] ++ lib.lists.optionals (envir != "plasma5" && envir != "none") [
    ./enviroment/eww
    ./enviroment/dunst
    ./enviroment/hyprlock
  ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
    sessionVariables = {
      WLR_RENDERER="vulkan";
      WLR_BACKEND="vulkan";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND="wayland";
      QT_QPA_PLATFORM="wayland";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "${envir}";
      XDG_SESSION_DESKTOP = "${envir}";
    };
  };
} // lib.optionalAttrs (desk != "server") {
  colorScheme = nix-colors.colorSchemes.${colorsvar};
}
