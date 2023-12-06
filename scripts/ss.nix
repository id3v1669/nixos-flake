{ config, lib, pkgs, uservars, colorsvar, ... }:
{
  #Script to connect to shadowsocks.
  #Was split into 3 files due to issue with eww daemon recognition with 
  #pkexec and sudo when using a single script.
  home.file.".scripts/ss.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

if [ ! -z "$(pidof tun2socks)" ]; then
  pkexec ~/.scripts/ssdisconnect.sh
  eww update proxystatus="󰱟"
else
  pkexec ~/.scripts/ssconnect.sh
  eww update proxystatus="󰱔"
fi

    '';
  };
  home.file.".scripts/ssdisconnect.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

kill $(pidof tun2socks)
ip route del default via 198.18.0.1 dev tun0
ip link set dev tun0 down
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT
    '';
  };
  home.file.".scripts/ssconnect.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

device=$(echo $(ip route | grep default | sort -k5n | head -n1) | awk '{print $5}')

if [ -z "$(ip tuntap | grep tun0)" ]; then
  ip tuntap add mode tun dev tun0
  ip addr add 198.18.0.1/15 dev tun0
fi

ip link set dev tun0 up
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT DROP
ip route add default via 198.18.0.1 dev tun0 metric 50
tun2socks -device tun0 -proxy $(cat /run/secrets/outline) -interface $device &
eww update proxystatus="󰱔"
    '';
  };
}