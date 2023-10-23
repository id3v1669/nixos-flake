{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/progress-scale.css".text = ''
/*****************
 * Progress bars *
 *****************/
GtkProgressBar {
    padding: 0;
    border-width: 0px;
    border-radius: 0px;
    border-style: solid;
    font-size: smaller;
    color: @text_color;
 }

GtkProgressBar:backdrop {
    color: @text_color; 
}

GtkProgressBar.osd {
    -GtkProgressBar-xspacing: 0;
    -GtkProgressBar-yspacing: 0;
    -GtkProgressBar-min-horizontal-bar-height: 3;
}

GtkProgressBar.trough {
    border-width: 0px;
    border-radius: 3px;
    background-color: shade(@bg_color,0.9);
    box-shadow: inset 0px -1px 0px 0px rgba(255,255,255,0.2),inset 0px 1px 0px 0px rgba(0,0,0,0.2);
}

GtkProgressBar.trough:backdrop {
    background-color: shade(@bg_color,0.9);
}

GtkProgressBar.trough.osd {
    border-style: none;
    background-color: transparent;
    box-shadow: none;
}

.progressbar,
.progressbar row,
.progressbar row:hover,
.progressbar row:selected,
.progressbar row:selected:focus {
    border-width: 0px;
    border-radius: 1.5px;
    background-color: @selected_bg_color;
    background-image: none;
    box-shadow: none;
}

.progressbar.left {
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
}

.progressbar.right {
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
}

.progressbar.vertical {
    background-color: @selected_bg_color;
    background-image: none;
}

.progressbar.vertical.bottom {
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
}

.progressbar.vertical.top {
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}

.progressbar:backdrop,
.progressbar:backdrop:hover {
    border-width: 0px;
    background-image: none;
    background-color: @selected_bg_color;
    box-shadow: none;
}
  .progressbar.osd {
    background-image: none;
    background-color: @selected_bg_color;
    border-style: none;
    border-radius: 0;
}

.trough row,
.trough row:hover {
    border: none;
    border-radius: 3px;
    background-image: none;
    background-color: shade(@bg_color,0.9);
    box-shadow: inset 0px -1px 0px 0px rgba(255,255,255,0.2),inset 0px 1px 0px 0px rgba(0,0,0,0.2);
}

.trough row:selected,
.trough row:selected:hover,
.trough row:selected:focus {
    border: none;
    border-radius: 3px;
    background-color: @base_color;
    background-image: none;
    color: @text_color;
}

/*************
 * Level Bar *
 *************/
.level-bar {
    -GtkLevelBar-min-block-width: 34;
    -GtkLevelBar-min-block-height: 3;
}

.level-bar.vertical {
    -GtkLevelBar-min-block-width: 3;
    -GtkLevelBar-min-block-height: 34;
}

.level-bar.trough,
.level-bar.trough:backdrop {
    border-width: 0px;
    padding: 2px;
    border-radius: 3px;
    background-color: shade(@bg_color,0.9);
    color: black;
    box-shadow: inset 0px -1px 0px 0px rgba(255,255,255,0.2),inset 0px 1px 0px 0px rgba(0,0,0,0.2);
}

.level-bar.fill-block,
.level-bar.fill-block:backdrop {
    border-width: 0px;
    background-color: @selected_bg_color;
    box-shadow: inset 0px -1px 0px 0px rgba(0,0,0,0.2),inset 0px 1px 0px 0px rgba(255,255,255,0.2);
    border-radius: 2px;
}

.level-bar.fill-block.indicator-discrete.horizontal {
    margin: 0 1px;
}

.level-bar.fill-block.indicator-discrete.vertical {
    margin: 1px 0;
}

.level-bar.fill-block.level-high,
.level-bar.fill-block.level-high:backdrop {
    background-color: @cyan;
}

.level-bar.fill-block.level-low,
.level-bar.fill-block.level-low:backdrop {
    background-color: @warning_bg_color;
}

.level-bar.fill-block.empty-fill-block {
    background-color: transparent;
    box-shadow: none;
}

/************
 * GtkScale *
 ************/
.scale {
    padding: 0;
    border-width: 0px;
    border-radius: 0px;
    border-style: solid;

    -GtkRange-slider-width: 12;
    -GtkRange-trough-border: 1;
    -GtkScale-slider-length: 12;
}

.scale.vertical {
    -GtkScale-slider-length: 12;
}

.scale.slider,
.scale.scale-has-marks-above.scale-has-marks-below.slider,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.slider,
.scale.slider:hover,
.scale.scale-has-marks-above.scale-has-marks-below.slider:hover,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.slider:hover,
.scale.slider:insensitive,
.scale.scale-has-marks-above.scale-has-marks-below.slider:insensitive,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.slider:insensitive,
.scale.slider:backdrop,
.scale.scale-has-marks-above.scale-has-marks-below.slider:backdrop,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.slider:backdrop {
    background-color: $red;
    background-position: center;
    background-repeat: no-repeat;

}

.scale.mark {
    border-color: shade(@bg_color, 0.8);
}

.scale.trough {
    margin: 5px 0;
}

.scale.trough.vertical {
    margin: 0 5px;
}

.scale.trough.highlight,
.scale.scale-has-marks-above.scale-has-marks-below.trough.highlight,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.trough.highlight,
.scale.trough.highlight.vertical,
.scale.scale-has-marks-above.scale-has-marks-below.trough.highlight.vertical,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.trough.highlight.vertical {
    border-width: 0px;
    background-color: @red;
    background-image: linear-gradient(to bottom,
                                      @red,
                                      @red
                                      );
    box-shadow:none;
}

.scale.trough.highlight:insensitive,
.scale.scale-has-marks-above.scale-has-marks-below.trough.highlight:insensitive,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.trough.highlight:insensitive,
.scale.trough.highlight.vertical:insensitive,
.scale.scale-has-marks-above.scale-has-marks-below.trough.highlight.vertical:insensitive,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.trough.highlight.vertical:insensitive {
    background-color: shade(@bg_color, 0.8);
    background-image: none;
    box-shadow:none;
}

.scale.trough,
.scale.scale-has-marks-above.scale-has-marks-below.trough,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.trough,
.scale.trough:insensitive,
.scale.scale-has-marks-above.scale-has-marks-below.trough:insensitive,
.scale.vertical.scale-has-marks-above.scale-has-marks-below.trough:insensitive {
    border-width: 0px;
    border-radius: 3px;
    background-color: shade(@bg_color, 0.5);
    background-image: linear-gradient(to bottom,
                                      shade(@bg_color, 0.5),
                                      shade(@bg_color, 0.5)
                                      );
    box-shadow: inset 0px -1px 0px 0px rgba(255,255,255,0.2),inset 0px 1px 0px 0px rgba(0,0,0,0.2);
}
  '';
}
