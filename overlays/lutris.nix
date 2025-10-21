final: pkgs: {
  lutris = pkgs.lutris.override {
    extraPkgs = pkgs:
      with pkgs; [
        speex
        speexdsp
        SDL2_sound
        wineasio

        (wine-staging.override {
          wineBuild = "wine64";
          alsaSupport = true;
          cairoSupport = true;
          cupsSupport = true;
          cursesSupport = true;
          dbusSupport = true;
          embedInstallers = true;
          fontconfigSupport = true;
          gettextSupport = true;
          gphoto2Support = true;
          gstreamerSupport = true;
          gtkSupport = true;
          krb5Support = true;
          mingwSupport = true;
          netapiSupport = true;
          odbcSupport = true;
          openclSupport = true;
          openglSupport = true;
          pcapSupport = true;
          pulseaudioSupport = true;
          saneSupport = true;
          sdlSupport = true;
          tlsSupport = true;
          udevSupport = true;
          usbSupport = true;
          v4lSupport = true;
          vaSupport = true;
          vulkanSupport = true;
          waylandSupport = true;
          x11Support = true;
          xineramaSupport = true;
        })
        wineWowPackages.stagingFull
        v4l-utils
      ];
  };
}
