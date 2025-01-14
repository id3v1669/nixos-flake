{ pkgs
, stable
, inputs
, ...
}:
{
  imports = [
    ./../security.nix
  ];
  home.packages = with pkgs; [
    # gui
    stable.gimp                          # image editing

    # text & docs
    joplin-desktop                       # note taking app

    # games
    (prismlauncher.override {
      jdks = with pkgs; [jdk23 zulu];
    })
    
    # vid photo etc
    libsForQt5.kdenlive           # video editing

    #testing
    sysbench
    phoronix-test-suite
    stress
    #zettlr
    nur.repos.tarantoj.nudelta
  ];
}
