{
  lib,
  desk,
  ...
}: {
  imports =
    lib.lists.optionals (desk == "desktop" || desk == "laptop") [
      ./pcs.nix
    ]
    ++ lib.lists.optionals (desk == "server") [
      ./srvs.nix
    ];
}
