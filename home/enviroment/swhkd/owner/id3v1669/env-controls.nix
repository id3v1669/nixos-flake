{ config
, envir
, ...
}:
{

  home.file.".config/swhkd/env-controls".text = let 
    killactive = if envir=="Hyprland" then "hyprctl dispatch killactive"
      else "";
    togglesplit = if envir=="Hyprland" then "hyprctl dispatch togglesplit"
      else "echo 'no envir'";
    togglefloating = if envir=="Hyprland" then "hyprctl dispatch togglefloating"
      else "";
    pseudo = if envir=="Hyprland" then "hyprctl dispatch pseudo"
      else "";
    nextworkspace = if envir=="Hyprland" then "hyprctl dispatch workspace e+1"
      else "";
    prevworkspace = if envir=="Hyprland" then "hyprctl dispatch workspace e-1"
      else "";
    movenextworkspace = if envir=="Hyprland" then "hyprctl dispatch movetoworkspace e+1"
      else "";
    moveprevworkspace = if envir=="Hyprland" then "hyprctl dispatch movetoworkspace e-1"
      else "";
    fullscreen = if envir=="Hyprland" then "hyprctl dispatch fullscreen"
      else "";
    nextactivewindow = if envir=="Hyprland" then "hyprctl dispatch cyclenext"
      else "";
    movetoworkspace = if envir=="Hyprland" then "hyprctl dispatch movetoworkspace"
      else "";
    workspace = if envir=="Hyprland" then "hyprctl dispatch workspace"
      else "";
    movefocus = if envir=="Hyprland" then "hyprctl dispatch movefocus "
      else "";
    exit = if envir=="Hyprland" then "hyprctl dispatch exit"
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