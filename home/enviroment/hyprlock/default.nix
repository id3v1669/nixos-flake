{ pkgs
, config
, uservars
, colorsvar
, ... 
}:
let
  clp = config.palette;
in
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock.overrideAttrs (old: {
      patchPhase = ''
        substituteInPlace src/core/hyprlock.cpp \
        --replace "5000" "16"
      '';
      });
    settings = {
      general = {
        disable_loading_bar = false;
        hide_cursor = true;
        no_fade_in = false;
        no_fade_out = false;
      };
      background = [{
        monitor = "";
        path = "${config.home.homeDirectory}/Pictures/Wallpapers/${colorsvar}/${uservars.wp}";
        color = "rgb(${clp.base06.hex})";
        blur_size = 4;
        blur_passes = 3;
        noise = 0.0117;
        contrast = 1.3;
        brightness = 0.8;
        vibrancy = 0.21;
        vibrancy_darkness = 0.0;
      }];
      input-field = [{
        monitor = "";
        size = "250, 50";
        outline_thickness = 3;
        dots_size = 0.2;
        dots_spacing = 0.64;
        dots_center = true;
        outer_color = "rgb(${clp.base05.hex})";
        inner_color = "rgb(${clp.base06.hex})";
        font_color = "rgb(${clp.base04.hex})";
        fade_on_empty = true;
        placeholder_text = "<i>Password...</i>";
        hide_input = false;
        position = "0, -70";
        halign = "center";
        valign = "center";
      }];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000:1] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
          color = "rgb(${clp.base04.hex})";
          font_size = 64;
          font_family = "${clp.base09.hex}";
          position = "0, 70";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Hey <span text_transform=\"capitalize\" size=\"larger\">${uservars.description}</span>";
          color = "rgb(${clp.base04.hex})";
          font_size = 20;
          font_family = "${clp.base09.hex}";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Type to unlock!";
          color = "rgb(${clp.base04.hex})";
          font_size = 16;
          font_family = "${clp.base09.hex}";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}