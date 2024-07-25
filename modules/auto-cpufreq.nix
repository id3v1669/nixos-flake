{ ...
}: 
{
  services = {
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
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