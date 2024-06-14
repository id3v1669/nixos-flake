# NixOS flake on Hyprland + eww + rofi

NixOS flake with home manager

Latest commit to use: b4db577b5898acd25870df42ab11713be5249e19

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel), nvidia native | - |
| launcher | Rofi | - | - |
| bar | eww | fork of eww with tray support | - |
| background | hyprpaper | - | - |
| portals | gtk and hyprland | - | - |
| login manager | gdm | - | - |
| lockscreen | hyprlock | - | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 1+2 |
| notifications | dunst | - | - |
| shell | fish | - | - |
| bootloader | opencore(systemd mod) | extra folder OC reated, reads systemd entries | ToDo 11 |

## ToDo

1. **-fix brightness control for multimonitor config**

2. **-find gamma tool for unsupported brightness monitors and cables**

3. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

4. **rewrite readme**

5. **fix adb udev rules(overwrite or manual install instead of module)**

6. **patch invoke-ai(pytorch) to clean vram after error "CUDA error: out of memory"**

7. **patch dsdt for nuc11ph(acpi errors)**

8. **fix sops**

9. **find idler that works with gamepad**

10. **add notification widget with notififcation history(eww?)**

11. **opencre is broken after systemd-boot update relace with grub or fix**

## Notes

OpenRGB Module is broken and installed manually

sway and plasma are just for testing
