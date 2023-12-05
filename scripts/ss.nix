{ config, lib, pkgs, uservars, colorsvar, ... }:
{
  home.file.".scripts/ss.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

device=$(echo $(ip route | grep default | sort -k5n | head -n1) | awk '{print $5}')

if [ ! -z "$(ip tuntap | grep tun0)" ]; then
  ip tuntap add mode tun dev tun0
  ip addr add 198.18.0.1/15 dev tun0
fi

if [ ! -z "$(pidof tun2socks)" ]; then
  kill $(pidof tun2socks)
  ip link set dev tun0 down
  ip6tables -P INPUT ACCEPT
  ip6tables -P FORWARD ACCEPT
  ip6tables -P OUTPUT ACCEPT
  ip route del default via 198.18.0.1 dev tun0
else
  ip link set dev tun0 up
  ip6tables -P INPUT DROP
  ip6tables -P FORWARD DROP
  ip6tables -P OUTPUT DROP
  ip route add default via 198.18.0.1 dev tun0 metric 50
  tun2socks -device tun0 -proxy ${proxy} -interface $device &
fi

    '';
  };
}