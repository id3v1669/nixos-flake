{
  uservars,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    settings.user = {
        name = "${uservars.owner}";
        email = "git@${uservars.domain}";
    };
    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/master.pub";
      signByDefault = true;
    };
  };
}
