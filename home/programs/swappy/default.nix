{ config
, ...
}:
{
  home.file.".config/swappy/config".text = ''
[Default]
save_dir=$HOME/Pictures/ScreenShots
save_filename_format=shot_%Y-%m-%d_%H-%M-%S.png
show_panel=true
line_size=1
text_size=12
text_font=0xProto-Nerd-Font
paint_mode=brush
early_exit=false
fill_shape=false
  '';
}