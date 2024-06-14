{ config
, envir
, pkgs
, ...
}:
{

  home.file.".config/swhkd/env-controls".text = let 
    killactive = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch killactive"
      else if envir == "sway" then "swaymsg kill"
      else "";
    togglesplit = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch togglesplit"
      else if envir == "sway" then "swaymsg layout toggle split"
      else "echo 'no envir'";
    togglefloating = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch togglefloating"
      else if envir == "sway" then "swaymsg floating toggle"
      else "";
    pseudo = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch pseudo"
      else if envir == "sway" then "swaymsg pseudo"
      else "";
    nextworkspace = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch workspace e+1"
      else if envir == "sway" then "swaymsg workspace next"
      else "";
    prevworkspace = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch workspace e-1"
      else if envir == "sway" then "swaymsg workspace prev"
      else "";
    movenextworkspace = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch movetoworkspace e+1"
      else if envir == "sway" then "swaymsg move container to workspace next"
      else "";
    moveprevworkspace = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch movetoworkspace e-1"
      else if envir == "sway" then "swaymsg move container to workspace prev"
      else "";
    fullscreen = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch fullscreen"
      else if envir == "sway" then "swaymsg fullscreen toggle"
      else "";
    nextactivewindow = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch cyclenext"
      else if envir == "sway" then "swaymsg focus next"
      else "";
    movetoworkspace = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch movetoworkspace"
      else if envir == "sway" then "swaymsg move container to workspace"
      else "";
    workspace = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch workspace"
      else if envir == "sway" then "swaymsg workspace"
      else "";
    movefocus = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch movefocus "
      else if envir == "sway" then "bash -c 'if [ \"$@\" == \"r\" ]; then swaymsg focus right; elif [ \"$@\" == \"l\" ]; then swaymsg focus left; elif [ \"$@\" == \"d\" ]; then swaymsg focus down; elif [ \"$@\" == \"u\" ]; then swaymsg focus up; fi' -- "
      else "";
    exit = if envir=="Hyprland" then "${pkgs.over-hyprland}/bin/hyprctl dispatch exit"
      else if envir == "sway" then "swaymsg exit"
      else "";
  in ''

super + shift + q
  ${killactive}

super + s
  ${togglesplit}

super + j
  ${togglefloating}

super + g
  ${fullscreen}

super + p
  ${pseudo}

super + m
  ${exit}

super + tab
  ${nextactivewindow}

ctrl + right
  ${nextworkspace}

ctrl + left
  ${prevworkspace}

super + {1-9, 0}
  ${workspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

ctrl + shift + right
  ${movenextworkspace}

ctrl + shift + left
  ${moveprevworkspace}

ctrl + shift + {1-9, 0}
  ${movetoworkspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

super + {right, left, down, up}
  ${movefocus} {r, l, d, u}
  '';
}