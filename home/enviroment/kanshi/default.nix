
 {lib,hostname,...}:{
  imports = lib.optional (
    builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
  ) (./. + "/hostsettings/${hostname}.nix");
  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
  };
  }