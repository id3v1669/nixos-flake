{ pkgs
, ...
}: 
pkgs.logseq.override {
  electron = pkgs.electron;
}