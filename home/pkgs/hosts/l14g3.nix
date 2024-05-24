{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # gui
    gimp                                                   # image editing
    over-outline-manager                                   # outline manager vpn(proxy)

    # security
    veracrypt                                              # gui encryption

    # dev
    jetbrains.rider                                        # c# ide
    #bootstrap-studio                                       # web design (front-end)
    (rstudioWrapper.override{ packages = with rPackages; [ # r ide
      tidyverse
      caret
      glmnet
      forcats
      e1071
      readr
      moments
      ggpubr
      scatterplot3d
      factoextra
      mikropml
      rpart
      rpart_plot
      ipred
      ranger
      mlbench
    ];})

    # text & docs
    over-joplin                                            # note taking app

    # files
    filezilla                                              # ftp client
  ];
}