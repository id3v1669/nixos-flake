{config, ...}: {
  sops.secrets = {
    srvcon400_ip = {};
    k3vpn_ip = {};
  };

  sops.templates."ssh-hosts".content = ''
    Host srvcon400
      HostName ${config.sops.placeholder.srvcon400_ip}

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
      srvcon400 = {
        User = "srvcon400user";
        Port = 26713;
        IdentityFile = "~/.ssh/master";
      };
      nuc = {
        HostName = "10.100.0.3";
        User = "user";
        ProxyJump = "srvcon400";
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
      "github.com" = {
        User = "git";
        IdentityFile = "~/.ssh/master";
        IdentitiesOnly = true;
        AddKeysToAgent = "yes";
      };
    };
  };
}
