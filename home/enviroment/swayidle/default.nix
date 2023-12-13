{ pkgs
, ...
}:
{
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
    ];
    timeouts = [
      { timeout = 1200; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
    ];
    
  };
}