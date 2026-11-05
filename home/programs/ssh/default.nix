{config, ...}: {
  sops.secrets = {
    srvcon300_ip = {};
    k3vpn_ip = {};
  };

  sops.templates."ssh-hosts".content = ''
    Host srvcon300
      HostName ${config.sops.placeholder.srvcon300_ip}

    Host k3vpn
      HostName ${config.sops.placeholder.k3vpn_ip}
  '';

  programs.ssh = {
    enable = true;
    includes = [config.sops.templates."ssh-hosts".path];
    enableDefaultConfig = false;
    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };
      srvcon300 = {
        User = "srvcon300user";
        Port = 26713;
        IdentityFile = "~/.ssh/master";
      };
      con400 = {
        User = "srvcon300user";
        Port = 26713;
        IdentityFile = "~/.ssh/id_ed_srvcon300";
        IdentitiesOnly = true;
      };
      nuc = {
        # direct LAN; name resolved by the router's DHCP DNS (IP is dynamic)
        HostName = "nuc10ch";
        User = "user";
        IdentityFile = "~/.ssh/master";
      };
      github-bot = {
        HostName = "github.com";
        IdentityFile = "~/.ssh/id_rsa_git_read_bot";
      };
      github-ai = {
        HostName = "github.com";
        IdentityFile = "~/.ssh/id_rsa_git_read_ai_proxy";
      };
      k3vpn = {
        User = "srvconauuser";
        Port = 1432;
        IdentityFile = "~/.ssh/id_rsa_k3_team";
      };
      dbr-pi = {
        HostName = "10.110.0.2";
        User = "user";
        ProxyJump = "k3vpn";
        IdentityFile = "~/Documents/dbr/pi/id_ed25519_dbr_pi";
        IdentitiesOnly = true;
      };
      "github.com" = {
        User = "git";
        IdentityFile = "~/.ssh/master";
        IdentitiesOnly = true;
        AddKeysToAgent = "yes";
      };
    };
  };
}
