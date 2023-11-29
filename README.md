# NixOS flake on Hyprland + eww + rofi

NixOS flake with home manager

Latest commit to use: d9d451e86645ffe4cadb26d5843b57aa35642e50

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | - | - |
| bar | eww | fork of eww with tray support | ToDo 7+6 |
| background | swaybg | - | - |
| portals | gtk and hyprland | - | - |
| lockscreen | - | not needed for now, might install ly later | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 1+2 |
| notifications | dunst | - | - |
| shell | fish | - | - |

## ToDo:

1. **-fix brightness control for multimonitor config**

2. **-find gamma tool for unsupported brightness monitors and cables**

3. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

4. **rewrite readme**

5. **migrate krita from flatpak to nixpkgs**

6. **edit scripts to update eww sound and workspaces after hyprland loads**

7. **fix eww glitch on launcher button**

## Notes:

OpenRGB Module is broken and installed manually

vesktop(0.4.2) fixed with updating vencord to 1.6.0

eww buttons fixet by box with empty element, later find better approach
