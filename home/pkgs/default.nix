{ lib
, pkgs
, hostname
, desk
, ...
}:
{
  imports = [
    ./hosts/${hostname}.nix
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./pcs.nix
  ] ++ lib.lists.optionals (desk == "srv") [
    ./srvs.nix
  ];
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