{ lib
, fetchFromGitHub
, rustPlatform
}:
rustPlatform.buildRustPackage rec {
  pname = "wayshot";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "waycrate";
    repo = pname;
    rev = version;
    hash = "sha256-nUpIN4WTePtFZTmKAjv0tgj4VTdZeXjoQX6am9+M3ig=";
  };

  cargoHash = "sha256-1Y9ymodZHtxHzhudjGbkP2ohMaBMOD9K+GpUoNmzHQs=";
  
  doCheck = false;
}