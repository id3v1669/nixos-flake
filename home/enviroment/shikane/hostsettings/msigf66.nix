{lib, ...}: let
  mkOutput = alias: o:
    (builtins.removeAttrs o ["exec"])
    // {
      enable = o.enable or true;
      exec = ["shikane-alias ${lib.escapeShellArg alias}"] ++ (o.exec or []);
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
        mode = "3440x1440@99.98Hz";
        position = "0,0";
      };
      laptop = {
        search = ["n=eDP-1"];
        mode = "1920x1080@144.15Hz";
        position = "3440,0";
        scale = 1.0;
      };
    };

    work_hdmi = {
      main = {
        search = ["s=LALMQS096920"];
        mode = "1920x1080@74.91Hz";
        position = "0,0";
        scale = 1.0;
      };
      laptop = {
        search = ["n=eDP-1"];
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
        search = ["n=eDP-1"];
        mode = "1920x1080@144.15Hz";
        position = "-1920,320";
        scale = 1.0;
      };
    };

    laptop_only = {
      laptop = {
        search = ["n=eDP-1"];
        mode = "1920x1080@144.15Hz";
        position = "0,0";
        scale = 1.0;
      };
    };
  };
in {
  services.shikane.settings.profile = lib.mapAttrsToList mkProfile profiles;
}
