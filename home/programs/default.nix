{
  lib,
  desk,
  ...
}: {
  imports =
    [
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
    ]
    ++ lib.lists.optionals (desk == "desktop") [
      ./mangohud
    ];
}
