{ pkgs
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

    # cli utils
    vim                           # text editor
    btop                          # htop but better
    neofetch                      # linux core))
    git                           # git
    gh                            # github auth helper

    # crypt
    age                           # cli encryption
    sops                          # sops for secrets
  ];
}