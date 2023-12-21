# NixOS flake on Hyprland/Sway + eww + rofi

NixOS flake with home manager

Latest commit to use: 0f7589e2ec860f2d90da45ea8ee1d6d659b8a7b2

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland/Sway | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel) | - |
| launcher | Rofi | - | - |
| bar | eww | fork of eww with tray support | ToDo 7+6 |
| background | swaybg | - | - |
| portals | gtk and hyprland/wlr(sway) | - | - |
| login manager | gdm | - | - |
| lockscreen | swaylock | - | ToDo 11 |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 1+2 |
| notifications | dunst | - | - |
| shell | fish | - | - |
| bootloader | opencore(systemd mod) | extra folder OC reated, reads systemd entries | ToDo 12 |

## ToDo

1. **-fix brightness control for multimonitor config**

2. **-find gamma tool for unsupported brightness monitors and cables**

3. **-fix audio input in windows apps like yousician(lutris) and rocksmith(steam)**

4. **rewrite readme**

5. **migrate krita from flatpak to nixpkgs**

6. **edit scripts to update eww sound and workspaces after hyprland loads**

7. **fix eww glitch on launcher button**

8. **fix adb udev rules(overwrite or manual install instead of module)**

9. **patch invoke-ai(pytorch) to clean vram after error "CUDA error: out of memory"**

10. **patch dsdt for nuc11ph(acpi errors)**

11. **find what causes pc freeze after long await time in swaylock(guess swhkd problem)**

12. **Create module to use opencore as bootloader**

## Notes:

OpenRGB Module is broken and installed manually

eww buttons fixet by box with empty element, later find better approach

swhkd works, but has a dirty patch. Check if issue in desctiption to [commit](https://github.com/waycrate/swhkd/commit/6877854183dce2dbd583cf4be82a890ccd7b1f4e) still exists as error was ioctl(15, RFKILL_IOCTL_NOINPUT, 0)      = -1 ENOSYS (Function not implemented)

vscode is used instead of vscode-fhs as last one has problems on wayland + iGPU and wayland + nvidia
