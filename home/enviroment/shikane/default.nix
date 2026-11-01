{
  lib,
  pkgs,
  config,
  ...
}: let
  mkOutput = alias: o: let
    enabled = o.enable or true;
  in
    (builtins.removeAttrs o ["exec"])
    // {
      enable = enabled;
      exec =
        (lib.optional enabled "shikane-alias ${lib.escapeShellArg alias}")
        ++ (o.exec or []);
    };

  mkProfile = pname: outputs: {
    name = pname;
    exec = ["shikane-alias --profile ${lib.escapeShellArg pname}"];
    output = lib.mapAttrsToList mkOutput outputs;
  };

  profiles = {
    home_hdmi = {
      main = {
        search = ["m=SAMSUNG" "s=0x01000E00" "v=Samsung Electric Company"];
        mode = "3840x2160@60.00Hz";
        position = "1920,0";
        scale = 1.5;
      };
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.15Hz";
        position = "0,0";
        scale = 1.0;
      };
    };

    laptop_only = {
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.15Hz";
        position = "0,0";
        scale = 1.0;
      };
    };
  };
in {
  services.shikane = {
    enable = true;
    settings.profile = lib.mapAttrsToList mkProfile profiles;
  };

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
