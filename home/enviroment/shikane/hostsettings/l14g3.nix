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
    home_triple = {
      main = {
        search = ["n=HDMI-A-1"];
        mode = "3440x1440@99.98Hz";
        position = "0,0";
      };
      side = {
        search = ["n=DP-2"];
        mode = "1920x1080@100Hz";
        position = "3440,-320";
        transform = "90";
        scale = 1.0;
      };
      laptop = {
        search = ["n=eDP-1"];
        mode = "1920x1080@60Hz";
        position = "-1920,0";
        scale = 1.0;
      };
    };

    work_hdmi = {
      main = {
        search = ["n=HDMI-A-1"];
        mode = "1920x1080";
        position = "0,0";
        scale = 1.0;
      };
      laptop = {
        search = ["n=eDP-1"];
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
        position = "-1920,320";
        scale = 1.0;
      };
    };

    laptop_only = {
      laptop = {
        search = ["n=eDP-1"];
        position = "0,0";
        scale = 1.0;
      };
    };
  };
in {
  services.shikane.settings.profile = lib.mapAttrsToList mkProfile profiles;
}
