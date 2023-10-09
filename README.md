# NixOS flake on Hyprland + eww + rofi

NixOS flake with most of tools and apps located in home manager

Latest commit to use: 5987f3c59b49108aca8b4535d2234e8fe3383548

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | works | - |
| bar | eww | fork of eww with tray support | ToDo 1 |
| background | hyprpaper | - | ToDo 2 |
| portals | gtk and hyprland | work but many things to fix | ToDo 3+4 |
| lockscreen | - | not needed for now might install ly later | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 5+8 |
| notifications | dunst | works, need to change style | ToDo 7 |
| shell | fish | works | ToDo 13 |
| applications | - | some are broken on nvidia, some do not exist on nixpkgs | ToDo 6+9+10 |



## ToDo:

1. **+-Setup eww**
    1. **-declare eww config**
    2. **+- microphone mute/unmute icon in bar(fix icon to change onclick)**
    3. **- sound icon with %**
        1. **- on hover show per-app volume control**
        2. **- on click open pavucontrol**
    4. **+-Infoblock**
        1. **+- show cpu temp(fix for laptop)**
        2. **+- show disk usage(design?)**
    5. **- calendar popup**
    6. **battery for laptop**

2. **+-Add background(enable for laptop only on power)**

3. **-flatpak xdg paths related to [issue](https://github.com/flatpak/xdg-desktop-portal-gtk/issues/440)**  

4. **-xdg-open for apps in lutris and distrobox**

5. **-fix brightness control for multimonitor config**

6. **-pack discord-screenaudio into nix packages**

7. **-change notifications style**

8. **-find gamma tool for unsupported brightness monitors and cables**

9. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

10. **+-Nvidia... partitialy fixed by adding 2 flake entries hdm1(games but single monitor and flickering) and tb(multimonitor config, no flickering, but games have staters due to nvidia-offload and output through igpu)**
    1. **Fix elecron apps on nvidia via hdmi**
    2. **fix steam client flickering on nvidia hdmi**
    3. **find good parameters for csgo for tb option**
    4. **Cyberpunk crashes on hdmi, Env vars??**

11. **-create update script and alias to rebuild and update archbox**

12. **Kitty config(do not confirm quit)**

13. **fish aliases for git**

## Notes:

OpenRGB Module is broken and installed manually

discord-screenaudio (ToDo 6) has broken screenshare(black screen), sound stream and all other functions work


