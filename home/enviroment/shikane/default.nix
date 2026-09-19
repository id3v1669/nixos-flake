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
    home_double = {
      main = {
        search = ["m=U34G2G4R3"];
        mode = "3440x1440@99.982Hz";
        position = "0,0";
      };
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.149Hz";
        position = "3440,0";
        scale = 1.0;
      };
    };

    work_hdmi1 = {
      main = {
        search = ["s=LALMQS096920"];
        mode = "1920x1080@74.91Hz";
        position = "0,0";
        scale = 1.0;
      };
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.15Hz";
        position = "0,1080";
        scale = 1.0;
      };
    };

    work_hdmi2 = {
      main = {
        search = ["s=62H0D23"];
        mode = "1920x1080@60.00Hz";
        position = "0,0";
        scale = 1.0;
      };
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.15Hz";
        position = "0,1080";
        scale = 1.0;
      };
    };
    work_hdmi3 = {
      main = {
        search = ["s=UHB1843022743"];
        mode = "1920x1080@60.00Hz";
        position = "0,0";
        scale = 1.0;
      };
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.15Hz";
        position = "0,1080";
        scale = 1.0;
      };
    };

    work_dvi = {
      main = {
        search = ["n=DVI-I-1"];
        mode = "2560x1440";
        position = "0,0";
        scale = 1.0;
      };
      laptop = {
        search = ["m=0xAF90"];
        mode = "1920x1080@144.15Hz";
        position = "-1920,320";
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

    zgamemode = {
      main = {
        search = ["m=U34G2G4R3"];
        mode = "2560x1080@120.00Hz";
        position = "0,0";
      };
      laptop = {
        search = ["m=0xAF90"];
        enable = false;
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
