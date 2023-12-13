{ config
, ...
}:
{
  wayland.windowManager.sway.config = {
    output = {
      "eDP-1" = {
        mode = "1920x1080@60Hz";
        pos = "0 0";
        scale = "1";
      };
    };
  };
}