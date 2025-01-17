{ inputs
, ...
}:
{
	
  imports = [
    ./scss.nix
    ./yuck.nix
		inputs.eww.homeManagerModules.default
  ];
	programs.eww.enable = true;
}
