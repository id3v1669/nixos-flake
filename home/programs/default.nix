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
      ./claude-code
      ./vscodium
      ./firefox
      ./other
      ./discord
      ./telegram
      ./kitty
      ./joplin
      ./obs
      ./satty
      ./chromium
      ./spicetify
      ./wezterm
      ./mangohud
    ]
    ++ lib.lists.optionals (desk == "desktop") [
    ];
}
