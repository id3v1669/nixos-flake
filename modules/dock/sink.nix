{
  pkgs,
  lib,
  ...
}: let
  mkStream = host:
    pkgs.writeShellScript "dock-stream-${host}" ''
      while true; do
        ${pkgs.moonlight-qt}/bin/moonlight quit ${host} 2>/dev/null || true
        ${pkgs.moonlight-qt}/bin/moonlight stream ${host} Desktop \
          --display-mode windowed --resolution 1920x1080 --fps 60 \
          --quit-after
        sleep 3
      done
    '';

  swayDockConfig = pkgs.writeText "sway-dock.conf" ''
    # dock appliance session: no binds, no bars, black background
    output * bg #000000 solid_color
    output eDP-1 position 0 0 mode 1920x1080
    output HDMI-A-1 position 1920 0 mode 1920x1080
    seat * hide_cursor 2000

    # dock2 = laptop panel; dock1 = the external monitor (HDMI-A-1,
    # verified 2026-09-29)
    for_window [title="^dock2"] move window to output eDP-1, fullscreen enable
    for_window [title="^dock1"] move window to output HDMI-A-1, fullscreen enable

    exec ${mkStream "dock1"}
    exec ${mkStream "dock2"}
  '';
in {
  environment.systemPackages = [pkgs.moonlight-qt];

  services.displayManager.sddm.enable = lib.mkForce false;
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.sway}/bin/sway --config ${swayDockConfig}";
      user = "user";
    };
  };
}
