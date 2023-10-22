{ config, lib, pkgs, uservars, ... }:
{
  home.file.".scripts/microphone.sh" = {
    executable = true;
    text = ''
#!/run/current-system/sw/bin/bash

cards=$(aplay -l | grep card | awk -F: '{print $1}' | awk '{print $2}' | sort -u)

for card in $cards; do
  controls=$(amixer -c $card scontrols)
  while IFS= read -r line; do
    echo "Line before if: $line"
    if [[ $line == *Mic* ]]; then
      echo "Line after if: $line"
      control=$(echo "$line" | awk -F"'" '{print $2}')
      echo "Control: $control"
      for i in 0 1; do
        echo "amixer -c $card sset \"$control,$i\" toggle"
        amixer -c $card sset "$control,$i" toggle
      done
    fi
  done <<< "$controls"
done

#amixer sget Capture | grep -q "\[on\]"
    '';
  };
}