{ pkgs
, ...
}: 
(pkgs.python311Packages.torchsde.override {
  torch = pkgs.python311Packages.torchWithCuda;
})