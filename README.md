## nixos-flake

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

3. **-lockscreen needed??**

4. **-fix flatpak xdg paths**

5. **-fix brightness control for multimonitor config**

6. **-pack discord-screenautio into nix packages**

999. **+-Nvidia... partitialy fixed by adding 2 flake entries hdm1(games but single monitor and flickering) and tb(multimonitor config, no flickering, but games have staters due to nvidia-offload and output through igpu)**
    1. **Fix elecron apps on nvidia via hdmi**
    2. **fix steam client flickering on nvidia hdmi**
    3. **find good parameters for csgo for tb option**
    4. **Cyberpunk crashes on hdmi, Env vars??**