{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.mango.nixosModules.mango
  ];
  programs.mango.enable = true;
  services.displayManager.defaultSession = "mango";
  xdg.portal = {
    extraPortals = [pkgs.xdg-desktop-portal-luminous];
    config.mango = {
      "org.freedesktop.impl.portal.ScreenCast" = lib.mkForce ["luminous"];
      "org.freedesktop.impl.portal.Screenshot" = lib.mkForce ["luminous"];
      "org.freedesktop.impl.portal.RemoteDesktop" = ["luminous"];
    };
  };
}
