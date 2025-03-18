{
  config,
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "microphone-toggle";
  runtimeInputs = with pkgs; [
    alsa-utils
    gnugrep
    gawk
  ];
  text = ''
    set +o errexit
    set +o nounset
    set +o pipefail

    status_variants=("true" "false")
    status_to_set="false"
    current_status=$(amixer sget Capture | grep -q "\[on\]" && echo "true" || echo "false")

    if [ -n "$1" ]; then
      status_to_set=$1
      if [[ ! "''${status_variants[*]}" =~ $status_to_set ]]; then
        echo "Invalid status: $status_to_set"
        exit 1
      fi
    fi

    cards=$(aplay -l | grep card | awk -F: '{print $1}' | awk '{print $2}' | sort -u)


    while [ "$current_status" != "$status_to_set" ]; do
      for card in $cards; do
        controls=$(amixer -c "$card" scontrols)
        while IFS= read -r line; do
          if [[ $line == *Mic* ]]; then
            control=$(echo "$line" | awk -F"'" '{print $2}')
            for i in 0 1; do
              amixer -c "$card" sset "$control,$i" toggle > /dev/null
            done
          fi
        done <<< "$controls"
      done
      current_status=$(amixer sget Capture | grep -q "\[on\]" && echo "true" || echo "false")
    done
  '';
}
