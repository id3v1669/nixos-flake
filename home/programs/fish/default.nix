{ config
, pkgs
, envir
, hostname
, desk
, ...
}:
{
  programs.fish = {
    enable = true;
      shellAliases = {    #global aliases
        me = "echo $hostname";
        vi = "vim";
        nano = "nano -l";
        neofetch = "fastfetch";
      };
      functions = {
        fish_greeting = {
          description = "Greeting to show when starting a fish shell";
          body = let
            commonPart = ''


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
        '';
            conditionalPart = if desk != "server" then ''
switch "$hostname"
  case "${hostname}${envir}"
    alias scr="bash ${config.home.homeDirectory}/.scripts/screen.sh"
    alias tests="bash ${config.home.homeDirectory}/.scripts/tests.sh"
    alias yay="distrobox enter --name archbox -- yay"
    alias pacman="distrobox enter --name archbox -- sudo pacman"
    #alias packettracer="distrobox-enter --name archbox -- 'packettracer &'"
    alias archt="distrobox enter archbox"
    alias debt="distrobox enter debbox"
  case '*'
    # Default case
end
            '' else '''';
          in
          conditionalPart + commonPart;

      };
    };
  };
}