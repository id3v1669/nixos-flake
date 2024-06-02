{ pkgs
, ...
}:
pkgs.gpu-screen-recorder.overrideAttrs (oldAttrs: rec {
  version = "unstable-2024-05-21";
  src = pkgs.fetchurl {
    url = "https://dec05eba.com/snapshot/gpu-screen-recorder.git.r594.e572073.tar.gz";
    hash = "sha256-MTBxhvkoyotmRUx1sRN/7ruXBYwIbOFQNdJHhZ3DdDk=";
  };
  postInstall = ''
    install -Dt $out/bin gpu-screen-recorder gsr-kms-server
    mkdir $out/bin/.wrapped
    mv $out/bin/gpu-screen-recorder $out/bin/.wrapped/
    makeWrapper "$out/bin/.wrapped/gpu-screen-recorder" "$out/bin/gpu-screen-recorder" \
    --prefix LD_LIBRARY_PATH : ${pkgs.libglvnd}/lib \
    --suffix PATH : $out/bin
  '';
})
