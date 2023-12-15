{ pkgs
, lib
, python3
, stdenv
, fetchFromGitHub
, makeWrapper
}:
let
  pythonEnv = python3.withPackages (ps: with ps; [
    torchsde
    einops
    transformers
    safetensors
    accelerate
    pyyaml
    pillow
    scipy
    tqdm
    psutil
    numpy
    pytorch-lightning
    omegaconf
    gradio
    pygit2
    opencv4
    #opencv-contrib-python
    httpx
    onnxruntime
    timm

    torchWithCuda
    pip
    setuptools
    bitsandbytes
    torchgpipe
    torchvision
    pytorch-metric-learning
  ]); #++ [ pkgs.glibc]);
in
stdenv.mkDerivation rec {
  pname = "Fooocus";
  version = "unstable-16-12-2023";

  src = fetchFromGitHub {
    owner = "lllyasviel";
    repo = "${pname}";
    rev = "a7f82b2545a5959d00edfaf5e92a7f2cdabd9223";
    hash = "sha256-EDPByGQbeWPHTI0Gz64XLvoPglZkJL2vXD3B591SxaI=";
  };

  patches = [
    ./fix-paths.patch
  ];

  nativeBuildInputs = [ makeWrapper ];

  configurePhase = "#...";
  buildPhase = "#...";

  installPhase = ''
    mkdir -p $out/opt/Fooocus
    cp -r $src/* $out/opt/Fooocus

    mkdir -p $out/bin
    makeWrapper ${pythonEnv}/bin/python $out/bin/${pname} \
      --add-flags "$out/opt/Fooocus/launch.py" \
      --add-flags "--output-path $HOME/.config/Fooocus/output" \
      --add-flags "--cache-path $HOME/.config/Fooocus/cache" \
      --set PYTHONPATH "${pythonEnv}/${pythonEnv.sitePackages}:$PYTHONPATH"
  '';

}