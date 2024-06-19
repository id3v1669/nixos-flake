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

    # dev
    github-desktop                # github desktop
    jetbrains.rust-rover          # rust ide


    #over-prismlauncher           # minecraft launcher
    
    libsForQt5.kdenlive           # video editing
    gimp                          # image editing
#    over-outline-manager         # outline manager vpn(proxy)

    #over-fooocus                 # images ai
    #pythonEnv

    #for gtk theme testing
    optipng
    sassc
    gtk-engine-murrine
    inkscape-with-extensions
    gnome.gnome-themes-extra
    gnome.geary
    gnome.totem
    evince
    gedit
    gnome.gnome-terminal
    lollypop
    gnome.gnome-calendar
    gnome.gnome-system-monitor

  ];
}
