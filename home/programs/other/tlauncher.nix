{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  makeDesktopItem,
  jdk21
}:
stdenv.mkDerivation rec {
  pname = "tlauncher";
  version = "1.0"; #unknown

  src = fetchurl rec {
    url = "https://tlaun.ch/repo/downloads/TL_mcl.jar";
    sha256 = "0a4gy5ypkj6w477b5r87jn6vacc4d7mb2ypz7234j5nsf8gwpscs";
  };
  icon = fetchurl {
    url = "https://launcher.mojang.com/download/minecraft-launcher.svg";
    sha256 = "0w8z21ml79kblv20wh5lz037g130pxkgs8ll9s3bi94zn2pbrhim";
  };

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];
  runtimeDeps = [
    jdk21
  ];

  installPhase = ''
    install -Dm555 $src $out/share/tlauncher/tlauncher.jar
    makeWrapper "${jdk21}/bin/java" "$out/bin/tlauncher" \
      --add-flags "-jar $out/share/tlauncher/tlauncher.jar" \
      --prefix PATH : ${lib.makeBinPath runtimeDeps}
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "tlauncher";
      desktopName = "TLauncher";
      exec = "tlauncher";
      inherit icon;
      comment = "Minecraft launcher";
      keywords = [ "java" "minecraft" "tlauncher" ];
    })
  ];
}