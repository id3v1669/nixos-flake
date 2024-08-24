{ lib
, config
, pkgs
, inputs
, ...
}:
let
    inherit (import ./../../../lib/h2rgba.nix { inherit lib; }) hexToRgba;
in
{

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
          terminal: Some("foot"),
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ">"
        )
      '';
    };

    extraCss = ''
* {
  all: unset;
  font-family: "0xProto";
  font-size: 15px;
}

box#main {
  background: ${hexToRgba "${config.colorScheme.palette.base00}" "0.6"};
  border-radius: 20px;
  padding: 10px 8px;
  color: #${config.colorScheme.palette.base07};
}

#entry {
  background: ${hexToRgba "${config.colorScheme.palette.base01}" "0.8"};
  border: 2px solid #${config.colorScheme.palette.base0F};
  border-radius: 16px;
  padding: 10px;
}

#entry selection {
  background: ${hexToRgba "${config.colorScheme.palette.base02}" "0.8"};
}

list#main{
  padding: 10px 0px;
}

list#main > row {
  margin: 5px 0px;
}

#match.activatable {
  background: ${hexToRgba "${config.colorScheme.palette.base02}" "0.8"};
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
  background: ${hexToRgba "${config.colorScheme.palette.base01}" "0.8"};
  color: #${config.colorScheme.palette.base0F};
}
    '';
  };
}
