{ inputs,
  pkgs,
  ...
}: {
  imports = [inputs.lan-mouse.homeManagerModules.default];

  programs.lan-mouse = {
    enable = true;
    systemd = true;
    package = inputs.lan-mouse.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}