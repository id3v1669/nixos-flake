{
  lib,
  desk,
  ...
}: {
  imports =
    [
      ./fish
      ./btop
      ./fastfetch
    ]
    ++ lib.lists.optionals (desk == "desktop" || desk == "laptop") [
      ./alacritty
      ./vscode
      ./floorp
      ./other
      ./discord
      ./telegram
      ./kitty
      ./joplin
      ./obs
      ./rider
      ./swappy
      ./chromium
      ./spicetify
      ./steam
    ]
    ++ lib.lists.optionals (desk == "desktop") [
      ./mangohud
    ];
}
