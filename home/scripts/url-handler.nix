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
    ++ lib.lists.optionals (config.programs.spicetify.enable) [
      config.programs.spicetify.spicedSpotify
    ];
  text = let 
  spotify = if config.programs.spicetify.enable then
    ''
if [[ "$url" =~ ^https://open\.spotify\.com/ ]]; then
    spotify "$url"
    exit 0
fi ''
  else '''';
  in ''
    set +o errexit
    set +o nounset
    set +o pipefail

    url="$1"

    ${spotify}

    xdg-open "$url" || {
      echo "xdg-open failed to open the URL: $url"
      exit 1
    }
    
  '';
}
