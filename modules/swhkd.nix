{ pkgs
, uservars
, ...
}:
{
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "com.github.swhkd.pkexec"  &&
            subject.local == true &&
            subject.active == true &&) {
                return polkit.Result.YES;
        }
    });
  '';
  environment.systemPackages = [ pkgs.over-swhkd ];

  systemd.user.services.swhkd = {
    description = "swhkd hotkey daemon";
    bindsTo = ["default.target"];
    script = ''
      /run/wrappers/bin/pkexec ${pkgs.over-swhkd}/bin/swhkd \
        --config $XDG_CONFIG_HOME/swhkd/swhkdrc \
        --cooldown 250
      '';
    serviceConfig.Restart = "always";
    wantedBy = ["default.target"];
  };
}