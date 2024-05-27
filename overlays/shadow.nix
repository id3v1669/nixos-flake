{ pkgs
, ...
}:
pkgs.gpu-screen-recorder.overrideAttrs (oldAttrs: rec {
  version = "unstable-2024-05-21";
  src = pkgs.fetchurl {
    url = "https://dec05eba.com/snapshot/gpu-screen-recorder.git.r594.e572073.tar.gz";
    hash = "sha256-MTBxhvkoyotmRUx1sRN/7ruXBYwIbOFQNdJHhZ3DdDk=";
  };
})
