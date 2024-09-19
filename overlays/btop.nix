{ pkgs
, gpuvar
, ...
}:
(pkgs.btop.override {
  cudaSupport = (gpuvar.type == "nvidia");
  rocmSupport = (gpuvar.type == "amd");
})