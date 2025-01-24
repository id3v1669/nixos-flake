{ inputs
, gpuvar
, ...
}: final: pkgs: {
  eww = inputs.eww.packages.${pkgs.system}.eww.override {
    cudaSupport = (gpuvar.type == "nvidia" && gpuvar.tech != "nvk");
  };
}
