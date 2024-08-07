{ ...
}: 
{
  security = {
    sudo = {
      enable = true;
      execWheelOnly = true;
      extraRules = [
        # allow wheel group to run nix-collect-garbage and nixos-rebuild without password
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
    sudo-rs = {
      enable = false;
      execWheelOnly = true;
      extraRules = [
        # allow wheel group to run nix-collect-garbage and nixos-rebuild without password
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