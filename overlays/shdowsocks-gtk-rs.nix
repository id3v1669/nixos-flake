{ lib
, fetchFromGitHub
, rustPlatform
, makeWrapper
, pkg-config
, shadowsocks-rust
, glibc
, gobject-introspection
, gdk-pixbuf
, atkmm
, cairo
, gtk3
, hicolor-icon-theme
, libappindicator
}:
rustPlatform.buildRustPackage rec {
  pname = "shadowsocks-gtk-rs";
  version = "0.4.1";
  src = fetchFromGitHub {
    owner = "spyophobia";
    repo = pname;
    rev = "4fe01ec1471ab9ddef54aec2c611b9183af8fb1b";
    hash = "sha256-6Av/ms3q/t5lZxDhoZ+Q9vV5HhEHE0+fZbGlwVNGce4=";
  };
  cargoLock = { lockFile = "${src}/Cargo.lock"; };
  
  nativeBuildInputs = [ pkg-config makeWrapper hicolor-icon-theme libappindicator ];
  buildInputs = [
    glibc
    shadowsocks-rust
    gobject-introspection
    gdk-pixbuf
    atkmm
    cairo
    gtk3
  ];


  postInstall = ''
  install -Dm 644 -t "$out/share/icons/hicolor/512x512/apps" $src/res/logo/shadowsocks-gtk-rs.png
  install -Dm 644 -t "$out/share/applications" $src/res/shadowsocks-gtk-rs.desktop
    wrapProgram $out/bin/ssgtk \
      --prefix LD_LIBRARY_PATH : ${lib.makeBinPath buildInputs} \
      --prefix PATH : ${lib.makeBinPath buildInputs}
  '';

  meta = with lib; {
    description = "GUI client for Shadowsocks written in Rust";
    homepage = "https://github.com/spyophobia/shadowsocks-gtk-rs";
    broken = true; 
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ "x86_64-linux" ];
  };
}
