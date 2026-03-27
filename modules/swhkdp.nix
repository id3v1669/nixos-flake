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
  #fhtipc = "${lib.getExe' pkgs.fht-compositor "fht-compositor"} ipc action";
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
    settings = ''
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
  KEY_LEFTCTRL+KEY_LEFT "hyprctl dispatch workspace e-1"
  KEY_LEFTCTRL+KEY_RIGHT "hyprctl dispatch workspace e+1"
  KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_LEFT "hyprctl dispatch movetoworkspace e-1"
  KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_RIGHT "hyprctl dispatch movetoworkspace e+1"
  KEY_LEFTCTRL+KEY_LEFTSHIFT+<KEY_1-KEY_9,KEY_0> "hyprctl dispatch movetoworkspace {1,2,3,4,5,6,7,8,9,10}"
  KEY_LEFTMETA+KEY_R anyrun
  KEY_LEFTMETA+KEY_TAB "hyprctl dispatch cyclenext"
  KEY_LEFTMETA+KEY_G "hyprctl dispatch fullscreen 1"
  KEY_LEFTMETA+KEY_J "hyprctl dispatch togglefloating"
  KEY_LEFTMETA+KEY_M "hyprctl dispatch exit"
  KEY_LEFTMETA+KEY_P "hyprctl dispatch pseudo"
  KEY_LEFTMETA+KEY_S "hyprctl dispatch layoutmsg togglesplit"
  KEY_LEFTMETA+<KEY_1-KEY_9,KEY_0> "hyprctl dispatch workspace {1,2,3,4,5,6,7,8,9,10}"
  KEY_LEFTMETA+<KEY_RIGHT,KEY_LEFT,KEY_DOWN,KEY_UP> "hyprctl dispatch movefocus  {r,l,d,u}"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_3 "wayshot -g - | swappy -f -"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_4 "wayshot -g --file-name-format 'shot-%Y-%m-%d_%H:%M:%S' $HOME/Pictures/Screenshots/"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_5 "wayshot -g --clipboard"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_B firefox
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_C "cliphist list | anyrun --show-results-immediately true | cliphist decode | wl-copy"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_E eww-move
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_F nautilus
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_G "hyprctl dispatch fullscreen 0"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_K kitty
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_L hyprlock
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_N "swaync-client -t"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_P "hyprpicker -a"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Q "hyprctl dispatch killactive"
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_R eww-launcher
  KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_SLASH "hyprctl reload"
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
    # settings = let
    #   killactive =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch killactive"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} close-window"
    #     else "";
    #   togglesplit =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch layoutmsg togglesplit"
    #     else "echo 'no envir'";
    #   togglefloating =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch togglefloating"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} float-window"
    #     else "";
    #   pseudo =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch pseudo"
    #     else "";
    #   nextworkspace =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch workspace e+1"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} focus-next-workspace"
    #     else "";
    #   prevworkspace =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch workspace e-1"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} focus-previous-workspace"
    #     else "";
    #   movenextworkspace =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch movetoworkspace e+1"
    #     else "";
    #   moveprevworkspace =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch movetoworkspace e-1"
    #     else "";
    #   fullscreen =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch fullscreen 0"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} fullscreen-window"
    #     else "";
    #   maximize =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch fullscreen 1"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} maximize-window"
    #     else "";
    #   nextactivewindow =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch cyclenext"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} focus-next-window"
    #     else "";
    #   movetoworkspace =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch movetoworkspace"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} send-window-to-workspace"
    #     else "";
    #   workspace =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch workspace"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} focus-workspace"
    #     else "";
    #   movefocus =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch movefocus "
    #     else "";
    #   exit =
    #     if envir == "Hyprland"
    #     then "hyprctl dispatch exit"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} quit"
    #     else "";
    #   reload =
    #     if envir == "Hyprland"
    #     then "hyprctl reload"
    #     else if envir == "fht-compositor"
    #     then "${fhtipc} reload-config"
    #     else "";
    #   lockscreen =
    #     if envir == "Hyprland"
    #     then "hyprlock"
    #     else "";
    # in {
    #   modes = {
    #     normal = {
    #       swallow = false;
    #       oneoff = false;
    #       hotkeys = {
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Q".action = killactive;
    #         "KEY_LEFTMETA+KEY_S".action = togglesplit;
    #         "KEY_LEFTMETA+KEY_J".action = togglefloating;
    #         "KEY_LEFTMETA+KEY_G".action = maximize;
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_G".action = fullscreen;
    #         "KEY_LEFTMETA+KEY_P".action = pseudo;
    #         "KEY_LEFTMETA+KEY_M".action = exit;
    #         "KEY_LEFTMETA+KEY_TAB".action = nextactivewindow;
    #         "KEY_LEFTCTRL+KEY_RIGHT".action = nextworkspace;
    #         "KEY_LEFTCTRL+KEY_LEFT".action = prevworkspace;
    #         "KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_LEFT".action = moveprevworkspace;
    #         "KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_RIGHT".action = movenextworkspace;
    #         "KEY_LEFTMETA+{KEY_1-KEY_9, KEY_0}".action = "${workspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}";
    #         "KEY_LEFTCTRL+KEY_LEFTSHIFT+{KEY_1-KEY_9, KEY_0}".action = "${movetoworkspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}";
    #         "KEY_LEFTMETA+{KEY_RIGHT, KEY_LEFT, KEY_DOWN, KEY_UP}".action = "${movefocus} {r, l, d, u}";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_T".action = "wezterm";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_K".action = "kitty";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_B".action = "firefox";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_F".action = "cosmic-files";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_P".action = "hyprpicker -a";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_E".action = "eww-move";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_N".action = "swaync-client -t";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Z".action = "${lib.getExe pkgs.killall} -SIGUSR1 gpu-screen-recorder && sleep 0.5 && notify-send -t 3500 -u low -- 'GPU Screen Recorder' 'Replay saved'";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_R".action = "eww-launcher";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Y".action = "eww reload";
    #         "KEY_LEFTMETA+KEY_R".action = "anyrun";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_C".action = "cliphist list | anyrun --show-results-immediately true | cliphist decode | wl-copy";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_L".action = lockscreen;
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_SLASH".action = reload;
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_3".action = "wayshot -g - | swappy -f -";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_4".action = "wayshot -g --file-name-format 'shot-%Y-%m-%d_%H:%M:%S' $HOME/Pictures/Screenshots/";
    #         "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_5".action = "wayshot -g --clipboard";
    #         "KEY_BRIGHTNESSDOWN" = {
    #           action_type = "singlecommand";
    #           action = "${brightnesctrl.down}";
    #         };
    #         "KEY_BRIGHTNESSUP" = {
    #           action_type = "singlecommand";
    #           action = "${brightnesctrl.up}";
    #         };
    #         "KEY_PLAYPAUSE" = {
    #           action_type = "singlecommand";
    #           action = "playerctl play-pause";
    #         };
    #         "KEY_PREVIOUSSONG" = {
    #           action_type = "singlecommand";
    #           action = "playerctl previous";
    #         };
    #         "KEY_NEXTSONG" = {
    #           action_type = "singlecommand";
    #           action = "playerctl next";
    #         };
    #         "KEY_VOLUMEDOWN" = {
    #           action_type = "singlecommand";
    #           action = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    #         };
    #         "KEY_VOLUMEUP" = {
    #           action_type = "singlecommand";
    #           action = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
    #         };
    #         "KEY_MUTE" = {
    #           action_type = "singlecommand";
    #           action = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    #         };
    #         "KEY_MICMUTE" = {
    #           action_type = "singlecommand";
    #           action = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    #         };
    #       };
    #     };
    #   };
    #   remaps = {
    #     "BTN_SIDE" = "KEY_LEFTMETA";
    #   };
    # };
  };
}
