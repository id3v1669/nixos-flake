{ pkgs
, ...
}:
(pkgs.vesktop.override {
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = old.src.override {
      rev = "v1.8.0";
      hash = "sha256-IE0QV16O3zg8YIu0T8iLYW75ARjlZn0S5P6PLc9S/Rc=";
    };
  });
}).overrideAttrs (oldAttrs: rec {
  version = "1.5.2";
  src = oldAttrs.src.override {
    rev = "v${version}";
    hash = "sha256-cZOyydwpIW9Xq716KVi1RGtSlgVnOP3w8vXDwouS70E=";
  };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-6ezEBeYmK5va3gCh00YnJzZ77V/Ql7A3l/+csohkz68=";
  });
})
