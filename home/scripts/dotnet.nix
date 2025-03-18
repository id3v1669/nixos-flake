{config, ...}: {
  home.file.".scripts/dotnet8.nix".text = ''
    { pkgs ? import <nixpkgs> {} }:
    let
      d8s = pkgs.dotnet-sdk_8.overrideAttrs (oldAttrs: rec {
        version = "8.0.101";
        src = pkgs.fetchurl {
            url = "https://download.visualstudio.microsoft.com/download/pr/9454f7dc-b98e-4a64-a96d-4eb08c7b6e66/da76f9c6bc4276332b587b771243ae34/dotnet-sdk-8.0.101-linux-x64.tar.gz";
            hash = "sha256-PGH/zuiUfg6tYZZ5nQWOZxsAvGuYOYPyveXSn3At4v4=";
          };
        });
      d8r = pkgs.dotnet-runtime_8.overrideAttrs (oldAttrs: rec {
        version = "8.0.1";
        src = pkgs.fetchurl {
            url = "https://download.visualstudio.microsoft.com/download/pr/8e19b03a-93be-43ae-8cd6-95b89a849572/facbb896d726a2496dd23bcecb28c9e9/aspnetcore-runtime-8.0.1-linux-x64.tar.gz";
            hash = "sha256-zYJaW9e0DlcGhA17ImULeH9x214uSWyA4WVxv1AD+P4=";
          };
        });
      d8a = pkgs.dotnet-aspnetcore_8.overrideAttrs (oldAttrs: rec {
        version = "8.0.1";
        src = pkgs.fetchurl {
            url = "https://download.visualstudio.microsoft.com/download/pr/4d5166de-c1ac-45c5-bb8a-d47f8ee93ad9/ffab59440a3eb74359dd3009e4da5a81/dotnet-runtime-8.0.1-linux-x64.tar.gz";
            hash = "sha256-0z7Pb0daI9YFj2gs+x+E65vGdUKuhk3EgFN/w0VrnLw=";
          };
        });
    in
    pkgs.mkShell {
      buildInputs = with pkgs; [
        d8s
        d8r
        d8a
        mono
      ];
    }
  '';
  home.file.".scripts/dotnet7.nix".text = ''
    { pkgs ? import <nixpkgs> {} }:
    pkgs.mkShell {
      buildInputs = with pkgs; [
        dotnet-sdk_7
        dotnet-runtime_7
        dotnet-aspnetcore_7
        mono
      ];
    }
  '';
}
