{ config, lib, pkgs, modulesPath, uservars, system, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}