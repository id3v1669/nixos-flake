{ pkgs
, ...
}: 
(pkgs.python311Packages.timm.override {
  torch = pkgs.python311Packages.torchWithCuda;
  torchvision = (pkgs.python311Packages.torchvision.override {
    torch = pkgs.python311Packages.torchWithCuda;
  });
})