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
      #./aplin
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
      ./wezterm
    ]
    ++ lib.lists.optionals (desk == "desktop") [
      ./mangohud
    ];
}
