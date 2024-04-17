{ pkgs
, ...
}: 
(pkgs.python311Packages.torchvision.override {
  torch = pkgs.python311Packages.torchWithCuda;
})