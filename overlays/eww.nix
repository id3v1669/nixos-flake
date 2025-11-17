{
  inputs,
  gpuvar,
  ...
}: final: pkgs: {
  eww = inputs.eww.packages.${pkgs.stdenv.hostPlatform.system}.eww.override {
    nvidiaSupport = gpuvar.type == "nvidia" && gpuvar.tech != "nvk";
  };
}
