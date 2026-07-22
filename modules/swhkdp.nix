{
  pkgs,
  envir,
  config,
  brightnesctrl,
  uservars,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.swhkdp.nixosModules.default
  ];
  environment.systemPackages = [
    inputs.swhkdp.packages.${pkgs.stdenv.hostPlatform.system}.swhkdp-macro
  ];
  services.swhkdp = {
    enable = true;
    package = inputs.swhkdp.packages.${pkgs.stdenv.hostPlatform.system}.swhkdp-macro;
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
        then "hyprctl dispatch 'hl.dsp.window.close()'"
        else if envir == "sway"
        then "swaymsg kill"
        else "";
      togglesplit =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.layout(\\\"togglesplit\\\")'"
        else if envir == "sway"
        then "swaymsg layout toggle split"
        else "echo 'no envir'";
      togglefloating =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.float({action = \\\"toggle\\\"})'"
        else if envir == "sway"
        then "swaymsg floating toggle"
        else "";
      pseudo =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.pseudo()'"
        else "";
      nextworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.focus({workspace = \\\"e+1\\\"})'"
        else if envir == "sway"
        then "swaymsg workspace next"
        else "";
      prevworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.focus({workspace = \\\"e-1\\\"})'"
        else if envir == "sway"
        then "swaymsg workspace prev"
        else "";
      movenextworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.move({workspace = \\\"e+1\\\"})'"
        else if envir == "sway"
        then "swaymsg move container to workspace next"
        else "";
      moveprevworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.move({workspace = \\\"e-1\\\"})'"
        else if envir == "sway"
        then "swaymsg move container to workspace prev"
        else "";
      fullscreen =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.fullscreen({mode = \\\"fullscreen\\\", action = \\\"toggle\\\"})'"
        else if envir == "sway"
        then "swaymsg fullscreen toggle"
        else "";
      maximize =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.fullscreen({mode = \\\"maximized\\\", action = \\\"toggle\\\"})'"
        else if envir == "sway"
        then "swaymsg fullscreen toggle"
        else "";
      nextactivewindow =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.cycle_next()'"
        else if envir == "sway"
        then "swaymsg focus next"
        else "";
      movetoworkspace =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.window.move({workspace = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}})'"
        else if envir == "sway"
        then "swaymsg move container to workspace {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}"
        else "";
      workspace =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.focus({workspace = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}})'"
        else if envir == "sway"
        then "swaymsg workspace {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}"
        else "";
      movefocus =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.focus({direction = \\\"{right, left, down, up}\\\"})'"
        else if envir == "sway"
        then "swaymsg focus {right, left, down, up}"
        else "";
      exit =
        if envir == "Hyprland"
        then "hyprctl dispatch 'hl.dsp.exit()'"
        else if envir == "sway"
        then "swaymsg exit"
        else "";
      reload =
        if envir == "Hyprland"
        then "hyprctl reload"
        else if envir == "sway"
        then "swaymsg reload"
        else "";
      lockscreen =
        if envir == "Hyprland"
        then "coldlock"
        else if envir == "sway"
        then "coldlock"
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
        KEY_LEFTCTRL+KEY_LEFTSHIFT+<KEY_1-KEY_9,KEY_0> "${movetoworkspace}"
        KEY_LEFTMETA+KEY_R anyrun
        KEY_LEFTMETA+KEY_TAB "${nextactivewindow}"
        KEY_LEFTMETA+KEY_G "${maximize}"
        KEY_LEFTMETA+KEY_J "${togglefloating}"
        KEY_LEFTMETA+KEY_M "${exit}"
        KEY_LEFTMETA+KEY_P "${pseudo}"
        KEY_LEFTMETA+KEY_S "${togglesplit}"
        KEY_LEFTMETA+<KEY_1-KEY_9,KEY_0> "${workspace}"
        KEY_LEFTMETA+<KEY_RIGHT,KEY_LEFT,KEY_DOWN,KEY_UP> "${movefocus}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_3 "wayshot -g --no-freeze - | satty -f -"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_4 "wayshot -g --no-freeze --file-name-format 'shot-%Y-%m-%d_%H:%M:%S' $HOME/Pictures/Screenshots/"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_5 "wayshot -g --no-freeze --clipboard"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_B firefox
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_C "cliphist list | anyrun --show-results-immediately true | cliphist decode | wl-copy"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_F nautilus
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Z "killall -SIGUSR1 gpu-screen-recorder && sleep 0.5 && notify-send -t 3500 -u low -- 'GPU Screen Recorder' 'Replay saved'"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_G "${fullscreen}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_K kitty
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_L "${lockscreen}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_N "swaync-client -t"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_P "hyprpicker -a"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Q "${killactive}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_R iwwc-launcher
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_SLASH "${reload}"
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_T wezterm
        KEY_LEFTMETA+KEY_LEFTSHIFT+KEY_Y "iwwc reload"
        KEY_RIGHTCTRL+KEY_2 "@enter secondary"
        KEY_RIGHTCTRL+KEY_D @macro simple {
          KEY_ENTER click
          move x=5 y=0 duration=1000
          BTN_LEFT down
          repeat 30 {
            move x=0 y=400 duration=600 type="constant" path="arc" direction="cw"
            move x=0 y=-400 duration=600 type="constant" path="arc" direction="cw"
          }
          BTN_LEFT up
        }
        KEY_RIGHTCTRL+KEY_E @macro simple {
          KEY_ENTER click
          move x=5 y=0 duration=1000
          BTN_LEFT down
          repeat 300 {
            move x=0 y=400 duration=600 type="constant" path="arc" direction="cw"
            move x=0 y=-400 duration=600 type="constant" path="arc" direction="cw"
          }
          BTN_LEFT up
        }
        KEY_RIGHTCTRL+KEY_O @macro simple {
          KEY_ENTER click
          move x=5 y=0 duration=1000
          repeat 5 {
            move x=0 y=400 duration=1500 type="constant" path="arc" direction="cw"
            move x=0 y=-400 duration=1500 type="constant" path="arc" direction="cw"
          }
          BTN_LEFT click
        }
      }
      secondary {
        KEY_RIGHTCTRL+KEY_1 "@enter master"
        KEY_LEFTMETA+KEY_R "notify-send --icon=spotify 'GameMode started'"
      }
      general {
        oneoff #false
        swallow #false
      }

    '';
  };
}
