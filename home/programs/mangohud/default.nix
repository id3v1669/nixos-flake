{config, ...}: {
  programs.mangohud = {
    enable = true;
  };
  home.file.".config/MangoHud/MangoHud.conf".text = ''
    vsync=-1
    gpu_stats
    gpu_temp
    cpu_stats
    cpu_temp
    cpu_mhz
    vram
    ram
    fps
    frametime
    frame_timing
    font_size=16
    text_outline
  '';
}
