_: {
  services = {
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          scaling_min_freq = 400000;
          scaling_max_freq = 1700000;
          turbo = "never";
        };
      };
    };
  };
}
