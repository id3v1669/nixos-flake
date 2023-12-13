{ fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "tun2socks";
  version = "2.5.2";
  src = fetchFromGitHub ({
    owner = "xjasonlyu";
    repo = "tun2socks";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-siAengVJXusQ5o9cTaADeRn5eW4IoCHkMMf6Bx8iWws=";
  });

  vendorHash = "sha256-zeiOcn33PnyoseYb0wynkn7MfGp3rHEYBStY98C6aR8=";

  subPackages = [ "." ];

  doCheck = false;
}