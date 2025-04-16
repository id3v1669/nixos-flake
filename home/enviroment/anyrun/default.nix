{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];
  disabledModules = [ "programs/anyrun.nix" ];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        stdin
        symbols
      ];

      width.fraction = 0.25;
      y.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
      maxEntries = 8;
    };

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
          terminal: Some("alacritty"),
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ">"
        )
      '';
    };

    extraCss = with config.palette; ''
      * {
        all: unset;
        font-family: "0xProto";
        font-size: 15px;
      }

      box#main {
        background: ${base06.rgba "0.6"};
        border-radius: 20px;
        padding: 10px 8px;
        color: ${base01.hexT};
      }

      #entry {
        background: ${base04.rgba "0.8"};
        border: 2px solid ${base0B.hexT};
        border-radius: 16px;
        padding: 10px;
      }

      #entry selection {
        background: ${base05.rgba "0.8"};
      }

      list#main{
        padding: 10px 0px;
      }

      list#main > row {
        margin: 5px 0px;
      }

      #match.activatable {
        background: ${base05.rgba "0.8"};
        padding: 6px 3px;
      }

      #match.activatable:first-child {
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        margin: 10px 0px 0px 0px;
      }

      #match.activatable:last-child {
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
      }

      #match:selected, #match:hover {
        background: ${base04.rgba "0.8"};
        color: ${base0B.hexT};
      }
    '';
  };
}
