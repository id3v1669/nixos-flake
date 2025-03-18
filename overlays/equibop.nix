final: pkgs: {
  equibop = pkgs.equibop.override {
    inherit (pkgs) electron;
  };
}
