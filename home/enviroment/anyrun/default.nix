{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];
  disabledModules = ["programs/anyrun.nix"];
  programs.anyrun = {
    enable = true;
    package = inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins;
    config = {
      plugins = [
        "${config.programs.anyrun.package}/lib/libapplications.so"
        "${config.programs.anyrun.package}/lib/librink.so"
        "${config.programs.anyrun.package}/lib/libshell.so"
        "${config.programs.anyrun.package}/lib/libstdin.so"
        "${config.programs.anyrun.package}/lib/libsymbols.so"
        "${config.programs.anyrun.package}/lib/libnix_run.so"
      ];

      width.absolute = 500;
      y.fraction = 0.2;
      x.fraction = 0.5;
      hidePluginInfo = true;
      closeOnClick = true;
      maxEntries = 8;
    };

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
          terminal: Some(Terminal(
            command: "wezterm",
            args: "-e {}",
          )),
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ">"
        )
      '';
      "nix_run.ron".text = ''
        Config(
          prefix: ">nr ",
          allow_unfree: true,
          channel: "nixpkgs-unstable",
          max_entries: 3,
        )
      '';
    };
  };
}
