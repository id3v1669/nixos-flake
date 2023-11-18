{ config, lib, pkgs, uservars, ... }:
{
	home.file.".themes/dynamic-color-theme/gnome-shell/pad-osd.css".text = ''
.Leader {
  stroke-width: 0.5 !important;
  stroke: #${config.colorScheme.colors.base03};
  fill: none !important;
}

.Button {
  stroke-width: 0.25;
  stroke: #${config.colorScheme.colors.base06};
  fill: #${config.colorScheme.colors.base06};
}

.Ring {
  stroke-width: 0.5 !important;
  stroke: #${config.colorScheme.colors.base03} !important;
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
  stroke: #${config.colorScheme.colors.base06} !important;
  fill: #${config.colorScheme.colors.base03} !important;
}
  '';
}