{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./assets
    ./dist
    #./gresource.nix
    ./new_gtk_resource_configuration_base64.nix
  ];
  home.file.".themes/dynamic-color-theme/gtk-3.20/gtk-dark.css".text = ''
  @import url("resource:///org/numixproject/gtk/dist/gtk-dark.css");
  '';
  home.file.".themes/dynamic-color-theme/gtk-3.20/gtk.css".text = ''
  @import url("resource:///org/numixproject/gtk-3.20/dist/gtk-dark.css");
  '';
  home.file.".themes/dynamic-color-theme/gtk-3.20/gtk.gresource.xml".text = ''
<?xml version='1.0' encoding='UTF-8'?>
<gresources>
        <gresource prefix='/org/numixproject/gtk-3.20'>
                <file preprocess='to-pixdata'>assets/checkbox-checked-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/checkbox-checked.svg</file>
                <file preprocess='to-pixdata'>assets/checkbox-mixed-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/checkbox-mixed.svg</file>
                <file preprocess='to-pixdata'>assets/grid-selection-checked.svg</file>
                <file preprocess='to-pixdata'>assets/grid-selection-unchecked.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-checked-hover.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-checked-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-checked.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-unchecked.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-mixed-hover.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-mixed-selected.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-mixed-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-checkbox-mixed.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-checked-hover.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-checked-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-checked.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-unchecked.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-mixed-hover.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-mixed-selected.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-mixed-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/menuitem-radio-mixed.svg</file>
                <file preprocess='to-pixdata'>assets/radio-checked-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/radio-checked.svg</file>
                <file preprocess='to-pixdata'>assets/radio-mixed-insensitive.svg</file>
                <file preprocess='to-pixdata'>assets/radio-mixed.svg</file>
                <file>dist/gtk.css</file>
                <file>dist/gtk-dark.css</file>
        </gresource>
</gresources>
  '';
  
}