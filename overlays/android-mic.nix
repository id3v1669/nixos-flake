final: pkgs: {
  android-mic = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
    pname = "android-mic";
    version = "2.2.8";

    src = pkgs.fetchFromGitHub {
      owner = "teamclouday";
      repo = "AndroidMic";
      rev = "3db80c53f67803f2064a868dcdb63de4a86cce8c";
      hash = "sha256-y+Flj4JkPPVGq57AA8Bs6SzOSBeh5SmEKlMUxM2F3Jk=";
    };

    cargoRoot = "RustApp";

    cargoHash = "sha256-qj02kqBXXpDK2Mf49m6Uq/Hnn6J7x3QWpiunS07FkB4=";

    buildInputs = with pkgs; [
      libjack2
      pipewire
      libpulseaudio

      alsa-lib
    ];

    RNNOISE_MODEL_PATH = pkgs.fetchurl {
      url = "https://media.xiph.org/rnnoise/models/rnnoise_data-0a8755f8e2d834eff6a54714ecc7d75f9932e845df35f8b59bc52a7cfe6e8b37.tar.gz";
      hash = "sha256-CodV+OLYNO/2pUcU7MfXX5ky6EXfNfi1m8UqfP5uizc=";
    };

    nativeBuildInputs = with pkgs; [
      rustPlatform.bindgenHook

      libcosmicAppHook
      protobuf
    ];

    buildAndTestSubdir = finalAttrs.cargoRoot;

    meta = {
      homepage = "https://github.com/teamclouday/AndroidMic";
      mainProgram = "android-mic";
    };
  });
}
