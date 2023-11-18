{ config, lib, pkgs, uservars, ... }:
{
  imports = [
  ];
  home.file.".themes/dynamic-color-theme/xfwm4/themerc".text = ''
button_offset=7
button_spacing=-7

show_app_icon=false

full_width_title=true

title_shadow_active=false
title_shadow_inactive=false

title_horizontal_offset=3

active_text_color=#afafaf
active_text_shadow_color=#252525

inactive_text_color=#808080
inactive_text_shadow_color=#252525

shadow_delta_height=2
shadow_delta_width=0
shadow_delta_x=0
shadow_delta_y=-5
shadow_opacity=40
  '';

home.file.".themes/dynamic-color-theme/xfwm4/bottom-active.png".source = ./. + "/bottom-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/bottom-inactive.png".source = ./. + "/bottom-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/bottom-left-active.png".source = ./. + "/bottom-left-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/bottom-left-inactive.png".source = ./. + "/bottom-left-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/bottom-right-active.png".source = ./. + "/bottom-right-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/bottom-right-inactive.png".source = ./. + "/bottom-right-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/close-active.png".source = ./. + "/close-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/close-inactive.png".source = ./. + "/close-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/close-prelight.png".source = ./. + "/close-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/close-pressed.png".source = ./. + "/close-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/hide-active.png".source = ./. + "/hide-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/hide-inactive.png".source = ./. + "/hide-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/hide-prelight.png".source = ./. + "/hide-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/hide-pressed.png".source = ./. + "/hide-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/left-active.png".source = ./. + "/left-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/left-inactive.png".source = ./. + "/left-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-active.png".source = ./. + "/maximize-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-inactive.png".source = ./. + "/maximize-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-prelight.png".source = ./. + "/maximize-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-pressed.png".source = ./. + "/maximize-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-toggled-active.png".source = ./. + "/maximize-toggled-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-toggled-inactive.png".source = ./. + "/maximize-toggled-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-toggled-prelight.png".source = ./. + "/maximize-toggled-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/maximize-toggled-pressed.png".source = ./. + "/maximize-toggled-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/menu-active.png".source = ./. + "/menu-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/menu-inactive.png".source = ./. + "/menu-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/menu-prelight.png".source = ./. + "/menu-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/menu-pressed.png".source = ./. + "/menu-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/right-active.png".source = ./. + "/right-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/right-inactive.png".source = ./. + "/right-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-active.png".source = ./. + "/shade-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-inactive.png".source = ./. + "/shade-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-prelight.png".source = ./. + "/shade-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-pressed.png".source = ./. + "/shade-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-toggled-active.png".source = ./. + "/shade-toggled-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-toggled-inactive.png".source = ./. + "/shade-toggled-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-toggled-prelight.png".source = ./. + "/shade-toggled-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/shade-toggled-pressed.png".source = ./. + "/shade-toggled-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-active.png".source = ./. + "/stick-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-inactive.png".source = ./. + "/stick-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-prelight.png".source = ./. + "/stick-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-pressed.png".source = ./. + "/stick-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-toggled-active.png".source = ./. + "/stick-toggled-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-toggled-inactive.png".source = ./. + "/stick-toggled-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-toggled-prelight.png".source = ./. + "/stick-toggled-prelight.png";
home.file.".themes/dynamic-color-theme/xfwm4/stick-toggled-pressed.png".source = ./. + "/stick-toggled-pressed.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-1-active.png".source = ./. + "/title-1-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-1-inactive.png".source = ./. + "/title-1-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-2-active.png".source = ./. + "/title-2-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-2-inactive.png".source = ./. + "/title-2-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-3-active.png".source = ./. + "/title-3-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-3-inactive.png".source = ./. + "/title-3-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-4-active.png".source = ./. + "/title-4-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-4-inactive.png".source = ./. + "/title-4-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-5-active.png".source = ./. + "/title-5-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/title-5-inactive.png".source = ./. + "/title-5-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/top-left-active.png".source = ./. + "/top-left-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/top-left-inactive.png".source = ./. + "/top-left-inactive.png";
home.file.".themes/dynamic-color-theme/xfwm4/top-right-active.png".source = ./. + "/top-right-active.png";
home.file.".themes/dynamic-color-theme/xfwm4/top-right-inactive.png".source = ./. + "/top-right-inactive.png";

}