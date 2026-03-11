{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "move 69% 6%,    match:class  nm-connection-editor"
      "size 30% 65%,   match:class  nm-connection-editor"
      "move 66.15% 6%, match:class  blueman-manager"
      "size 37% 71.5%, match:class  blueman-manager"
      "move 66.15% 6%, match:class  .blueman-manager-wrapped"
      "size 37% 71.5%, match:class  .blueman-manager-wrapped"
    ];
    source = [
      "${config.home.homeDirectory}/.config/hypr/monitor.conf"
    ];
  };
}
