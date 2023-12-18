{ lib          # broken WIP
, python3
, stdenv
, fetchFromGitHub
, pkgs
, makeWrapper
, magma-cuda
, writeShellScriptBin
}:
let

over-accelerate = (pkgs.python311Packages.accelerate.override {
            torch = pkgs.python311Packages.torchWithCuda;
          });
          over-pytorch-lightning = (pkgs.python311Packages.pytorch-lightning.override {
            torch = pkgs.python311Packages.torchWithCuda;
          });
          over-torchsde = (pkgs.python311Packages.torchsde.override {
            torch = pkgs.python311Packages.torchWithCuda;
          });
          over-torchvision = (pkgs.python311Packages.torchvision.override {
            torch = pkgs.python311Packages.torchWithCuda;
          });
          over-torchgpipe = (pkgs.python311Packages.torchgpipe.override {
            torch = pkgs.python311Packages.torchWithCuda;
          });
          over-pytorch-metric-learning = (pkgs.python311Packages.pytorch-metric-learning.override {
            torch = pkgs.python311Packages.torchWithCuda;
            torchvision = (pkgs.python311Packages.torchvision.override {
              torch = pkgs.python311Packages.torchWithCuda;
            });
            # FAILED tests/losses/test_histogram_loss.py::TestHistogramLoss::test_histogram_loss 
          }).overrideAttrs (oldAttrs: rec {
            disabledTests = [
              "TestDistributedLossWrapper"
              "TestInference"
              "test_histogram_loss"
              "test_get_nearest_neighbors"
              "test_tuplestoweights_sampler"
              "test_untrained_indexer"
              "test_metric_loss_only"
              "test_pca"
              "test_distributed_classifier_loss_and_miner"
              "test_global_embedding_space_tester"
              "test_with_same_parent_label_tester"
            ];
          });
          over-bitsandbytes = (pkgs.python311Packages.bitsandbytes.override {
            torch = pkgs.python311Packages.torchWithCuda;
          });
          over-timm = (pkgs.python311Packages.timm.override {
            torch = pkgs.python311Packages.torchWithCuda;
            torchvision = (pkgs.python311Packages.torchvision.override {
              torch = pkgs.python311Packages.torchWithCuda;
            });
          });
          over-opencv4 = (pkgs.python311Packages.opencv4.override {
            enableCuda = true;
            enableCublas = true;
            enableCudnn = true;
            enableCufft = true;
          });

in stdenv.mkDerivation rec {
  pname = "Fooocus";
  version = "unstable-16-12-2023";

  src = fetchFromGitHub {
    owner = "lllyasviel";
    repo = "${pname}";
    rev = "a7f82b2545a5959d00edfaf5e92a7f2cdabd9223";
    hash = "sha256-EDPByGQbeWPHTI0Gz64XLvoPglZkJL2vXD3B591SxaI=";
  };

  pythonEnv = python3.withPackages (ps: with ps; [
    
    einops
    transformers
    safetensors
    pyyaml
    pillow
    scipy
    tqdm
    psutil
    numpy
    omegaconf
    gradio
    pygit2
    httpx
    onnxruntime

    pip
    setuptools
#    openai-triton-cuda
    torchWithCuda

    over-accelerate
    over-torchsde
    over-pytorch-lightning
    over-torchgpipe
    over-torchvision
    over-pytorch-metric-learning
    over-bitsandbytes
    over-timm
    over-opencv4
    
    pycuda
  ]);

  patches = [
    ./nixfoc.patch
  ];

  nativeBuildInputs = [
    makeWrapper
  ];

  configurePhase = "#...";
  buildPhase = "#...";



  installPhase = ''
    mkdir -p $out/opt/Fooocus
    cp -r $src/* $out/opt/Fooocus

    mkdir -p $out/bin

    cat > $out/bin/${pname} <<EOF
mkdir -p ~/Fooocus
cp -r --no-preserve=mode,ownership ${src}/models ~/Fooocus

exec ${pythonEnv}/bin/python $out/opt/Fooocus/launch.py
EOF
chmod +x $out/bin/${pname}
  '';

}
    # makeWrapper ${pythonEnv}/bin/python $out/bin/${pname} \
    #   --add-flags "$out/opt/Fooocus/launch.py" \
    #   --set PYTHONPATH "${pythonEnv}/${pythonEnv.sitePackages}:$PYTHONPATH"
#--add-flags "--output-path $HOME/.config/Fooocus/output" \
      #--add-flags "--cache-path $HOME/.config/Fooocus/cache" \