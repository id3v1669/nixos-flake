{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/assets/unsed.sh".text = ''
#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1b1c36/g' \
         -e 's/rgb(100%,100%,100%)/#ffffff/g' \
    -e 's/rgb(50%,0%,0%)/#16172d/g' \
     -e 's/rgb(0%,50%,0%)/#b3a1e6/g' \
 -e 's/rgb(0%,50.196078%,0%)/#b3a1e6/g' \
     -e 's/rgb(50%,0%,50%)/#1b1c36/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#1b1c36/g' \
     -e 's/rgb(0%,0%,50%)/#c1c3cc/g' \
	"$@"
  '';
}
