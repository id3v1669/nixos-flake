{ pkgs
, ...
}: 
(pkgs.python311Packages.pytorch-lightning.override {
  torch = pkgs.python311Packages.torchWithCuda;
})