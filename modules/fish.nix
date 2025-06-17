_: {
  programs.fish = {
    enable = true;
    shellAliases = {
      me = "echo $hostname";
      neofetch = "fastfetch";
      ls = "eza -a";
      scr = "bash ~/.scripts/screen.sh";
      ox = "ox --config /etc/ox/oxrc";
      sox = "sudo ox --config /etc/ox/oxrc";
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
