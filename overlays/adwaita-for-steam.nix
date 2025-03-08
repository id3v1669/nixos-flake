final: pkgs: {
  adwaita-for-steam = pkgs.callPackage (
  { customCss ? null
    , extraOptions ? [ ]
    , ...
  }:
  let
    customCssFlag = if customCss != null then "--custom-css" else "";
    extras = builtins.concatStringsSep " " (map (s: "-e ${s}") extraOptions);
    importCustomCSS = if customCss != null then "cp -rf ${customCss} ./custom/custom.css" else "rm ./custom/custom.css";
  in 
  pkgs.stdenvNoCC.mkDerivation rec {
    pname = "adwaita-for-steam";
    version = "3.7";

    src = pkgs.fetchFromGitHub {
      owner = "tkashkin";
      repo = "Adwaita-for-Steam";
      rev = "${version}";
      hash = "sha256-wo8Y9bZjt3fzKUmZX4KlZaPXomZrXj0N2X6zQyjabeA=";
    };

    preferLocalBuild = true;

    nativeBuildInputs = [ pkgs.python3 ];

    buildPhase = ''
      mkdir build
      ${importCustomCSS}
      python install.py --target ./build ${customCssFlag} ${extras}
      find ./build -type f \( -name "README.md" -o -name ".gitignore" \) -delete # Remove unnecessary files
    '';

    installPhase = ''
      mv build $out
    '';
  }) {};
}