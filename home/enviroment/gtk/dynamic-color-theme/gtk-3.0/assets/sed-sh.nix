{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/assets/sed.sh".text = ''
#!/bin/sh
sed -i \
         -e 's/#1b1c36/rgb(0%,0%,0%)/g' \
         -e 's/#ffffff/rgb(100%,100%,100%)/g' \
    -e 's/#16172d/rgb(50%,0%,0%)/g' \
     -e 's/#b3a1e6/rgb(0%,50%,0%)/g' \
     -e 's/#1b1c36/rgb(50%,0%,50%)/g' \
     -e 's/#c1c3cc/rgb(0%,0%,50%)/g' \
	"$@"
  '';
}
