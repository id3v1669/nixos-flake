{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/corebird.css".text = ''
.button.text-only-button:hover{
    color: @selected_bg_color;
}

.button.text-only-button:active,
.button.text-only-button:active:hover {
    color: @selected_bg_color;
    background-color: transparent;
}
  '';
}
