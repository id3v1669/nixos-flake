{lib, config, pkgs, uservars, ...}: 
{
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  programs.noisetorch.enable = true;
  services.pipewire = {
    enable = true;
    package = pkgs.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
}