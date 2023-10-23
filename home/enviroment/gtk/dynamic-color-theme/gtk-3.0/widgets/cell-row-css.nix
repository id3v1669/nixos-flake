{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/cell-row.css".text = ''
/****************
 * cell and row *
 ****************/
.cell {
    border-width: 0;
    border-radius: 0;
}

.cell:selected,
.cell:selected:hover,
.cell:selected:focus {
    background-color: shade(@selected_bg_color, 0.9);
    background-image: linear-gradient(to bottom,shade(@selected_bg_color, 0.9),shade(@selected_bg_color, 0.9));
    color: @selected_fg_color;
    border-color: shade(@selected_bg_color, 0.9);
    border-width: 1px 0;
    border-style: solid;
}

row:selected,
row:selected:hover,
row:selected:focus {
    border-style: none;
    border-color: shade(@selected_bg_color, 0.9);
    background-color:  shade(@selected_bg_color, 0.9);
    color: @selected_fg_color;
    background-image: none;
    font: bold;
}
  '';
}
