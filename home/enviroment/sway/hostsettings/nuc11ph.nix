{ config
, gpuvar
, ...
}:
{
  # wayland.windowManager.sway = {
  #   config = let 
  #     main = if gpuvar.port == "tbqhd" then "DP-3" else if gpuvar.port == "tbfhd" then "DP-3" else if gpuvar.port == "hdmiqhd" then "HDMI-A-1" else "";
  #     secondary = if gpuvar.port == "tbqhd" then "DP-4" else if gpuvar.port == "tbfhd" then "DP-4" else if gpuvar.port == "hdmiqhd" then "DP-5" else "";
  #   in{
  #     output = {
  #       "${main}" = {
  #         mode = if gpuvar.port == "tbqhd" || gpuvar.port == "hdmiqhd" then "3440x1440@100Hz" else if gpuvar.port == "tbfhd" then "2560x1080@120Hz" else "";
  #         pos = "0 0";
  #         scale = "1";
  #       };
  #       "${secondary}" = {
  #         mode = "1920x1080@100Hz";
  #         pos = if gpuvar.port == "tbqhd" || gpuvar.port == "hdmiqhd" then "3440 0" else if gpuvar.port == "tbfhd" then "2560 0" else "";
  #         scale = "1";
  #       };
  #     };
  #     workspaceOutputAssign = [
  #       { output = "${main}"; workspace = "1"; }
  #       { output = "${main}"; workspace = "2"; }
  #       { output = "${main}"; workspace = "3"; }
  #       { output = "${main}"; workspace = "4"; }
  #       { output = "${main}"; workspace = "5"; }
  #       { output = "${main}"; workspace = "6"; }
  #       { output = "${main}"; workspace = "7"; }
  #       { output = "${secondary}"; workspace = "8"; }
  #       { output = "${secondary}"; workspace = "9"; }
  #       { output = "${secondary}"; workspace = "10"; }
  #     ];
  #   };
  # };
}