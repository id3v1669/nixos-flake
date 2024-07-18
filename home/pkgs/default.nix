{ lib
, pkgs
, hostname
, desk
, ...
}:
{
  imports = [
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./pcs.nix
  ] ++ lib.lists.optionals (desk == "srv") [
    ./srvs.nix
  ] ++ lib.optional (builtins.pathExists ./hosts/${hostname}.nix) (./. + "/hosts/${hostname}.nix");

  home.packages = with pkgs; [
    # web
    curl                          # url cli interactions
    wget                          # url cli interactions
    inetutils                     # ping, telnet, traceroute, etc

    # cli utils
    vim                           # text editor
    btop                          # htop but better
    git                           # git
    gh                            # github auth helper

    # crypt
    openssl                       # cert generation
    age                           # cli encryption
    sops                          # sops for secrets
  ];
}