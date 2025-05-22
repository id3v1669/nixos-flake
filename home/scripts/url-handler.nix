{
  config,
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "custom-url-handler";
  runtimeInputs = with pkgs;
    [
    ]
    ++ lib.lists.optionals (config.programs.floorp.enable) [
      config.programs.floorp.package
    ];
  text = let
    spotify = ''
      if [[ "$url" =~ ^https://open\.spotify\.com/ ]]; then
          spotify "$url"
          exit 0
      fi '';
  in ''
    set +o errexit
    set +o nounset
    set +o pipefail

    url="$1"

    ${spotify}

    floorp "$url" || {
      echo "failed to open the URL: $url"
      exit 1
    }

  '';
}
