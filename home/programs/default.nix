{
  lib,
  desk,
  ...
}: {
  imports =
    [
      ./btop
      ./fastfetch
      ./git
      ./ssh
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
      ./wayshot
    ]
    ++ lib.lists.optionals (desk == "desktop") [
    ];
}
