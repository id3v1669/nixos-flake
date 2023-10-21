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
| lockscreen | - | not needed for now, might install ly later | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 5+8 |
| notifications | dunst | works, need to change style | ToDo 7 |
| shell | fish | works | ToDo 13 |
| applications | - | Check Notes | ToDo 6+9+10 |



## ToDo:

1. **+-Setup eww**
    1. **-declare eww config**
    3. **- sound icon with %**
        1. **- on hover show per-app volume control**
        2. **- on click open pavucontrol**
    4. **- calendar popup**
    5. **battery for laptop**

2. **+-Add background(enable for laptop only on power)**

3. **-flatpak xdg paths related to [issue](https://github.com/flatpak/xdg-desktop-portal-gtk/issues/440)**  

4. **-xdg-open for apps in lutris and distrobox**

5. **-fix brightness control for multimonitor config**

6. **-+pack discord-screenaudio into nix packages**

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

14. **fix emojis in distrobox**

15. **setup theme(qt5,qt6,gtk3,gtk4)**

## Notes:

OpenRGB Module is broken and installed manually

discord-screenaudio(dscr from now) (ToDo 6) with qt5 has broken screenshare(black screen), sound stream and all other functions work,
during attempts to start screensharing app searches for libpipewire-0.2.so.1

If path is set with --set LD_LIBRARY_PATH app starts but crashes during attempts to start screensharing with:
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x10} ---
+++ killed by SIGSEGV (core dumped) +++

With qt6 dscr works, but doesn't save login session, looks like issue is related to lack of premissions to write. Patch needed to declare [CacheLocation](https://doc.qt.io/qtforpython-6/PySide6/QtWebEngineCore/QWebEngineProfile.html#PySide6.QtWebEngineCore.PySide6.QtWebEngineCore.QWebEngineProfile.defaultProfile)

Update on dscr qt6 version, patch didn't work, looks like issue related to qt6.qtwebengine or qt6.base

Update on dscr qt6 version, problem is related to \[discord\] \[DatabaseManager\] active user changed (now: undefined, was: null, was: undefined)
