{ config, lib, pkgs, uservars, brightnesctrl, ... }:
{
  programs.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
    ];
    timeout = [
      { timeout = 300; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
    ];
    
  };
}