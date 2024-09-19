{ pkgs
, lib
, config
, desk
, ...
}: 
{
  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      extraRules = [
        {
          groups = [ "wheel" ];
          commands = [
            {
              command = "/run/current-system/sw/bin/nix-collect-garbage";
              options = ["NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nixos-rebuild";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];
    };
  };
}