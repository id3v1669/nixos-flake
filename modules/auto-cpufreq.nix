_: {
  services = {
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          scaling_min_freq = 2000000;
          #l14g3 is half-dead, guard to prevent crashes
          scaling_max_freq = 3600000;
          turbo = "never";
        };

        battery = {
          governor = "powersave";
          scaling_min_freq = 400000;
          scaling_max_freq = 1300000;
          turbo = "never";
        };
      };
    };
  };
}
