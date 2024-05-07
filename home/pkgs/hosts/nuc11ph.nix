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
    over-joplin                        # note taking app
    calibre                       # e-book reader

    # dev
    github-desktop                # github desktop
    jetbrains.rider               # c# ide
    jetbrains.rust-rover          # rust ide
#    over-bootstrap-studio         # web design (front-end)
    rstudio                       # r ide

    # files
    filezilla                     # ftp client

    # security
    over-veracrypt                     # gui encryption
    over-sherlock                 # find accounts by username

    #gmaes
    osu-lazer                     # rhythm game

    egl-wayland                   # for nvidia vms
    over-prismlauncher            # minecraft launcher
    
    libsForQt5.kdenlive           # video editing
    gimp                          # image editing
#    over-outline-manager          # outline manager vpn(proxy)

    #over-fooocus                # images ai
    #pythonEnv
  ];
}
