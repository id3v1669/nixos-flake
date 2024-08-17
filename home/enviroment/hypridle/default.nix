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
      };
    };
  };
}