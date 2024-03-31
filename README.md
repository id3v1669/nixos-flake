# NixOS flake on Hyprland/Sway + eww + rofi

NixOS flake with home manager

Latest commit to use: 3e55c699ba3c64dad1ef9b33a4c42da28d5fbd73

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland/Sway | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | - | - |
| bar | eww | fork of eww with tray support | - |
| background | swaybg | - | - |
| portals | gtk and hyprland/wlr(sway) | - | - |
| login manager | gdm | - | - |
| lockscreen | swaylock | - | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 1+2 |
| notifications | dunst | - | - |
| shell | fish | - | - |
| bootloader | opencore(systemd mod) | extra folder OC reated, reads systemd entries | - |

## ToDo

1. **-fix brightness control for multimonitor config**

2. **-find gamma tool for unsupported brightness monitors and cables**

3. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

4. **rewrite readme**

5. **fix adb udev rules(overwrite or manual install instead of module)**

6. **patch invoke-ai(pytorch) to clean vram after error "CUDA error: out of memory"**

7. **patch dsdt for nuc11ph(acpi errors)**

8. **rewrite gtk theme**

9. **fix of frind alternative to swayidle as it doesn't react to gamepad**

10. **add notification widget with notififcation history(eww?)**

## Notes:

OpenRGB Module is broken and installed manually

eww buttons fixed by box with empty element, later find better approach

vscode is used instead of vscode-fhs as last one has problems on wayland + iGPU and wayland + nvidia
