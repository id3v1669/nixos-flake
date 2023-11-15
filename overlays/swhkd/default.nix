{ lib
, fetchFromGitHub
, rustPlatform
, makeWrapper
, pkg-config
, udev
, polkit
, gnumake
, bash
, psmisc
, runtimeShell
}:

rustPlatform.buildRustPackage rec {
  pname = "swhkd";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "waycrate";
    repo  = pname;
    rev = version;
    hash = "sha256-mpE+//a44wwraCCpBTnWXslLROF2dSIcv/kdpxHLD4M=";
  };

  cargoHash = "sha256-H14YwK4Ow86UxVXoclCjk2xYtu8L/44zkzf9gpveAh8=";

  # postFixup = ''
  #   wrapProgram "$out/bin/swhkl" \
  #     --set XDG_CONFIG_HOME "/home/user/.config"
  #   wrapProgram "$out/bin/swhks" \
  #     --set XDG_CONFIG_HOME "/home/user/.config"
  # '';

}

#currently glitch. When executed in a while catches all keyboard and 
#doesn't allow to use other system shortcuts to perform