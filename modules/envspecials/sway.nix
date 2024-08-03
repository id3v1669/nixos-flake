{ config
, pkgs
, ...
}: 
{
  programs.sway = {
    enable = true;
    package = pkgs.sway;
    extraOptions = [
      "--unsupported-gpu"
    ];
    extraPackages = with pkgs; [
      wdisplays
    ];
  };
}
