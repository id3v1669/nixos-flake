{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, pkg-config
, wayland-scanner
, makeWrapper
, wrapQtAppsHook
, hyprland-protocols
, libdrm
, mesa
, pipewire
, qtbase
, qttools
, qtwayland
, sdbus-cpp
, systemd
, wayland
, wayland-protocols
, hyprland
, slurp
}:
stdenv.mkDerivation {
  pname = "xdg-desktop-portal-hyprland";
  version = "unstable-2023-09-18";

  src = fetchFromGitHub {
    owner = "hyprwm";
    repo = "xdg-desktop-portal-hyprland";
    rev = "54b5467ec12fb115b537e0c86256226474edf8bb";
    hash = "sha256-N4W0Ab/w8LIfRzaZPyKqmZx+r67uIgPrrqQjECGnwBs=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    wayland-scanner
    makeWrapper
    wrapQtAppsHook
  ];

  buildInputs = [
    hyprland-protocols
    libdrm
    mesa
    pipewire
    qtbase
    qttools
    qtwayland
    sdbus-cpp
    systemd
    wayland
    wayland-protocols
  ];

  dontWrapQtApps = true;

  postInstall = ''
    wrapProgramShell $out/bin/hyprland-share-picker \
      "''${qtWrapperArgs[@]}" \
      --prefix PATH ":" ${lib.makeBinPath [slurp hyprland]}

    wrapProgramShell $out/libexec/xdg-desktop-portal-hyprland \
      --prefix PATH ":" ${lib.makeBinPath [(placeholder "out")]}
  '';

}