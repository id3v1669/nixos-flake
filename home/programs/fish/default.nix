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
        wifi = "sudo bash ${config.home.homeDirectory}/mywifi.sh";
        vi = "vim";
        ewwr = "kill $(pidof eww) && bash ${config.home.homeDirectory}/.scripts/ewwlauncher.sh";
        xdgr = "bash ${config.home.homeDirectory}/.scripts/portals.sh";
        ncb = "bash ${pkgs.nix}/bin/nix-collect-garbage";
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
    alias firstinstall="bash ${config.home.homeDirectory}/.scripts/firstinstall.sh"
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