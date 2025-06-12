_: {
  programs.fish = {
    enable = true;
    shellAliases = {
      me = "echo $hostname";
      neofetch = "fastfetch";
      ls = "eza -a";
      scr = "bash ~/.scripts/screen.sh";
    };
    interactiveShellInit = ''
      function fish_greeting
        echo "
                                --- Welcome to $hostname fish ---

                                        ░░░░▒▒
                                          ▒▒░░░░
                                            ░░░░▒▒
                                ▒▒          ▒▒▒▒░░▒▒
                                ░░▒▒      ░░▒▒▒▒▒▒░░░░
                                  ▒▒▒▒  ░░░░░░▒▒▒▒░░░░░░
                                  ░░▒▒░░░░░░▒▒▒▒▒▒░░██░░░░
                                  ░░▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░
                                  ▒▒▒▒  ░░░░░░▒▒▒▒░░░░░░
                                ░░▒▒      ░░▒▒▒▒▒▒░░░░
                                ▒▒          ▒▒▒▒░░▒▒
                                            ░░░░▒▒
                                          ▒▒░░░░
                                        ░░░░▒▒
          "
      end
    '';
  };
}
