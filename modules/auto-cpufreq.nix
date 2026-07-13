_: {
  services = {
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          scaling_min_freq = 2000000;
          turbo = "auto";
        };

        battery = {
          governor = "powersave";
          scaling_min_freq = 400000;
          scaling_max_freq = 1300000;
          # temp for waysip testing
          #scaling_min_freq = 410959;
          #scaling_max_freq = 410959;
          #turbo = "never";
        };
      };
    };
    udev.extraRules = ''
      SUBSYSTEM=="power_supply", KERNEL=="AC", ATTR{online}=="1", RUN+="/bin/sh -c 'echo performance > /sys/firmware/acpi/platform_profile'"
      SUBSYSTEM=="power_supply", KERNEL=="AC", ATTR{online}=="0", RUN+="/bin/sh -c 'echo balanced > /sys/firmware/acpi/platform_profile'"
    '';
  };
}
