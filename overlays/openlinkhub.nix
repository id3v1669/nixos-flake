final: pkgs: {
  openlinkhub = pkgs.buildGoModule rec {
    pname = "openlinkhub";
    version = "0.5.0";

    src = pkgs.fetchFromGitHub {
      owner = "jurkovic-nikola";
      repo = "OpenLinkHub";
      tag = version;
      hash = "sha256-2dsdswtpKXHEiPOdGS1gIyx8r3xx3Bjr2i4WyX4hmVY=";
    };

    proxyVendor = true;

    vendorHash = "sha256-nDE3GUZl5OBSlhRpJBixUbWhhFMeieidNrSIzOOB/9g=";

    nativeBuildInputs = [pkgs.makeWrapper];
    buildInputs = with pkgs; [
      udev
      systemd
    ];
    postInstall = ''
      mkdir -p $out/share/OpenLinkHub
      touch $out/share/OpenLinkHub/atomic
      cp -rv database static web $out/share/OpenLinkHub
      wrapProgram $out/bin/OpenLinkHub \
        --chdir $out/share/OpenLinkHub \
        --suffix PATH : ${pkgs.lib.makeBinPath [pkgs.pciutils]};
    '';
  };
}
