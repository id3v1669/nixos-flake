{
  config,
  pkgs,
  ...
}: {
  programs.aplin = {
    enable = true;
    settings = {
      command_both = "playerctl play";
      command_none = "playerctl pause";
      notification_timeout = 5;
      disconnect_timeout = 180;
      notify_on_full_charge = true;
      notify_on_25_percent = true;
      notify_on_10_percent = true;
      notify_on_anc_change = false;
    };
  };
}
