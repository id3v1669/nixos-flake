{ pkgs
, ...
}:
(pkgs.vesktop.override {
  electron = pkgs.electron_30;
  withSystemVencord = false;
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = old.src.override {
      rev = "v1.8.6";
      hash = "sha256-akCuZcB7psZlMAnDKJU3bK1K++ACjHxTUFxl5DRdtQ4=";
    };
  });
}).overrideAttrs (oldAttrs: rec {
  # version = "1.5.2";
  # src = oldAttrs.src.override {
  #   rev = "6b948668b9a700aa86ef7c5843d8ab10b668ebf6"; #"a8d72fa665df1077d299dfaf87faceedda2a0e84";
  #   hash = "sha256-+u0TlGxLILqYj78S0VnIVVvehKafQBa4MiAvdazaBYY="; #"sha256-sLxAPllWW1N/s144/J25iMraJZfzru5oxOkE7Q79NvM=";
  # };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-PogE8uf3W5cKSCqFHMz7FOvT7ONUP4FiFWGBgtk3UC8=";
  });
  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt/Vesktop
    cp -r dist/linux-*unpacked/resources $out/opt/Vesktop/

    pushd build
    ${pkgs.libicns}/bin/icns2png -x icon.icns
    for file in icon_*x32.png; do
      file_suffix=''${file//icon_}
      install -Dm0644 $file $out/share/icons/hicolor/''${file_suffix//x32.png}/apps/vesktop.png
    done

    makeWrapper ${pkgs.electron_30}/bin/electron $out/bin/vesktop \
      --add-flags $out/opt/Vesktop/resources/app.asar \
      --add-flags "--enable-speech-dispatcher"
 

    runHook postInstall
  '';
})
#     --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime}}"