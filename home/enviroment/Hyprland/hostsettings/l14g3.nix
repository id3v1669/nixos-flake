{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "move 69% 6%,    class:nm-connection-editor"
      "size 30% 65%,   class:nm-connection-editor"
      "move 66.15% 6%, class:blueman-manager"
      "size 37% 71.5%, class:blueman-manager"
      "move 66.15% 6%, class:.blueman-manager-wrapped"
      "size 37% 71.5%, class:.blueman-manager-wrapped"
    ];
    source = [
      "${config.home.homeDirectory}/.config/hypr/test.conf"
      "${config.home.homeDirectory}/.config/hypr/monitor.conf"
    ];
  };
  home.file.".scripts/screen.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      #-----------------------------------------#
      #----------------Variables----------------#

      availible_resolutions=("igpu" "egpu")

      declare -A screen1_resolutions
      screen1_resolutions["igpu"]="monitor=eDP-1,1920x1080@60,0x0,1"
      screen1_resolutions["egpu"]=""

      declare -A screen2_resolutions
      screen2_resolutions["igpu"]=""
      screen2_resolutions["egpu"]="monitor=DP-2,1920x1080@100,0x-320,1,transform,1"

      declare -A screen3_resolutions
      screen3_resolutions["igpu"]=""
      screen3_resolutions["egpu"]="monitor=DP-1,3440x1440@144,1080x0,1"

      path="${config.home.homeDirectory}/.config/hypr/monitor.conf"
      resolution=$1

      #-----------------------------------------#


      #-----------------------------------------#
      #------------------Main-------------------#

      if [ -z "$resolution" ]; then
         resolution="igpu"
      fi

      if [[ ! " ''${availible_resolutions[@]} " =~ " ''${resolution} " ]]; then
         echo "Invalid resolution"
         exit 1
      fi

      rm -f $path

      echo ''${screen1_resolutions[$resolution]} > $path
      echo ''${screen2_resolutions[$resolution]} >> $path
      echo ''${screen3_resolutions[$resolution]} >> $path
      echo "monitor=Unknown-1,disabled" >> $path

      if [ "$resolution" == "igpu" ]; then
         echo "windowrule=move 69% 6%, class:org.pulseaudio.pavucontrol" >> $path
         echo "windowrule=size 30% 65%, class:org.pulseaudio.pavucontrol" >> $path
      fi

      if [ "$resolution" == "egpu" ]; then
         echo "workspace=1, monitor:DP-1" >> $path
         echo "workspace=3, monitor:DP-1" >> $path
         echo "workspace=4, monitor:DP-1" >> $path
         echo "workspace=5, monitor:DP-1" >> $path
         echo "workspace=6, monitor:DP-1" >> $path
         echo "workspace=7, monitor:DP-1" >> $path
         echo "workspace=8, monitor:DP-1" >> $path
         echo "workspace=9, monitor:DP-1" >> $path
         echo "workspace=2, monitor:DP-2" >> $path
      fi

      # to avoid hyprctl reload before hyprland starts as script is executed by systemd
      if [ -n "$1" ]; then
      		hyprctl reload
      fi

      #-----------------------------------------#

    '';
  };
}
