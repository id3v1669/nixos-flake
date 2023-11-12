{ config, lib, pkgs, modulesPath, uservars, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  
  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}