final: pkgs: {
  equibop = pkgs.equibop.override {
    electron = pkgs.electron;
  };
}
