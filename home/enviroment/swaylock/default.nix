{ config
, pkgs
, ...
}:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      #general flags
      ignore-empty-password = true;
      show-keyboard-layout = true;
      daemonize = true;
      clock = true;
      indicator = true;

      #general
      font-size = 27;

      #effects
      effect-blur = "30x4";
      fade-in = 1;

      #ring
      indicator-radius = 250;
      indicator-thickness = 14;
      ring-color = "${config.colorScheme.palette.base07}";
      inside-color = "${config.colorScheme.palette.base0E}88";
      text-color = "${config.colorScheme.palette.base06}";
      line-color = "${config.colorScheme.palette.base01}";
      separator-color = "${config.colorScheme.palette.base05}";
      key-hl-color = "${config.colorScheme.palette.base03}";
      
      #verified
      text-ver-color = "${config.colorScheme.palette.base06}";
      inside-ver-color = "${config.colorScheme.palette.base0C}77";
      ring-ver-color = "${config.colorScheme.palette.base0B}";
      line-ver-color = "${config.colorScheme.palette.base01}";
      
      #keyboard layout(lang)
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "${config.colorScheme.palette.base04}";

      #to check
      color = "ff0000";
      screenshots = true; #??
    };
  };
}