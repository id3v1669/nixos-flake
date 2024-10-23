{ pkgs
, gpuvar
, ...
}:
(pkgs.btop.override {
  cudaSupport = (gpuvar.type == "nvidia" && gpuvar.tech != "nvk");
  rocmSupport = (gpuvar.type == "amd");
})