{
  lib,
  pkgs,
  config,
  hostname,
  ...
}: {
  imports = lib.optional (
    builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
  ) (./. + "/hostsettings/${hostname}.nix");

  services.shikane.enable = true;
  systemd.user.services.shikane = {
    Unit = {
      ConditionEnvironment = "WAYLAND_DISPLAY";
      Requires = [config.wayland.systemd.target];
      X-Reload-Triggers = lib.mkIf (config.services.shikane.settings != {}) [
        config.xdg.configFile."shikane/config.toml".source
      ];
    };
    Service = {
      Restart = "always";
      ExecReload = "${lib.getExe' pkgs.shikane "shikanectl"} reload";
    };
  };
}
