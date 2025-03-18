{config, ...}: {
  xdg.desktopEntries = {
    rider8 = {
      name = "rider8";
      genericName = "dotnet8 IDE";
      exec = "nix-shell ${config.home.homeDirectory}/.scripts/dotnet8.nix --run rider";
      terminal = false;
      categories = ["Development" "IDE"];
    };
  };
}
