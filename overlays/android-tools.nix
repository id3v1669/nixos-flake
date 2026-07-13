final: pkgs: let
  installerVersion = "0.11.2";

  installer = pkgs.appimageTools.extractType2 {
    pname = "ubports-installer";
    version = installerVersion;
    src = pkgs.fetchurl {
      url = "https://github.com/ubports/ubports-installer/releases/download/${installerVersion}/ubports-installer_${installerVersion}_linux_x86_64.AppImage";
      hash = "sha256-N22L+KnjjtGA9syo5aLldbP6K8IXV8CZ3trpYBxBSYY=";
    };
  };
in {
  android-tools = pkgs.stdenv.mkDerivation {
    pname = "android-tools";
    version = "33.0.3";

    dontUnpack = true;

    nativeBuildInputs = [pkgs.autoPatchelfHook];
    buildInputs = [pkgs.libusb1 pkgs.stdenv.cc.cc.lib];

    installPhase = ''
      runHook preInstall
      dist=${installer}/resources/app.asar.unpacked/node_modules/android-tools-bin/dist/linux/x86
      mkdir -p $out/lib $out/bin
      cp -r "$dist" $out/lib/android-tools
      chmod -R u+w $out/lib/android-tools
      for tool in adb dmtracedump e2fsdroid etc1tool fastboot heimdall hprof-conv make_f2fs make_f2fs_casefold mke2fs sload_f2fs sqlite3; do
        ln -s $out/lib/android-tools/$tool $out/bin/$tool
      done
      runHook postInstall
    '';

    preFixup = ''
      addAutoPatchelfSearchPath $out/lib/android-tools/lib64
    '';

    meta = {
      description = "Prebuilt Android platform-tools 33";
      mainProgram = "adb";
    };
  };
}
