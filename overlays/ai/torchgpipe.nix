{ pkgs
, ...
}: 
(pkgs.python311Packages.torchgpipe.override {
  torch = pkgs.python311Packages.torchWithCuda;
})