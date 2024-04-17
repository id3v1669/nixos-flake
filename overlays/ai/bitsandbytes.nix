{ pkgs
, ...
}: 
(pkgs.python311Packages.bitsandbytes.override {
  torch = pkgs.python311Packages.torchWithCuda;
})