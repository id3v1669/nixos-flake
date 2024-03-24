{ pkgs
, ...
}: pkgs.discord.override ({
      src = builtins.fetchTarball {
        url = "https://dl.discordapp.net/apps/linux/0.0.46/discord-0.0.46.tar.gz"; #https://dl-ptb.discordapp.net/apps/linux/0.0.76/discord-ptb-0.0.76.tar.gz
        sha256 = "sha256:05gplcwx0i9rvjpi2v7749fhd11x08zk002p23g19j2nq86maw4k";
      };
      withOpenASAR = true;
      withVencord = true;
      vencord = pkgs.vencord.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "Vendicated";
          repo = "Vencord";
          rev = "v1.7.3";
          hash = "sha256-BsM7Gt1NEsZu/rxK58+Tix1xIJr6RvgbdjxVnro2soA=";
        };
      });
    })
