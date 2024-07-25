{ lib
, desk
, ...
}:
{
  imports = [
    ./fish
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./alacritty
    ./vscode
    ./firefox
    ./other
    ./discord
    ./telegram
    ./kitty
    ./btop
    ./joplin
    ./obs
    ./fastfetch
    ./rider
    ./swappy
    ./chromium
  ];
}
