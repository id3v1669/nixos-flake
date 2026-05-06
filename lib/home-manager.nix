{
  inputs,
  allSpecialArgs,
  ...
}: {
  useGlobalPkgs = true;
  useUserPackages = true;
  users.${allSpecialArgs.uservars.name} = {
    imports = [
      ../home/home.nix
      inputs.base16x2.homeManagerModules.default
    ];
    palette = "${allSpecialArgs.colorsvar}";
  };
  extraSpecialArgs = allSpecialArgs;
}
