{ pkgs
, ...
}: 
(pkgs.python311Packages.accelerate.override {
  torch = pkgs.python311Packages.torchWithCuda;
})