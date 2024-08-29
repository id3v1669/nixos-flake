<h1 align="center"> <code>NixOS❄️</code> flake for Hyprland </h1>

<h2 id="nixos-flake" align="center">
  <br>
  <div align="center">
    <a href="https://github.com/id3v1669/nixos-flake/stargazers">
      <img src="https://img.shields.io/github/stars/id3v1669/nixos-flake?color=d79921&labelColor=282828&style=for-the-badge&logo=starship&logoColor=d79921">
    </a>
    <a href="https://github.com/id3v1669/nixos-flake/">
      <img src="https://img.shields.io/github/repo-size/id3v1669/nixos-flake?color=98971a&labelColor=282828&style=for-the-badge&logo=github&logoColor=98971a">
    </a>
    <a href="https://github.com/id3v1669/nixos-flake/blob/master/LICENSE">
      <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=GPL-3&colorA=282828&colorB=8f3f71&logo=unlicense&logoColor=8f3f71&"/>
    </a>
    <br>
    <a href="https://nixos.org">
      <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=white&color=458588">
    </a>
  </div>
</h2>

NixOS flake with home manager

## Main
| Environment | Name | Comment | Needed fix |
|-----|-----|-----|-----|
| WM | Hyprland | tested on igpu, amd apu, amd dgpu, nvidia optimus(with intel), nvidia native | - |
| launcher | anyrun | - | - |
| bar | eww | fork of eww | - |
| background | hyprpaper | - | - |
| portals | gtk and hyprland | - | - |
| login manager | sddm | - | - |
| lockscreen | hyprlock | - | - |
| brightness | light and ddcutil | Cable and monior must support DDC | ToDo 1+2 |
| notifications | swaync | gtk themeing needs to be done | - |
| shell | fish | - | - |
| bootloader | opencore(systemd mod) | extra folder OC reated, reads systemd entries | ToDo 9 |

## Notes

sway and plasma are just for testing
