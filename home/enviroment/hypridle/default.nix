{ pkgs
, config
, lib
, ... 
}: 
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "${config.home.homeDirectory}/.scripts/screen.sh lock && ${pkgs.hyprlock}/bin/hyprlock";
        unlock_cmd = "${lib.getExe pkgs.killall} -q -s $SIGUSR1 hyprlock && notify-send 'unlock-cmd' && ${config.home.homeDirectory}/.scripts/screen.sh unlock";
        before_sleep_cmd = "notify-send 'zzz'";
        after_sleep_cmd = "notify-send 'awake'";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };
      listener = {
        timeout = 500;
        on-timeout = "notify-send 'You are idle!'";
        on-resume = "notify-send 'Welcome back!'";
      };
    };
  };
}