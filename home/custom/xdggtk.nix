{ stdenv
, lib
, fetchFromGitHub
, autoreconfHook
, pkg-config
, libxml2
, xdg-desktop-portal
, gtk3
, gnome
, gnome-desktop
, glib
, wrapGAppsHook
, gsettings-desktop-schemas
}:

stdenv.mkDerivation rec {
  pname = "xdggtk";
  version = "git1";

  src = fetchFromGitHub {
    owner = "flatpak";
    repo = "xdg-desktop-portal-gtk";
    rev = "dc8e1d11382f3c173017844d766fb052b1a86f2f";
    sha256 = "1d3jmgsf6hbhgd6lvy5k6pafbkpixpp8a9vxr0jrdr44a0216xl9";
  };

  nativeBuildInputs = [
    autoreconfHook
    libxml2
    pkg-config
    wrapGAppsHook
    xdg-desktop-portal
  ];

  buildInputs = [
    glib
    gsettings-desktop-schemas # settings exposed by settings portal
    gtk3
    gnome-desktop
    gnome.gnome-settings-daemon # schemas needed for settings api (mostly useless now that fonts were moved to g-d-s)
  ];

  configureFlags = [
    "--enable-wallpaper"
    "--enable-screenshot"
    "--enable-screencast"
    "--enable-background"
    "--enable-settings"
    "--enable-appchooser"
    #"--disable-settings"
    #"--disable-appchooser"
  ];

}