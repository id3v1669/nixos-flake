{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
      shellAliases = {    #global aliases
        me = "echo $hostname";
        wifi = "sudo bash ~/apps/mywifi";
      };
      functions = {
        fish_greeting = {
          description = "Greeting to show when starting a fish shell";
          body = ''
if test "$hostname" = "nuc11phhypr"
  if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    Hyprland
  end
end
switch "$hostname"
    case "nuc11phhypr" "nixos" "l14g3gnome"
        alias yay="distrobox enter --name archbox -- yay"
        alias pacman="distrobox enter --name archbox -- sudo pacman"
        #alias vscode="distrobox-enter --name archbox -- code"
        alias bpytop="distrobox-enter --name archbox -- sudo bpytop"
        alias packettracer="distrobox-enter --name archbox -- 'packettracer &'"
        alias archt="distrobox enter archbox"
        alias debt="distrobox enter debbox"
    case '*'
        # Default case
end

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
      };
    };
  };
}
#if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#  WLR_NO_HARDWARE_CURSORS=1 NIXOS_OZONE_WL=1 Hyprland
#end