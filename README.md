# NixOS flake on Hyprland + eww + rofi

NixOS flake with home manager

Latest commit to use: 3e55c699ba3c64dad1ef9b33a4c42da28d5fbd73

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | - | - |
| bar | eww | fork of eww with tray support | - |
| background | hyprpaper | - | - |
| portals | gtk and hyprland | - | - |
| login manager | gdm | - | - |
| lockscreen | hyprlock | - | - |
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

9. **find idler that works with gamepad**

10. **add notification widget with notififcation history(eww?)**

## Notes:

OpenRGB Module is broken and installed manually

eww buttons fixed by box with empty element, later find better approach

vscode is used instead of vscode-fhs as last one has problems on wayland + iGPU and wayland + nvidia

Usable colorshemes:
vulcan, twilight, summercamp, stella, uwunicorn,
spaceduck, seti, selenized-black, rose-pine, rose-pine-moon,
porple, phd, pasque, pandora, outrun-dark, mountain, material-darker,
lime, kimber, icy, gruvbox-dark-pale, grayscale-dark, darktooth, black-metal
mytop: pandora, stella, lime, gruvbox-dark-pale, outrun-dark, spaceduck, embers