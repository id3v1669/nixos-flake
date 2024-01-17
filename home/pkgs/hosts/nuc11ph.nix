{ pkgs
, ...
}:
let
pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    
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
    torchWithCuda

    pkgs.over-accelerate
    pkgs.over-torchsde
    pkgs.over-pytorch-lightning
    pkgs.over-torchgpipe
    pkgs.over-torchvision
    pkgs.over-pytorch-metric-learning
    pkgs.over-bitsandbytes
    pkgs.over-timm
    pkgs.over-opencv4
    
    pycuda
  ]);
in
{
  home.packages = with pkgs; [
    # text & docs
    over-joplin                   # note taking app

    # other gui tools
    github-desktop                # github desktop
    jetbrains.rider               # c# ide

    # files
    filezilla                     # ftp client

    egl-wayland                   # for nvidia vms
    prismlauncher                 # minecraft launcher
    #libsForQt5.kdenlive          # video editing currently installed via flatpak(fix needed)
    gimp                          # image editing
    over-outline-manager          # outline manager vpn(proxy)

    #over-fooocus                # images ai
    #pythonEnv
  ];
}
