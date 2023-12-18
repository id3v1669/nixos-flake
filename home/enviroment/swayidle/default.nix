{ pkgs
, uservars
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
      { timeout = uservars.sleeptimeout; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
    ];
    
  };
}