{ pkgs
, sops
, ...
}:
{
  sops.secrets."shadowsocks" = {
    sopsFile = ./../secrets/shadowsocks.enc.yaml;
    owner = "shadowsocks";
  };

  services.shadowsocks = {
    enable = true;
    #plugin = "${pkgs.shadowsocks-v2ray-plugin}/bin/v2ray-plugin";
    #passwordFile = config.sops.secrets.shadowsocks.path;
  };
  
  networking.firewall.allowedTCPPorts = [ 8388 ];
}
