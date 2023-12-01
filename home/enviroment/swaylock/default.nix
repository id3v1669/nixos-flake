{ config, lib, pkgs, uservars, brightnesctrl, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      ignore-empty-password = true;
      show-keyboard-layout = true;
      daemonize = true;
      effect-blur = "30x4";
      clock = true;
      indicator = true;
      ring-color = "${config.colorScheme.colors.base07}";
      color = "ff0000";
      key-hl-color = "${config.colorScheme.colors.base03}";
      inside-color = "${config.colorScheme.colors.base0E}88";
      inside-ver-color = "${config.colorScheme.colors.base0C}77";
      separator-color = "${config.colorScheme.colors.base05}";
      text-color = "${config.colorScheme.colors.base06}";
      text-ver-color = "${config.colorScheme.colors.base06}";
      line-color = "${config.colorScheme.colors.base01}";
      line-ver-color = "${config.colorScheme.colors.base01}";
      ring-ver-color = "${config.colorScheme.colors.base0B}";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "${config.colorScheme.colors.base04}";
      font-size = 27;
      indicator-radius = 250;
      indicator-thickness = 14;
      screenshots = true;
      fade-in = 1;
    };
  };
}