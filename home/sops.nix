{config, ...}: {
  sops = {
    defaultSopsFile = ./../secrets/user/ssh-hosts.enc.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = ["${config.home.homeDirectory}/.ssh/master"];
  };
}
