{ lib
, stdenv
, fetchurl
, pkg-config
, makeself
, yasm
, fuse
, wxGTK31
, lvm2
, substituteAll
, pcsclite
, e2fsprogs
, exfat
, ntfs3g
, btrfs-progs
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "veracrypt";
  version = "1.26.7";
  
  src = fetchurl {
    url = "https://launchpad.net/${pname}/trunk/${version}/+download/VeraCrypt_${version}_Source.tar.bz2";
    hash = "sha256-920nsYJBTg1P2ba1n76iiyXbb6afK7z/ouwmmxqGX2U=";
  };

  patches = [
    (substituteAll {
      src = ./fix-paths.patch;
      ext2 = "${e2fsprogs}/bin/mkfs.ext2";
      ext3 = "${e2fsprogs}/bin/mkfs.ext3";
      ext4 = "${e2fsprogs}/bin/mkfs.ext4";
      exfat = "${exfat}/bin/mkfs.exfat";
      ntfs = "${ntfs3g}/bin/mkfs.ntfs";
      btrfs = "${btrfs-progs}/bin/mkfs.btrfs";
    })
  ];

  sourceRoot = "src";

  nativeBuildInputs = [ makeself pkg-config yasm wrapGAppsHook ];
  buildInputs = [ fuse lvm2 wxGTK31 pcsclite ];

  enableParallelBuilding = true;

  installPhase = ''
    install -Dm 755 Main/${pname} "$out/bin/${pname}"
    install -Dm 444 Resources/Icons/VeraCrypt-256x256.xpm "$out/share/pixmaps/${pname}.xpm"
    install -Dm 444 License.txt -t "$out/share/doc/${pname}/"
    install -d $out/share/applications
    substitute Setup/Linux/${pname}.desktop $out/share/applications/${pname}.desktop \
      --replace "Exec=/usr/bin/veracrypt" "Exec=$out/bin/veracrypt" \
      --replace "Icon=veracrypt" "Icon=veracrypt.xpm"
  '';

  meta = with lib; {
    description = "Free Open-Source filesystem on-the-fly encryption";
    homepage = "https://www.veracrypt.fr/";
    license = with licenses; [ asl20 /* and */ unfree /* TrueCrypt License version 3.0 */ ];
    maintainers = with maintainers; [ dsferruzza id3v1669 ];
    platforms = platforms.linux;
  };
}