# NixOS flake on Hyprland + eww + rofi

NixOS flake with home manager

Latest commit to use: 66085aabf10815b5cc919df688a2482fe23f1fc4

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | works | - |
| bar | eww | fork of eww with tray support | - |
| background | hyprpaper | - | ToDo 1 |
| portals | gtk and hyprland | work but many things to fix | ToDo 2+3 |
| lockscreen | - | not needed for now, might install ly later | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 4+6 |
| notifications | dunst | works, need to change style | ToDo 5 |
| shell | fish | works | ToDo 10 |

## ToDo:

1. **+-Add background(enable for laptop only on power)**

2. **-flatpak xdg paths related to [issue](https://github.com/flatpak/xdg-desktop-portal-gtk/issues/440)**  

3. **-xdg-open for apps in lutris and distrobox**

4. **-fix brightness control for multimonitor config**

5. **-change notifications style**

6. **-find gamma tool for unsupported brightness monitors and cables**

7. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

8. **-create update script and alias to rebuild and update archbox**

9. **-Kitty config(do not confirm quit)**

10. **-fish aliases for git**

11. **-fix emojis in distrobox**

12. **+-setup theme(qt5,qt6,gtk3,gtk4)**

13. **-create one-color background depending on system colors(check svg)**

## Notes:

OpenRGB Module is broken and installed manually

vesktop(0.4.2) fixed with updating vencord to 1.6.0

eww buttons fixet by box with empty element, later find better approach
