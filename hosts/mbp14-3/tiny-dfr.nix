{
  pkgs,
  fetchFromGitHub,
  rustPlatform,
  ...
}: let
  repo = fetchFromGitHub {
    owner = "kekrby";
    repo = "tiny-dfr";
    rev = "8a5d413cb1dbe2a25b77a9e7f3cb5b9c88ef3ffb";
    hash = "sha256-l4D7aePz/CYpkRorrvsgIYrvSzoZl59OGcFGJqqJftk=";
  };
in
  rustPlatform.buildRustPackage rec {
    pname = "tiny-dfr";
    version = repo.rev;

    src = repo;

    cargoLock.lockFile = "${src}/Cargo.lock";

    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    buildInputs = with pkgs; [
      udev
      glib
      pango
      cairo
      gdk-pixbuf
      libxml2
      libinput
    ];

    postPatch = ''
      substituteInPlace src/main.rs --replace "/usr/share/tiny-dfr/" "$out/share/tiny-dfr/"
    '';

    postInstall = ''
      mkdir -p $out/etc $out/share

      cp -r etc/udev $out/etc/
      cp -r share/tiny-dfr $out/share/
    '';
  }
