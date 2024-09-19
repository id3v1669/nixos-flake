{ pkgs
, gpuvar
, ...
}: 
pkgs.vesktop.overrideAttrs (oldAttrs: rec {
  postFixup = ''
    makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
      --add-flags $out/opt/Vesktop/resources/app.asar ${if (gpuvar.type != "nvidia") then "--add-flags \"--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime\"" else ""}
  '';
})