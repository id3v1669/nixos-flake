{pkgs, ...}: {
  home.packages = with pkgs; [
    shadowsocks-rust
  ];
}
