{ uservars
, ...
}: 
{
  sops = {
    defaultSopsFile = ./../secrets/secret.enc.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${uservars.name}/.config/sops/age/keys.txt";
  };
}