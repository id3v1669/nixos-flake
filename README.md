# NixOS flake on Hyprland + eww + rofi

NixOS flake with home manager

Latest commit to use: cc05609255b12b0d7d46b16f19f61e9b60b43dc4

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | - | - |
| bar | eww | fork of eww with tray support | - |
| background | swaybg | - | - |
| portals | gtk and hyprland | - | - |
| lockscreen | - | not needed for now, might install ly later | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 2+3 |
| notifications | dunst | - | - |
| shell | fish | works | ToDo 6 |

## ToDo:

1. **-fix brightness control for multimonitor config**

2. **-find gamma tool for unsupported brightness monitors and cables**

3. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

4. **-create update script and alias to rebuild and update archbox**

5. **-fish aliases for git**

6. **-create one-color background depending on system colors**

7. **create dynamic-icon-theme on color-vars**

## Notes:

OpenRGB Module is broken and installed manually

vesktop(0.4.2) fixed with updating vencord to 1.6.0

eww buttons fixet by box with empty element, later find better approach
