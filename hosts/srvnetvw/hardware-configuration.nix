{ lib
, pkgs
, modulesPath
, system
, ...
}:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}