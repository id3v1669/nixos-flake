{
  pkgs,
  stable,
  inputs,
  ...
}: {
  imports = [
    #./../security.nix
  ];
  home.packages = with pkgs; [
    # gui
    stable.gimp # image editing

    # text & docs
    joplin-desktop # note taking app

    # games
    (prismlauncher.override {
      jdks = with pkgs; [jdk23 zulu];
    })

    # vid photo etc
    libsForQt5.kdenlive # video editing

    #testing
    nur.repos.tarantoj.nudelta

    stable.rustdesk
    teamspeak6-client

    millennium

    osu-lazer-bin
    inputs.waysip.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
