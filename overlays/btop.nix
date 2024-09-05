{ pkgs
, gpuvar
, ...
}:
(pkgs.btop.override {
  cudaSupport = if gpuvar.type == "nvidia" then true else false;
  rocmSupport = if gpuvar.type == "amd" then true else false;
})