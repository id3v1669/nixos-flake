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
      inputs.sops-nix.homeManagerModules.sops
    ];
    palette = "${allSpecialArgs.colorsvar}";
  };
  extraSpecialArgs = allSpecialArgs;
}
