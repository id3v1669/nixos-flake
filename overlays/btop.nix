{ cpuvar
, gpuvar
, ...
}: final: pkgs: {
  btop = (pkgs.btop.override {
    cudaSupport = (gpuvar.type == "nvidia" && gpuvar.tech != "nvk");
    rocmSupport = (
      (gpuvar.type == "amd" && gpuvar.tech != "broken") ||
      (cpuvar.type == "amd" && cpuvar.hasIntegrated && !cpuvar.integratedBroken)
    );
  });
}