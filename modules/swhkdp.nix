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
  hyprctl = "${lib.getExe' pkgs.hyprland "hyprctl"}";
  playerctl = "${lib.getExe' pkgs.playerctl "playerctl"}";
in {
  environment.systemPackages = [
    inputs.swhkdp.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  services.swhkdp = {
    enable = true;
    settings = let
      killactive =
        if envir == "Hyprland"
        then "${hyprctl} dispatch killactive"
        else "";
      togglesplit =
        if envir == "Hyprland"
        then "${hyprctl} dispatch togglesplit"
        else "echo 'no envir'";
      togglefloating =
        if envir == "Hyprland"
        then "${hyprctl} dispatch togglefloating"
        else "";
      pseudo =
        if envir == "Hyprland"
        then "${hyprctl} dispatch pseudo"
        else "";
      nextworkspace =
        if envir == "Hyprland"
        then "${hyprctl} dispatch workspace e+1"
        else "";
      prevworkspace =
        if envir == "Hyprland"
        then "${hyprctl} dispatch workspace e-1"
        else "";
      movenextworkspace =
        if envir == "Hyprland"
        then "${hyprctl} dispatch movetoworkspace e+1"
        else "";
      moveprevworkspace =
        if envir == "Hyprland"
        then "${hyprctl} dispatch movetoworkspace e-1"
        else "";
      fullscreen =
        if envir == "Hyprland"
        then "${hyprctl} dispatch fullscreen 0"
        else "";
      maximize =
        if envir == "Hyprland"
        then "${hyprctl} dispatch fullscreen 1"
        else "";
      nextactivewindow =
        if envir == "Hyprland"
        then "${hyprctl} dispatch cyclenext"
        else "";
      movetoworkspace =
        if envir == "Hyprland"
        then "${hyprctl} dispatch movetoworkspace"
        else "";
      workspace =
        if envir == "Hyprland"
        then "${hyprctl} dispatch workspace"
        else "";
      movefocus =
        if envir == "Hyprland"
        then "${hyprctl} dispatch movefocus "
        else "";
      exit =
        if envir == "Hyprland"
        then "${hyprctl} dispatch exit"
        else "";
      reload =
        if envir == "Hyprland"
        then "${hyprctl} reload"
        else "";
      lockscreen =
        if envir == "Hyprland"
        then "hyprlock"
        else "";
    in {
      modes = {
        normal = {
          swallow = false;
          oneoff = false;
          hotkeys = {
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Q".action = killactive;
            "KEY_LEFTMETA+KEY_S".action = togglesplit;
            "KEY_LEFTMETA+KEY_J".action = togglefloating;
            "KEY_LEFTMETA+KEY_G".action = maximize;
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_G".action = fullscreen;
            "KEY_LEFTMETA+KEY_P".action = pseudo;
            "KEY_LEFTMETA+KEY_M".action = exit;
            "KEY_LEFTMETA+KEY_TAB".action = nextactivewindow;
            "KEY_LEFTCTRL+KEY_RIGHT".action = nextworkspace;
            "KEY_LEFTCTRL+KEY_LEFT".action = prevworkspace;
            "KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_LEFT".action = moveprevworkspace;
            "KEY_LEFTCTRL+KEY_LEFTSHIFT+KEY_RIGHT".action = movenextworkspace;
            "KEY_LEFTMETA+{KEY_1-KEY_9, KEY_0}".action = "${workspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}";
            "KEY_LEFTCTRL+KEY_LEFTSHIFT+{KEY_1-KEY_9, KEY_0}".action = "${movetoworkspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}";
            "KEY_LEFTMETA+{KEY_RIGHT, KEY_LEFT, KEY_DOWN, KEY_UP}".action = "${movefocus} {r, l, d, u}";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_T".action = "alacritty";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_K".action = "kitty";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_B".action = "floorp";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_F".action = "nautilus";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_P".action = "hyprpicker -a";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_E".action = "eww-move";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_N".action = "swaync-client -t";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Z".action = "${lib.getExe pkgs.killall} -SIGUSR1 gpu-screen-recorder && sleep 0.5 && notify-send -t 3500 -u low -- 'GPU Screen Recorder' 'Replay saved'";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_R".action = "eww-launcher";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Y".action = "eww reload";
            "KEY_LEFTMETA+KEY_R".action = "anyrun";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_C".action = "cliphist list | anyrun --show-results-immediately true | cliphist decode | wl-copy";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_L".action = lockscreen;
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_SLASH".action = reload;
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_3".action = "wayshot -s \"$(slurp)\" --stdout | swappy -f -";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_4".action = "wayshot -s \"$(slurp)\" -f $HOME/Pictures/Screenshots/shot_$(date '+%Y-%m-%d_%H:%M:%S').png";
            "KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_5".action = "wayshot -s \"$(slurp)\" --stdout | wl-copy";
            "KEY_BRIGHTNESSDOWN" = {
              action_type = "singlecommand";
              action = "${brightnesctrl.down}";
            };
            "KEY_BRIGHTNESSUP" = {
              action_type = "singlecommand";
              action = "${brightnesctrl.up}";
            };
            #------
            # special for macbook, other devices don't have software-controled backlight, so keep it global for now(no harm)
            "KEY_KBDILLUMDOWN" = {
              action_type = "singlecommand";
              action = "light -s sysfs/leds/spi::kbd_backlight -U 10";
            };
            "KEY_KBDILLUMUP" = {
              action_type = "singlecommand";
              action = "light -s sysfs/leds/spi::kbd_backlight -A 10";
            };
            #------
            "KEY_PLAYPAUSE" = {
              action_type = "singlecommand";
              action = "${playerctl} play-pause";
            };
            "KEY_PREVIOUSSONG" = {
              action_type = "singlecommand";
              action = "${playerctl} previous";
            };
            "KEY_NEXTSONG" = {
              action_type = "singlecommand";
              action = "${playerctl} next";
            };
            "KEY_VOLUMEDOWN" = {
              action_type = "singlecommand";
              action = "pamixer -d 5";
            };
            "KEY_VOLUMEUP" = {
              action_type = "singlecommand";
              action = "pamixer -i 5";
            };
            "KEY_MUTE" = {
              action_type = "singlecommand";
              action = "pamixer -t";
            };
            "KEY_MICMUTE" = {
              action_type = "singlecommand";
              action = "pamixer --default-source -t";
            };
          };
        };
      };
      remaps = {
        "BTN_SIDE" = "KEY_LEFTMETA";
      };
    };
  };
}
