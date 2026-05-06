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
      ./vscode
      ./firefox
      ./other
      ./discord
      ./telegram
      ./kitty
      ./joplin
      ./obs
      ./swappy
      ./chromium
      ./spicetify
      ./wezterm
      ./mangohud
    ]
    ++ lib.lists.optionals (desk == "desktop") [
    ];
}
