{ pkgs
, ...
}:
{
  home.file.".scripts/microphone.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

cards=$(aplay -l | ${pkgs.gnugrep}/bin/grep card | ${pkgs.gawk}/bin/awk -F: '{print $1}' | ${pkgs.gawk}/bin/awk '{print $2}' | sort -u)

for card in $cards; do
  controls=$(amixer -c $card scontrols)
  while IFS= read -r line; do
    echo "Line before if: $line"
    if [[ $line == *Mic* ]]; then
      echo "Line after if: $line"
      control=$(echo "$line" | ${pkgs.gawk}/bin/awk -F"'" '{print $2}')
      echo "Control: $control"
      for i in 0 1; do
        echo "amixer -c $card sset \"$control,$i\" toggle"
        amixer -c $card sset "$control,$i" toggle
      done
    fi
  done <<< "$controls"
done

#amixer sget Capture | ${pkgs.gnugrep}/bin/grep -q "\[on\]"
    '';
  };
}