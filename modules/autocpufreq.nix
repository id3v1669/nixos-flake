{lib, config, pkgs, uservars, ...}: 
{
  auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        scaling_min_freq = 600000;
        scaling_max_freq = 1300000;
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}