{ hyprland, inputs, config, lib, pkgs, curversion, uservars, envir, hostname, colorsvar, gpuvar, desk, ... }:
{
  imports = [
    ./programs
    ./pkgs
    ./hosts/${hostname}.nix
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./wallpapers
    ./../scripts
    ./enviroment/qt
    ./enviroment/dconf
    ./enviroment/gtk
    ./enviroment/rofi
    ./enviroment/eww
    ./enviroment/dunst
    ./enviroment/xdg
    ./enviroment/swhkd
    ./enviroment/swaylock
    inputs.nix-colors.homeManagerModules.default
  ] ++ lib.lists.optionals (envir == "hypr") [
    ./enviroment/hyprland
  ] ++ lib.lists.optionals (envir == "sway") [
    ./enviroment/sway
  ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
  };
} // lib.optionalAttrs (desk != "server") {
  colorScheme = inputs.nix-colors.colorSchemes.${colorsvar};
}
