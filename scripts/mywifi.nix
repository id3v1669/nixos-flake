{ config, lib, pkgs, uservars, ... }:

{
  home.file.".scripts/mywifi.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

modprobe mt7921u
sudo sh -c 'echo 0846 9060 > /sys/bus/usb/drivers/mt7921u/new_id'

    '';
  };
}