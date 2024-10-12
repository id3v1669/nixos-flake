{ lib
, desk
, ...
}:
{
  imports = [
    ./fish
    ./btop
  ] ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
    ./alacritty
    ./vscode
    ./firefox
    ./other
    ./discord
    ./telegram
    ./kitty
    ./joplin
    ./obs
    ./fastfetch
    ./rider
    ./swappy
    ./chromium
    ./spicetify
  ];
}
