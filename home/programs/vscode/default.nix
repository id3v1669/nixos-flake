{ config, lib, pkgs, ... }: { 
  nixpkgs.config.vscode.commandLineArgs = "--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland";
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
    };
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      mads-hartmann.bash-ide-vscode
      jnoortheen.nix-ide
      skyapps.fish-vscode
      ms-dotnettools.csharp
      ms-python.python
    ];
  };
  #home.file.".config/code-flags.conf".text = ''
  #--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland
  #'';
}
