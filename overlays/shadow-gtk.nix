{ pkgs
, ...
}:
(pkgs.gpu-screen-recorder-gtk.override {
  gpu-screen-recorder = pkgs.gpu-screen-recorder.overrideAttrs (old: {
    version = "unstable-2024-05-21";
    src = pkgs.fetchurl {
      url = "https://dec05eba.com/snapshot/gpu-screen-recorder.git.r594.e572073.tar.gz";
      hash = "sha256-MTBxhvkoyotmRUx1sRN/7ruXBYwIbOFQNdJHhZ3DdDk=";
    };
  });
}).overrideAttrs (oldAttrs: rec {
  version = "3.7.6";

  src = pkgs.fetchurl {
    url = "https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.r277.cd777c1.tar.gz";
    hash = "sha256-cqTo9HFQ0bgzLeBHW35ZBT4lxZm6106Q92Sr/neH3X4=";
  };
})
