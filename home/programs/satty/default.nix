{config, ...}: {
  home.file.".config/satty/config.toml".text = ''
    [general]
    fullscreen = false
    resize = { mode="smart" }
    floating-hack = true
    corner-roundness = 12
    output-filename = "$HOME/Pictures/Screenshots/shot_%Y-%m-%d_%H:%M:%S.png"
    save-after-copy = false
  '';
}
