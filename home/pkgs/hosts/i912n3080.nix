{ pkgs
, inputs
, ...
}:
{
  imports = [
    ./../security.nix
  ];
  home.packages = with pkgs; [
    # gui
    gimp                                 # image editing

    # dev
    jetbrains.rust-rover                 # rust ide

    # text & docs
    joplin-desktop                       # note taking app

    # games
    #prismlauncher
    (prismlauncher.override {
      jdks = with pkgs; [jdk22 zulu];
    })
    
    # vid photo etc
    libsForQt5.kdenlive           # video editing

    #testing
    zed-editor
    sysbench
    phoronix-test-suite
    stress
    #zettlr

  ];
}
