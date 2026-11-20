final: pkgs: {
  nvidia-vaapi-driver =
    if pkgs.stdenv.hostPlatform.isx86_64
    then
      pkgs.nvidia-vaapi-driver.overrideAttrs (old: {
        version = "0.0.18-nvenc-67fcc44";
        src = pkgs.fetchFromGitHub {
          owner = "ntoskrnl7";
          repo = "nvidia-vaapi-driver";
          rev = "67fcc44a0547aee9c753cc60abbbd8638f1101f2";
          hash = "sha256-suahCtsepUCQdZkuEgPuYW6tS3SU8+s59DBPxp3kyuk=";
        };
        # the encode branch needs ffnvcodec >= 13.0.19 (nixpkgs builds this package against 11.x)
        buildInputs =
          (builtins.filter (p: (p.pname or "") != "nv-codec-headers") old.buildInputs)
          ++ [pkgs.nv-codec-headers-13];
      })
    else pkgs.nvidia-vaapi-driver;
}
