# NixOS flake on Hyprland + eww + rofi

NixOS flake with most of tools and apps located in home manager

Latest commit to use: 0f55436e3ebf31ed42e70d31737c6696d19559a8

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
| shell | fish | works | ToDo 11 |

## ToDo:

1. **+-Add background(enable for laptop only on power)**

2. **-flatpak xdg paths related to [issue](https://github.com/flatpak/xdg-desktop-portal-gtk/issues/440)**  

3. **-xdg-open for apps in lutris and distrobox**

4. **-fix brightness control for multimonitor config**

5. **-change notifications style**

6. **-find gamma tool for unsupported brightness monitors and cables**

7. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

8. **+-Nvidia... partitialy fixed by adding 2 flake entries hdm1(games but single monitor and flickering) and tb(multimonitor config, no flickering, but games have staters due to nvidia-offload and output through igpu)**
    1. **Fix elecron apps on nvidia via hdmi**
    2. **fix steam client flickering on nvidia hdmi**
    3. **find good parameters for csgo for tb option**
    4. **Cyberpunk crashes on hdmi, Env vars??**

9. **-create update script and alias to rebuild and update archbox**

10. **-Kitty config(do not confirm quit)**

11. **-fish aliases for git**

12. **-fix emojis in distrobox**

13. **+-setup theme(qt5,qt6,gtk3,gtk4)**

14. **-create one-color background depending on system colors(check svg)**

## Notes:

OpenRGB Module is broken and installed manually

vesktop(0.4.2) fixed with updating vencord to 1.6.0