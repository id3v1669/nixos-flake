{ config, lib, pkgs, uservars, ... }:
{
  imports = [
  ];
  home.file.".local/share/icons/dynamic-icon-theme/index.theme".text = ''
[Icon Theme]
Name=dynamic-icon-theme
Comment=dynamic-icon-theme

Example=folder

DesktopDefault=48
DesktopSizes=22,24,32,48,64
ToolbarDefault=24
ToolbarSizes=22,24,32,48
MainToolbarDefault=24
MainToolbarSizes=22,24,32,48
SmallDefault=22
SmallSizes=22,24,32,48
PanelDefault=48
PanelSizes=22,24,32,48,64
DialogDefault=48
DialogSizes=22,24,32,48,64

# Directory list
Directories=22x22/places,24x24/places,32x32/places,48x48/places,64x64/places

[22x22/places]
Size=22
Type=Fixed

[24x24/places]
Size=24
Type=Fixed

[32x32/places]
Size=32
Type=Fixed

[48x48/places]
Size=48
Type=Fixed

[64x64/places]
Size=64
Type=Fixed

[22x22/places]
Size=22
Type=Fixed

  '';
}