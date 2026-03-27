{
  pkgs,
  envir,
  config,
  brightnesctrl,
  uservars,
  lib,
  inputs,
  ...
}: let
  fhtipc = "${lib.getExe' pkgs.fht-compositor "fht-compositor"} ipc action";
in {
  imports = [
    inputs.swhkdp.nixosModules.default
  ];
  environment.systemPackages = [
    inputs.swhkdp.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  services.swhkdp = {
    enable = true;
    username = uservars.name;
    ignore = [
      "Sony Interactive Entertainment DualSense Wireless Controller"
      "Sony Interactive Entertainment DualSense Wireless Controller Motion Sensors"
      "Sony Interactive Entertainment DualSense Wireless Controller Touchpad"
      "Apple Inc. Magic Trackpad"
    ];
    settings = let
      killactive =
        if envir == "Hyprland"
        then "hyprctl dispatch killactive"
        else if envir == "fht-compositor"
        then "${fhtipc} close-window"
        else "";
      togglesplit =
        if envir == "Hyprland"
        then "hyprctl dispatch layoutmsg togglesplit"
        else "echo 'no envir'";
      togglefloating =
        if envir == "Hyprland"
        then "hyprctl dispatch togglefloating"
        else if envir == "fht-compositor"
        then "${fhtipc} float-window"
        else "";
      pseudo =
        if envir == "Hyprland"
        then "hyprctl dispatch pseudo"
        else "";
      nextworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch workspace e+1"
        else if envir == "fht-compositor"
        then "${fhtipc} focus-next-workspace"
        else "";
      prevworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch workspace e-1"
        else if envir == "fht-compositor"
        then "${fhtipc} focus-previous-workspace"
        else "";
      movenextworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch movetoworkspace e+1"
        else "";
      moveprevworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch movetoworkspace e-1"
        else "";
      fullscreen =
        if envir == "Hyprland"
        then "hyprctl dispatch fullscreen 0"
        else if envir == "fht-compositor"
        then "${fhtipc} fullscreen-window"
        else "";
      maximize =
        if envir == "Hyprland"
        then "hyprctl dispatch fullscreen 1"
        else if envir == "fht-compositor"
        then "${fhtipc} maximize-window"
        else "";
      nextactivewindow =
        if envir == "Hyprland"
        then "hyprctl dispatch cyclenext"
        else if envir == "fht-compositor"
        then "${fhtipc} focus-next-window"
        else "";
      movetoworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch movetoworkspace"
        else if envir == "fht-compositor"
        then "${fhtipc} send-window-to-workspace"
        else "";
      workspace =
        if envir == "Hyprland"
        then "hyprctl dispatch workspace"
        else if envir == "fht-compositor"
        then "${fhtipc} focus-workspace"
        else "";
      movefocus =
        if envir == "Hyprland"
        then "hyprctl dispatch movefocus "
        else "";
      exit =
        if envir == "Hyprland"
        then "hyprctl dispatch exit"
        else if envir == "fht-compositor"
        then "${fhtipc} quit"
        else "";
      reload =
        if envir == "Hyprland"
        then "hyprctl reload"
        else if envir == "fht-compositor"
        then "${fhtipc} reload-config"
        else "";
      lockscreen =
        if envir == "Hyprland"
        then "hyprlock"
        else "";
    in ''
      master {
        KEY_BRIGHTNESSDOWN "light -U 5"
        KEY_BRIGHTNESSUP "light -A 5"
        KEY_MUTE "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        KEY_MICMUTE "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        KEY_VOLUMEDOWN "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        KEY_VOLUMEUP "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        KEY_NEXTSONG "playerctl next"
        KEY_PREVIOUSSONG "playerctl previous"
        KEY_PLAYPAUSE "playerctl play-pause"
        BTN_SIDE KEY_LEFTMETA //reassign side button to left meta
        KEY_LEFTCTRL+KEY_LEFT "${prevworkspace}"
        KEY_LEFTCTRL+KEY_RIGHT "${nextworkspace}"
        KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_LEFT "${moveprevworkspace}"
        KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_RIGHT "${movenextworkspace}"
        KEY_LEFTCTRL+KEY_LEFTSHIFT+<KEY_1-KEY_9,KEY_0> "${movetoworkspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}"
        KEY_LEFTMETA+KEY_R anyrun
        KEY_LEFTMETA+KEY_TAB "${nextactivewindow}"
        KEY_LEFTMETA+KEY_G "${maximize}"
        KEY_LEFTMETA+KEY_J "${togglefloating}"
        KEY_LEFTMETA+KEY_M "${exit}"
        KEY_LEFTMETA+KEY_P "${pseudo}"
        KEY_LEFTMETA+KEY_S "${togglesplit}"
        KEY_LEFTMETA+<KEY_1-KEY_9,KEY_0> "${workspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}"
        KEY_LEFTMETA+<KEY_RIGHT,KEY_LEFT,KEY_DOWN,KEY_UP> "${movefocus} {r,l,d,u}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_3 "wayshot -g --no-freeze - | swappy -f -"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_4 "wayshot -g --no-freeze --file-name-format 'shot-%Y-%m-%d_%H:%M:%S' $HOME/Pictures/Screenshots/"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_5 "wayshot -g --no-freeze --clipboard"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_B firefox
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_C "cliphist list | anyrun --show-results-immediately true | cliphist decode | wl-copy"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_E eww-move
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_F nautilus
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_G "${fullscreen}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_K kitty
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_L hyprlock
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_N "swaync-client -t"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_P "hyprpicker -a"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Q ${killactive}
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_R eww-launcher
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_SLASH ${reload}
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_T wezterm
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Y "eww reload"
        KEY_RIGHTMETA+KEY_2 "@enter secondary"
      }
      secondary {
        KEY_RIGHTMETA+KEY_1 "@enter master"
        KEY_LEFTMETA+KEY_R "notify-send --icon=spotify 'GameMode started'"
      }
      general {
        oneoff #false
        swallow #false
      }

    '';
  };
}
