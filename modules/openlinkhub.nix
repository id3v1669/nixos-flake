{ pkgs
, ...
}:
{
  users.users.openlinkhub = {
    isSystemUser = true;
    group = "openlinkhub";
  };
  users.groups.openlinkhub = { };
  systemd.services.OpenLinkHub = {
    description = "icue link service";
    enable = true;
    wants = [ "network.target" ];
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      User = "openlinkhub";
      Group = "openlinkhub";
      ConfigurationDirectory = "OpenLinkHub";
      ExecStartPre = "${pkgs.coreutils}/bin/cp -urv --no-preserve=mode ${pkgs.openlinkhub}/share/OpenLinkHub/database /etc/OpenLinkHub/";
      ExecStart = "${pkgs.openlinkhub}/bin/OpenLinkHub";
      NoNewPrivileges = true;
      PrivateTmp = true;
      RestrictSUIDSGID = true;
    };
  };
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", MODE="0600", OWNER="openlinkhub"
  '';
}