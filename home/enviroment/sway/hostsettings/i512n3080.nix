{ config
, gpuvar
, ...
}:
{
  wayland.windowManager.sway = {
    config = {
      output = {
        "DP-3" = {
          mode = "3440x1440@144Hz";
          pos = "0 0";
          scale = "1";
        };
        "DP-2" = {
          mode = "1920x1080@100Hz";
          pos = "-1080 0";
          scale = "1";
          transform = "270";
        };
      };
      workspaceOutputAssign = [
        { output = "DP-3"; workspace = "1"; }
        { output = "DP-2"; workspace = "2"; }
        { output = "DP-3"; workspace = "3"; }
        { output = "DP-3"; workspace = "4"; }
        { output = "DP-3"; workspace = "5"; }
        { output = "DP-3"; workspace = "6"; }
        { output = "DP-3"; workspace = "7"; }
        { output = "DP-2"; workspace = "8"; }
        { output = "DP-2"; workspace = "9"; }
        { output = "DP-2"; workspace = "10"; }
      ];
    };
  };
}