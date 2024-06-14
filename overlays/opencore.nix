{ stdenv
, fetchurl
, unzip
, fetchFromGitHub
, ...
}:stdenv.mkDerivation rec 
{
  pname = "opencore";
  version = "1.0.0";

  src = fetchurl rec {
    url = "https://github.com/acidanthera/OpenCorePkg/releases/download/${version}/OpenCore-${version}-RELEASE.zip";
    hash = "sha256-vGH5xDEkA2HPHOJX35nfuudKwUTMFajC0jC8IouHbbE=";
  };

  bdata = fetchFromGitHub ({
    owner = "acidanthera";
    repo = "OcBinaryData";
    rev = "af09b0bf763363ec9f4ecdbbe2f0adeb970948d8";
    hash = "sha256-tSmIqwXOwD3jDGeqLAtbwfA3Gu4JBXnfWkIeFCGd26E=";
  });

  dontUnpack = true;

  nativeBuildInputs = [ unzip ];

  installPhase = ''
mkdir -p $out/ocpkg
mkdir -p $out/ocbinaryData
${unzip}/bin/unzip $src -d $out/ocpkg
cp -r $bdata/* $out/ocbinaryData
  '';
}