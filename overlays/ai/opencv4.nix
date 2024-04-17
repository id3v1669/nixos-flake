{ pkgs
, ...
}: 
(pkgs.python311Packages.opencv4.override {
  enableCuda = true;
  enableCublas = true;
  enableCudnn = true;
  enableCufft = true;
})