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