{ allSpecialArgs
, ...
}:
{
  useGlobalPkgs = true;
  useUserPackages = true;
  users.${allSpecialArgs.uservars.name} = import ../home/home.nix;
  extraSpecialArgs = allSpecialArgs;
}