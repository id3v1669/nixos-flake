final: pkgs: {
  flexbv = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "flexbv-free";
    version = "5.1200";

    src = pkgs.fetchurl {
      url = "https://pldaniels.com/flexbv5/free/FlexBVFree-${finalAttrs.version}-linux.tar.gz";
      hash = "sha256-0x4N7/L7yssfSWuOt7G53ZXk6Ib8Fxn1KAL1LM2WVdA=";
    };

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      wrapGAppsHook3
    ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      fontconfig
      SDL2
      gtk3
      glib
      gsettings-desktop-schemas
    ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 flexbv $out/bin/flexbv
      runHook postInstall
    '';
  });
}
