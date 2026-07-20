{...}: {
  sops = {
    defaultSopsFile = ./../secrets/system/dufs.enc.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = ["/etc/ssh/system"];
  };
}
