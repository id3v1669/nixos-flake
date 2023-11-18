{ config, lib, pkgs, uservars, ... }:
{
	home.file.".themes/dynamic-color-theme/gnome-shell/pad-osd.css".text = ''
.Leader {
  stroke-width: 0.5 !important;
  stroke: #51576d;
  fill: none !important;
}

.Button {
  stroke-width: 0.25;
  stroke: #f2d5cf;
  fill: #f2d5cf;
}

.Ring {
  stroke-width: 0.5 !important;
  stroke: #51576d !important;
  fill: none !important;
}

.Label {
  stroke: none !important;
  stroke-width: 0.1 !important;
  font-size: 0.1 !important;
  fill: transparent !important;
}

.TouchStrip,
.TouchRing {
  stroke-width: 0.1 !important;
  stroke: #f2d5cf !important;
  fill: #51576d !important;
}
  '';
}